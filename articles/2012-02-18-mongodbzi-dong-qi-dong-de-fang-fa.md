---
layout: post
title: MongoDB自动启动的方法
date: 2012-02-18 22:54
categories:
- RoR
tags:
- mongodb
published: true
comments: true
---
<p><p>用homebrew装完mongodb之后就会有一个提示，或者打命令：brew info mongo也可以显示：</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">mongodb 2.0.2-x86_64</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">http://www.mongodb.org/</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">/usr/local/Cellar/mongodb/2.0.2-x86_64 (18 files, 121M)</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">If this is your first install, automatically load on login with:</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">mkdir -p ~/Library/LaunchAgents</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">cp /usr/local/Cellar/mongodb/2.0.2-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">If this is an upgrade and you already have the homebrew.mxcl.mongodb.plist loaded:</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">cp /usr/local/Cellar/mongodb/2.0.2-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">Or start it manually:</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">The launchctl plist above expects the config file to be at /usr/local/etc/mongod.conf.</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">If this is a first install, you can copy one from /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf:</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">cp /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf /usr/local/etc/mongod.conf</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">http://github.com/mxcl/homebrew/commits/master/Library/Formula/mongodb.rb</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;"> </p>
<p>所以加入自动启动的方法就是：</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">mkdir -p ~/Library/LaunchAgents</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">cp /usr/local/Cellar/mongodb/2.0.2-x86_64/homebrew.mxcl.mongodb.plist ~/Library/LaunchAgents/</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">cp /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf /usr/local/etc/mongod.conf</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;"> </p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">因为homebrew.mxcl.mongodb.plist里面把mongod文件的位置设为了/usr/local/bin/mongod,所以要确保你的这个文件确实存在。</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">安装完之间可以检查mongod进程是否已经存在，还可以访问http://localhost:28017来检查mongod的状态。</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">启动和停止mongod服务的方法是：</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">launchctl start homebrew.mxcl.mongodb</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;">launchctl stop homebrew.mxcl.mongodb</p>
<p style="font: normal normal normal 12px/normal Monaco; margin: 0px;"> </p>
<p>通过网页方式访问服务器的时候可能会出一个提示：REST is not enabled，解决方法是在/usr/local/etc/mongod.conf中加入：rest = true。</p></p>
