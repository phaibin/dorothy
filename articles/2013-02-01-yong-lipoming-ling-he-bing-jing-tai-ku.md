---
layout: post
title: 用lipo命令合并静态库
date: 2013-02-01 13:46
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>参考：<a href="http://blog.csdn.net/arthurchenjs/article/details/6044616">http://blog.csdn.net/arthurchenjs/article/details/6044616</a></p>
<p>lipo –create Release-iphoneos/libiphone.a Debig-iphonesimulator/libiphone.a –output libiphone.a</p>
<p>这样生成的库可以在编译的时候自动识别。</p>
<p>lipo -info libiphone.a</p>
<p>可以查看这个库编译的平台</p></p>
