# encoding: utf-8

require './lib/toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  set :author,    '文祥'                               # blog author
  set :site_title,     '海神'                   # site title
  # set :root,      "index"                                   # page to load on /
  set :date,      lambda {|now| now.strftime("%Y.%m.%d") }  # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    'phaibin'                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  set :ext,       'md'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds
end

run toto


