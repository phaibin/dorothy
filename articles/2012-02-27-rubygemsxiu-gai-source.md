---
layout: post
title: Rubygems修改source
date: 2012-02-27 14:04
categories:
- RoR
tags:
- gem
- ruby
published: true
comments: true
---
<p><p>淘宝建了一个Rubygems的镜像，这样gem的速度就快多了，官网是<a href="http://ruby.taobao.org/">http://ruby.taobao.org/</a>。</p>
<p>修改gem的source的方法是：</p>
<pre style="margin-top: 1em; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; font-weight: normal; font-style: normal; font-size: 12px; line-height: 18px; font-family: Monaco, 'Andale Mono', 'Courier New', monospace; border-top-left-radius: 3px 3px; border-top-right-radius: 3px 3px; border-bottom-right-radius: 3px 3px; border-bottom-left-radius: 3px 3px; background-color: #eeeeee; display: block; white-space: pre-wrap; word-wrap: break-word; color: #444444; overflow-x: auto; overflow-y: auto; padding: 5px; border: 1px solid #dddddd;">$ gem sources --remove http://rubygems.org/
$ gem sources -a http://ruby.taobao.org/
$ gem sources -l
*** CURRENT SOURCES ***</pre></p>

<p>http://ruby.taobao.org<br />
# 请确保只有 ruby.taobao.org<br />
$ gem install foo
<p>或者直接修改~/.gemrc文件：</p>
<p>:sources: <br />- http://ruby.taobao.org/</p></p>
