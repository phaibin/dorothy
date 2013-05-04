---
layout: post
title: 给Github仓库加密
date: 2012-09-06 15:52
categories:
- Python
tags: []
published: true
comments: true
---
<p><p>准备和公司的同事一起做个小程序，想利用Github做代码托管，可是有些个人信息不能泄露，有纠结。搜了一下，居然让我发现了一个两全其美的办法。</p>
<p>解决方法就是给<a href="http://www.v2ex.com/t/25514">仓库加密</a>。</p>
<p>原理就是给git命令加一个过滤器，在提交代码的时候把代码加密，而下载下来的时候解密。这样虽然项目和项目里面的文件列表可以被别人看到，文件内容却无法读取。</p>
<p>原文在这里：<a href="https://gist.github.com/873637">https://gist.github.com/873637</a>。</p>
<p><span style="color: #ff2600;">这里面有个步骤我做下来有点问题。就是在.gitattributes文件里面加入merge节之后报错，把这个配置挪到.git/config里面之后就好了。</span></p></p>
