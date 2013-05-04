---
layout: post
title: 用nginx+uwsgi部署Django网站
date: 2012-08-29 16:23
categories:
- Python
tags:
- django
- nginx
- uwsgi
published: true
comments: true
---
<p><p>1. 安装uwsgi:</p>
<p>pip install uwsgi</p>
<p>或</p>
<p>brew install uwsgi</p>
<p>在我的机器上安装出错，找了下面的命令才能装好：</p>
<p><!--?xml version="1.0" encoding="UTF-8" standalone="no"?--> <span style="color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 19px;">CFLAGS="-Os -w -pipe -march=core2 -msse4 -arch x86_64" LDFLAGS="-arch x86_64" pip install uwsgi</span></p>
<p><span style="color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 19px;">并且在virtualenv和外面环境中的uwsgi似乎冲突，只能在一个环境中安装</span></p>
<p><span style="color: #333333; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 19px;">2. 在项目下建立一个wsgi.py文件，内容为：</span></p>
<p>import os<br />os.environ.setdefault("DJANGO_SETTINGS_MODULE", "my_hrms.settings")</p>
<p>from django.core.wsgi import get_wsgi_application<br />application = get_wsgi_application()</p>
<p>3. 在项目下建立一个uwsgi.ini文件，内容为：</p>
<p>[uwsgi]<br /># set the http port<br />http = :9090<br />socket = /tmp/django.sock<br /># change to django project directory<br />chdir = /Users/leon/Desktop/Python<br /># load django<br />module = my_hrms.wsgi:application<br />home = /Users/leon/.virtualenvs/devlopment<br />pythonpath = /Users/leon/Desktop/Python/my_hrms</p>
<p>http是运行的端口，如果和nginx搭配也可以不写，chdir是项目所在的目录，module是项目里面的wsgi模块，home是virtualenv的目录，pythonpath用来加入项目目录到python path中。</p>
<p>4. 运行uwsgi --ini uwsgi.ini来启动uwsgi，打开浏览器输入localhost:9090就可以访问你的网站</p>
<p>5. 安装nginx：brew install nginx</p>
<p>6. 打开/usr/local/etc/nginx/nginx.conf文件加入：</p>
<p>location / {<br />     uwsgi_pass unix:///tmp/django.sock;<br />     include uwsgi_params;<br /> }</p>
<p>uwsgi_pass的参数跟uwsgi的socket一致。</p>
<p>7. 在命令行输入nginx启动nginx</p>
<p>8. 打开浏览器，输入localhost:8080就可以通过uwsgi来处理网站请求</p>
<p> </p>
<p>参考：</p>
<p><a href="http://blog.naver.com/PostView.nhn?blogId=ez_&amp;logNo=140149955374">http://blog.naver.com/PostView.nhn?blogId=ez_&amp;logNo=140149955374</a></p>
<p><a href="http://obmem.info/?p=703">http://obmem.info/?p=703</a></p>
<p><a href="http://studio.zeuik.com/?p=791">http://studio.zeuik.com/?p=791</a></p></p>
