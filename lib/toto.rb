require 'yaml'
require 'date'
require 'erb'
require 'rack'
require 'digest'
require 'open-uri'
require 'stringex'

if RUBY_PLATFORM =~ /win32/
  require 'maruku'
  Markdown = Maruku
else
  require 'rdiscount'
end

require 'builder'

require './lib/ext/ext'

module Toto
  Paths = {
    :templates => "templates",
    :pages => "templates/pages",
    :articles => "articles"
  }

  def self.env
    ENV['RACK_ENV'] || 'production'
  end

  def self.env= env
    ENV['RACK_ENV'] = env
  end

  module Template
    def to_html page, config, &blk
      path = ([:layout, :repo].include?(page) ? Paths[:templates] : Paths[:pages])
      config[:to_html].call(path, page, binding)
    end

    def markdown text
      if (options = @config[:markdown])
        Markdown.new(text.to_s.strip, *(options.eql?(true) ? [] : options)).to_html.force_encoding('utf-8')
      else
        text.strip
      end
    end

    def method_missing m, *args, &blk
      self.keys.include?(m) ? self[m] : super
    end

    def self.included obj
      obj.class_eval do
        define_method(obj.to_s.split('::').last.downcase) { self }
      end
    end
  end

  class Site
    def initialize config
      @config = config
    end

    def [] *args
      @config[*args]
    end

    def []= key, value
      @config.set key, value
    end

    def index type = :html
      articles = type == :html ? self.articles.reverse : self.articles
      {:articles => articles.map do |article|
        Article.new article, @config
      end}
    end

    def atom type = :xml
      index :xml
    end

    def archives filter = ""
      puts 'archives'
      entries = ! self.articles.empty??
        self.articles.select do |a|
          filter !~ /^\d{4}/ || File.basename(a) =~ /^#{filter}/
        end.reverse.map do |article|
          Article.new article, @config
        end : []

      return :archives => Archives.new(entries, @config)
    end

    def article route
      Article.new("#{Paths[:articles]}/#{route.join('-')}.#{self[:ext]}", @config).load
    end

    def /
      self[:root]
    end

    def go route, env = {}, type = :html
      route << self./ if route.empty?
      type, path = type =~ /html|xml|json/ ? type.to_sym : :html, route.join('/')
      context = lambda do |data, page|
        Context.new(data, @config, path, env).render(page, type)
      end

      body, status = if Context.new.respond_to?(:"to_#{type}")
        puts "route " + route.to_s
        puts "path " + path.to_s
        if route.first =~ /\d{4}/
          case route.size
            when 1..3
              context[archives(route * '-'), :archives]
            when 4
              context[article(route), :article]
            else http 400
          end
        elsif respond_to?(path)
          context[send(path, type), path.to_sym]
        elsif (repo = @config[:github][:repos].grep(/#{path}/).first) &&
              !@config[:github][:user].empty?
          context[Repo.new(repo, @config), :repo]
        else
          context[{}, path.to_sym]
        end
      else
        http 400
      end

    rescue Errno::ENOENT => e
      puts "error"
      return :body => context[{}, '404'], :type => :html, :status => 404
    else
      return :body => body || "", :type => type, :status => status || 200
    end

  protected

    def http code
      [@config[:error].call(code), code]
    end

    def articles
      self.class.articles self[:ext]
    end

    def self.articles ext
      Dir["#{Paths[:articles]}/*.#{ext}"].sort_by {|entry| File.basename(entry) }
    end

    class Context
      include Template
      attr_reader :env

      def initialize ctx = {}, config = {}, path = "/", env = {}
        puts 'Context initialize'
        puts "path= " + path
        @config, @context, @path, @env = config, ctx, path, env
        @articles = Site.articles(@config[:ext]).reverse.map do |a|
          Article.new(a, @config)
        end
        if ctx.is_a? Article
          @articles.each_with_index do |article, index|
            puts 'article class ' 
            if article.file_path == ctx.file_path
              puts 'get left and right'
              if index == 0
                @articles[index+1].load
                ctx[:right] = @articles[index+1]
              elsif index == @articles.length
                @articles[index-1].load
                ctx[:left] = @articles[index-1]
              else
                @articles[index-1].load
                @articles[index+1].load
                ctx[:left] = @articles[index-1]
                ctx[:right] = @articles[index+1]
              end
              break
            end
          end
        end

        ctx.each do |k, v|
          meta_def(k) { ctx.instance_of?(Hash) ? v : ctx.send(k) }
        end
      end

      def site_title
        @config[:site_title]
      end

      def title
        @config[:title] || @config[:site_title]
      end

      def render page, type
        puts "render " + page.to_s
        puts "type " + type.to_s
        content = to_html page, @config if type == :html
        type == :html ? to_html(:layout, @config, &Proc.new { content }) : send(:"to_#{type}", page)
      end

      def to_xml page
        puts "to_xml " + page.to_s
        xml = Builder::XmlMarkup.new(:indent => 2)
        instance_eval File.read("#{Paths[:templates]}/#{page}.builder")
      end
      alias :to_atom to_xml

      def method_missing m, *args, &blk
        puts "method_missing"
        @context.respond_to?(m) ? @context.send(m, *args, &blk) : super
      end
    end
  end

  class Repo < Hash
    include Template

    README = "https://github.com/%s/%s/raw/master/README.%s"

    def initialize name, config
      self[:name], @config = name, config
    end

    def readme
      markdown open(README %
        [@config[:github][:user], self[:name], @config[:github][:ext]]).read
    rescue Timeout::Error, OpenURI::HTTPError => e
      "This page isn't available."
    end
    alias :content readme
  end

  class Archives < Array
    include Template

    def initialize articles, config
      self.replace articles
      @config = config
    end

    def [] a
      a.is_a?(Range) ? self.class.new(self.slice(a) || [], @config) : super
    end

    def to_html
      puts "to_html"
      super(:archives, @config)
    end
    alias :to_s to_html
    alias :archive archives
  end

  class Article < Hash
    include Template

    def initialize obj, config = {}
      # puts 'article initialize'
      # p obj
      @obj, @config = obj, config
      self.load if obj.is_a? Hash
      self[:file_path] = obj
    end

    def load
      puts 'load ' 
      data = if @obj.is_a? String
        meta, self[:body] = File.read(@obj).split(/---/, 3)[1..2]

        # use the date from the filename, or else toto won't find the article
        @obj =~ /\/(\d{4}-\d{2}-\d{2})[^\/]*$/
        ($1 ? {:date => $1} : {}).merge(YAML.load(meta))
      elsif @obj.is_a? Hash
        @obj
      end.inject({}) {|h, (k,v)| h.merge(k.to_sym => v) }

      self.taint
      self.update data
      self[:date] = Date.parse(self[:date].gsub('/', '-')) rescue Date.today
      self
    end

    def [] key
      self.load unless self.tainted?
      super
    end

    def slug
      self[:slug] || self[:title].to_url
    end

    def summary length = nil
      config = @config[:summary]
      sum = if self[:body] =~ config[:delim]
        self[:body].split(config[:delim]).first
      else
        self[:body].match(/(.{1,#{length || config[:length] || config[:max]}}.*?)(\n|\Z)/m).to_s
      end
      markdown(sum.length == self[:body].length ? sum : sum.strip.sub(/\.\Z/, '&hellip;'))
    end

    def url
      "http://#{(@config[:url].sub("http://", '') + self.path).squeeze('/')}"
    end
    alias :permalink url

    def body
      p self
      p path
      markdown self[:body].sub(@config[:summary][:delim], '') rescue markdown self[:body]
    end

    def path
      "/#{@config[:prefix]}#{self[:date].strftime("/%Y/%m/%d/#{slug}/")}".squeeze('/')
    end

    def title()   self[:title] || "an article"               end
    def date()    @config[:date].call(self[:date])           end
    def author()  self[:author] || @config[:author]          end
    def to_html() self.load; super(:article, @config)        end
    def left()    self[:left]                                end
    def right()   self[:right]                               end
    def file_path()   self[:file_path]                       end
    alias :to_s to_html
  end

  class Config < Hash
    Defaults = {
      :author => ENV['USER'],                               # blog author
      :site_title => Dir.pwd.split('/').last,                    # site title
      :root => "index",                                     # site index
      :url => "http://127.0.0.1",                           # root URL of the site
      :prefix => "",                                        # common path prefix for the blog
      :date => lambda {|now| now.strftime("%d/%m/%Y") },    # date function
      :markdown => :smart,                                  # use markdown
      :disqus => false,                                     # disqus name
      :summary => {:max => 150, :delim => /~\n/},           # length of summary and delimiter
      :ext => 'md',                                        # extension for articles
      :cache => 28800,                                      # cache duration (seconds)
      :github => {:user => "", :repos => [], :ext => 'md'}, # Github username and list of repos
      :to_html => lambda {|path, page, ctx|                 # returns an html, from a path & context
        ERB.new(File.read("#{path}/#{page}.html.erb")).result(ctx)
      },
      :error => lambda {|code|                              # The HTML for your error page
        "<font style='font-size:300%'>toto, we're not in Kansas anymore (#{code})</font>"
      }
    }
    def initialize obj
      self.update Defaults
      self.update obj
    end

    def set key, val = nil, &blk
      if val.is_a? Hash
        self[key].update val
      else
        self[key] = block_given?? blk : val
      end
    end
  end

  class Server
    attr_reader :config, :site

    def initialize config = {}, &blk
      @config = config.is_a?(Config) ? config : Config.new(config)
      @config.instance_eval(&blk) if block_given?
      @site = Toto::Site.new(@config)
    end

    def call env
      @request  = Rack::Request.new env
      @response = Rack::Response.new

      return [400, {}, []] unless @request.get?

      path, mime = @request.path_info.split('.')
      route = (path || '/').split('/').reject {|i| i.empty? }

      response = @site.go(route, env, *(mime ? mime : []))

      @response.body = [response[:body]]
      @response['Content-Length'] = response[:body].bytesize.to_s unless response[:body].empty?
      @response['Content-Type']   = Rack::Mime.mime_type(".#{response[:type]}")

      # Set http cache headers
      @response['Cache-Control'] = if Toto.env == 'production'
        "public, max-age=#{@config[:cache]}"
      else
        "no-cache, must-revalidate"
      end

      @response['ETag'] = %("#{Digest::SHA1.hexdigest(response[:body])}")

      @response.status = response[:status]
      @response.finish
    end
  end
end

