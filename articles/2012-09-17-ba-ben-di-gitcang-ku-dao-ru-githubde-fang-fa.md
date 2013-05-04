---
layout: post
title: 把本地Git仓库导入Github的方法
date: 2012-09-17 22:49
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>先为Github加一个远程主机</p>
<p>$ git remote<br />origin<br />$ git remote add pb git://github.com/paulboone/ticgit.git<br />$ git remote -v<br />origin git://github.com/schacon/ticgit.git<br />pb git://github.com/paulboone/ticgit.git</p>
<p>然后把代码推送到远程主机</p>
<p>$ git push origin master</p></p>
