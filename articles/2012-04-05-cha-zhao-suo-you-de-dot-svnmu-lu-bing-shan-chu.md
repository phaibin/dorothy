---
layout: post
title: 查找所有的.svn目录并删除
date: 2012-04-05 14:15
categories:
- Mac
tags:
- mac
published: true
comments: true
---
<p><p>cd /some/of/your/folders/</p>
<p>rm -rf `find . -type d -name .svn`</p></p>
