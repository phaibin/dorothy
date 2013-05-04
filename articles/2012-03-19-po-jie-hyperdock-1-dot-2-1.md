---
layout: post
title: 破解hyperdock 1.2.1
date: 2012-03-19 15:42
categories:
- Mac
tags: []
published: true
comments: true
---
<p><p>原帖：<a href="http://bbs.weiphone.com/read-htm-tid-4237609.html">http://bbs.weiphone.com/read-htm-tid-4237609.html</a></p>
<p>1. 下载hyperdock 1.2.1(包含一个无效的证书),先安装hyperdock,然后双击证书,使软件变成已注册状态(通常这个状态只能持续到下次开机). 2. 双击证书后,立马在finder中找到 "/Library/PreferencePanes/HyperDock.prefpane" ,把HyperDock.prefpane改为HyperDock,即去掉后缀名. 3. 打开系 "统偏好设置-安全性与隐私-防火墙" ,打开防火墙,右下角高级添加 "/Library/PreferencePanes/HyperDock/Contents/Resources/HyperDock Helper.app" .选择阻止网络连接.这样hyperdock不会再检查证书的真伪性了. 4. 将 "/Library/PreferencePanes/HyperDock" 改回 "/Library/PreferencePanes/HyperDock.prefpane"</p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p></p>
