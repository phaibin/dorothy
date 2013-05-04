---
layout: post
title: Cocoa建立Framework的注意事项
date: 2011-10-28 02:20
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
<p><p>设置项目属性里面的Installation Directory为@executable_path/../Frameworks，不然会出现这样的错误：</p>
<p>Library not loaded: path/to/framework<br />Referenced from: path/to/app/<br />Reason: image not found</p>
<p>在Target的Build Phases里面设置公开的头文件。</p></p>
