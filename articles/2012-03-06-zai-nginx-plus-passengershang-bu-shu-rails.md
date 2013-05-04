---
layout: post
title: 在Nginx+Passenger上部署Rails
date: 2012-03-06 16:27
categories:
- RoR
tags: []
published: true
comments: true
---
<p>首先gem install passenger</p>

<p>然后sudo passenger-install-nginx-module。安装的过程会提示PCRE找不到，可以先手动装一个PCRE。安装的方法是去官网下载源码然后./configure，sudo make install。</p>

<p>默认安装在/opt/nginx下面，配置文件是/opt/nginx/conf/nginx.conf。安装完之后会自动在http段加上：</p>

<p>passenger_root /usr/local/Cellar/ruby/1.9.3-p0/lib/ruby/gems/1.9.1/gems/passenger-3.0.11;   <br />
passenger_ruby /usr/local/Cellar/ruby/1.9.3-p0/bin/ruby;</p>

<p>然后把server段改为：</p>

<p>server {<br />
listen 80;<br />
server_name www.yourhost.com;<br />
root /somewhere/public;   # <--- be sure to point to 'public'!<br />
passenger_enabled on;<br />
}</p>

<p>启动Nginx：sudo /opt/nginx/sbin/nginx<br />
这样启动之后会报一个错误："Couldn't forward the HTTP response back to the HTTP client"</p>

<p>原因是Nginx默认以nobody用户启动，这样nginx目录下的proxy_temp目录就没有权限操作。</p>

<p>解决的办法是在nginx.conf文件中加入</p>

<p>user leon admin;</p>

<p>这样就会以leon用户来启动nginx进程，admin代表用户的group。</p>

<p>要改变rails的环境可以在server中加入：</p>

<p>rails_env development;</p>

<p>停止和重启nginx的方法：</p>

<p>nginx -s stop</p>

<p>nginx -s reload</p>
