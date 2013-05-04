---
layout: post
title: Mac中为全部应用程序设置环境变量
date: 2012-08-16 09:55
categories:
- Mac
tags: []
published: true
comments: true
---
<p><p>当我们在/etc/paths或者/etc/bashrc中设置环境变量时，实际上受影响的只有控制台程序，一个图形界面程序是不受这些变量影响的。不过当从控制台启动图形界面程序的时候，这些程序也可以读取到控制台里面的环境变量。</p>
<p>给全部GUI或者控制台程序设置环境变量的地方是/etc/launchd.conf文件。</p>
<ul>
<li>environment.plist只对从spotlight启动的程序起作用</li>
<li>/etc/paths只针对控制台</li>
<li>/etc/csh.cshrc和/etc/bashrc只针对某些shell</li>
</ul>
<p>比如在这个文件中加入：</p>
<p>setenv PATH /usr/local/bin:/usr/bin</p>
<p>参考：<a href="http://serverfault.com/questions/16355/how-to-set-global-path-on-os-x/277034#277034">http://serverfault.com/questions/16355/how-to-set-global-path-on-os-x/277034#277034</a></p></p>
