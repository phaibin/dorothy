---
layout: post
title: TextMate运行Python的UnitTest
date: 2012-07-06 16:12
categories:
- Python
tags:
- python
- textmate
published: true
comments: true
---
<p><p>在PyDev对UnitTest做了很好的集成，包括创建测试类，对整个项目跑测试。可是没想到，在TextMate中一样可以做。</p>
<p>首先，单个的测试模块需要加入：</p>
<p>if __name__ == "__main__":</p>
<p>unittest.main()</p>
<p>这样就可以用cmd+R来运行单个模块里面的测试。</p>
<p>另外还有一个快捷键：shift+option+cmd+R，可以运行整个项目里面的测试。不过模块命名有一定的限制：</p>
<ul>
<li>模块名应该为XXXTest.py这种形式</li>
<li>测试方法应该为testXXX这种形式</li>
</ul></p>
