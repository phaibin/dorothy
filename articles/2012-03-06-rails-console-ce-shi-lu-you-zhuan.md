---
layout: post
title: Rails console 测试路由(转)
date: 2012-03-06 16:44
categories:
- RoR
tags: []
published: true
comments: true
---
<p>原文：<a href="http://wxianfeng.com/2011/03/02/rails-console-routes">http://wxianfeng.com/2011/03/02/rails-console-routes</a></p>

<p>环境:ruby 1.9.2 + rails 3.0.3</p>

<p>rails console 用起来还是很爽的,路由也可以在console下使用 , 甚至可以 get , post , 下面介绍惯用手法:</p>

<p>1,rake 查看routes
<div>
<div>
<pre>&gt;rake routes</pre>
</div>
</div>
2,console 下查看 routes
<div>
<div>
<pre>Rails.application.routes.routes # rails 2.x 使用 ActionController::Routing::Routes.routes</pre>
</div>
</div>
3, 查看 root(routes)
<div>
<div>
<pre>ruby-1.9.2-p0 &gt; app.root_path
 =&gt; "/"
ruby-1.9.2-p0 &gt; app.root_url
 =&gt; "http://www.example.com/"
ruby-1.9.2-p0 &gt; app.host = "www.wxianfeng.com"
 =&gt; "www.wxianfeng.com"
ruby-1.9.2-p0 &gt; app.root_url
 =&gt; "http://www.wxianfeng.com/"</pre>
</div>
</div>
4,查看资源 路由
<div>
<div>
<pre>ruby-1.9.2-p0 &gt;   user = User.first
  User Load (0.3ms)  SELECT `users`.* FROM `users` LIMIT 1
 =&gt; #&lt;User id: 1, login: "entos", name: "", email: "entos@entos.com", crypted_password: "3dea29b4e40bc9a70bb63678678c5ff37fe49753", salt: "2ec7e5db7f3ce5de61f1add8275b674dbd2770dc", remember_token: nil, remember_token_expires_at: nil, activation_code: nil, activated_at: nil, status: 2, suspend_at: nil, avatar_id: nil, orgunit_id: nil, mobile_phone: nil, last_login_at: nil, language: nil, options: nil, created_at: "2011-03-01 07:42:37", updated_at: "2011-03-01 07:42:37"&gt;
ruby-1.9.2-p0 &gt; app.user_path(user)
 =&gt; "/users/1"
ruby-1.9.2-p0 &gt; app.users_path
 =&gt; "/users"
ruby-1.9.2-p0 &gt; app.new_user_path
 =&gt; "/users/new"
ruby-1.9.2-p0 &gt; app.edit_user_path(:id=&gt;user.id)
 =&gt; "/users/1/edit"
ruby-1.9.2-p0 &gt; app.users_url
 =&gt; "http://www.wxianfeng.com/users"</pre>
</div>
</div>
5,不使用app调用
<div>
<div>
<pre>ruby-1.9.2-p0 &gt; include ActionController::UrlWriter
 =&gt; Object
ruby-1.9.2-p0 &gt; default_url_options[:host] = "wxianfeng.com"
 =&gt; "wxianfeng.com"
ruby-1.9.2-p0 &gt; users_url
 =&gt; "http://wxianfeng.com/users"</pre>
</div>
</div>
6,path 和 route Hash 互转
<div>
<div>
<pre>ruby-1.9.2-p0 &gt; r = Rails.application.routes
ruby-1.9.2-p0 &gt; r.generate :controller =&gt; "users" , :action=&gt;"new"
 =&gt; "/signup"
ruby-1.9.2-p0 &gt; r.generate :controller =&gt; "users" , :action=&gt;"edit" , :id=&gt;1
 =&gt; "/users/1/edit"
ruby-1.9.2-p0 &gt; r.recognize_path "/users/index"
 =&gt; {:action=&gt;"show", :controller=&gt;"users", :id=&gt;"index"}
ruby-1.9.2-p0 &gt; r.recognize_path "/users",:method=&gt;"post"
 =&gt; {:action=&gt;"create", :controller=&gt;"users"}</pre>
</div>
</div>
7,get ,post</p>

<p>模拟get访问首页，没登录 然后跳转到了/login ， 然后 post 提交登录 成功
<div>
<div>
<pre>ruby-1.9.2-p0 &gt; app.class
 =&gt; ActionDispatch::Integration::Session
ruby-1.9.2-p0 &gt; app.get "/"
 =&gt; 302
ruby-1.9.2-p0 &gt; app.controller.params
 =&gt; {"controller"=&gt;"welcome", "action"=&gt;"index"}
ruby-1.9.2-p0 &gt; app.response.redirect_url
 =&gt; "http://www.example.com/login"
ruby-1.9.2-p0 &gt; app.post "/session" , {:login=&gt;"entos",:password=&gt;"netposa"}
  SQL (0.3ms)  SHOW TABLES
  User Load (0.2ms)  SELECT `users`.* FROM `users` WHERE (status = 2) AND (`users`.`login` = 'entos') LIMIT 1
  SQL (0.1ms)  BEGIN
  User Load (0.3ms)  SELECT `users`.* FROM `users` WHERE (`users`.`id` = 1) LIMIT 1
  SQL (0.0ms)  COMMIT
 =&gt; 302
ruby-1.9.2-p0 &gt; app.controller.params
 =&gt; {"login"=&gt;"entos", "password"=&gt;"netposa", "action"=&gt;"create", "controller"=&gt;"sessions"}
ruby-1.9.2-p0 &gt; app.session[:user_id]
 =&gt; 1
ruby-1.9.2-p0 &gt; app.cookies
 =&gt; #&lt;Rack::Test::CookieJar:0xb010120 @default_host="www.example.com", @cookies=[#&lt;Rack::Test::Cookie:0x9b726f0 @default_host="www.example.com", @name_value_raw="_ent_os_session=BAh7CEkiD3Nlc3Npb25faWQGOgZFRiIlMzM4ZTdhYzU4OTY3NDhmMmZmMGFhNDkyYTExZWVmOThJIgx1c2VyX2lkBjsARmkGSSIKZmxhc2gGOwBGSUM6JUFjdGlvbkRpc3BhdGNoOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZUkiG0xvZ2dlZCBpbiBzdWNjZXNzZnVsbHkGOwBUBjoKQHVzZWRvOghTZXQGOgpAaGFzaHsA--d8652cbfebcae436e64a824d7ac2f64a81aa6619", @name="_ent_os_session", @value="BAh7CEkiD3Nlc3Npb25faWQGOgZFRiIlMzM4ZTdhYzU4OTY3NDhmMmZmMGFhNDkyYTExZWVmOThJIgx1c2VyX2lkBjsARmkGSSIKZmxhc2gGOwBGSUM6JUFjdGlvbkRpc3BhdGNoOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZUkiG0xvZ2dlZCBpbiBzdWNjZXNzZnVsbHkGOwBUBjoKQHVzZWRvOghTZXQGOgpAaGFzaHsA--d8652cbfebcae436e64a824d7ac2f64a81aa6619", @options={"path"=&gt;"/", "HttpOnly"=&gt;nil, "domain"=&gt;"www.example.com"}&gt;, #&lt;Rack::Test::Cookie:0x9b826f4 @default_host="www.example.com", @name_value_raw="auth_token=", @name="auth_token", @value="", @options={"path"=&gt;"/", "domain"=&gt;"www.example.com"}&gt;]&gt;
ruby-1.9.2-p0 &gt; app.response.redirect_url
 =&gt; "http://www.example.com/"
ruby-1.9.2-p0 &gt; app.flash
 =&gt; {:notice=&gt;"Logged in successfully"}
ruby-1.9.2-p0 &gt;</pre>
</div>
</div>
甚至 你还可以 ajax 异步提交
<div>
<div>
<pre>&gt;&gt; app.xml_http_request "/store/add_to_cart", :id =&gt; 1
=&gt; 200</pre>
</div>
</div>
8,分配一个 实例变量</p>

<p>&gt;&gt;app.assigns[:foo] = “bar”</p>

<p>SEE</p>

<p><a href="http://clarkware.com/blog/2006/04/04/running-your-rails-app-headless">http://clarkware.com/blog/2006/04/04/running-your-rails-app-headless</a>
<a href="http://blog.zobie.com/2008/11/testing-routes-in-rails/">http://blog.zobie.com/2008/11/testing-routes-in-rails/</a>
<a href="http://railstech.com/2010/06/routes-testing-in-rails/">http://railstech.com/2010/06/routes-testing-in-rails/</a>
<a href="http://stuartsierra.com/2008/01/08/testing-named-routes-in-the-rails-console">http://stuartsierra.com/2008/01/08/testing-named-routes-in-the-rails-console</a></p>
