---
layout: post
title: Bitbucket加入本地版本库的方法
date: 2012-03-13 15:29
categories:
- RoR
tags: []
published: true
comments: true
---
<p><ul style="margin-top: 1em; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0.25em; padding-left: 2.5em;">
<li>Create a repo on Bitbucket</li>
<li>Change the origin url in the local repo
<pre style="font-size: 0.77em; font-family: Menlo, Consolas, 'Andale Mono', 'Lucida Console', 'Nimbus Mono L', 'DejaVu Sans Mono', monospace, 'Courier New'; background-color: rgba(40, 40, 0, 0.0585938); margin-top: 10px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; overflow-x: hidden; overflow-y: hidden; white-space: pre-wrap; padding: 15px;">git remote set-url origin [Bitbucket url to your repo]</pre>
</li>
<li>Push the code back
<pre style="font-size: 0.77em; font-family: Menlo, Consolas, 'Andale Mono', 'Lucida Console', 'Nimbus Mono L', 'DejaVu Sans Mono', monospace, 'Courier New'; background-color: rgba(40, 40, 0, 0.0585938); margin-top: 10px; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; overflow-x: hidden; overflow-y: hidden; white-space: pre-wrap; padding: 15px;">git push origin master</pre>
</li>
</ul></p>
