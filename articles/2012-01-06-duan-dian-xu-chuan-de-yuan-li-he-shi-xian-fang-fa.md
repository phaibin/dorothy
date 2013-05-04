---
layout: post
title: 断点续传的原理和实现方法
date: 2012-01-06 15:27
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>断点续传其实很简单，就是在http header里面加入这么一句：</p>
<p>Range: bytes=1000-</p>
<p>这样如果服务器支持断点续传，就会从1000的位置开始传送，也可以写1000-2000，表示传输从1000字节到2000字节的内容。这时候服务器返回的信息会是这样的：</p>
<p>206 <br />Content-Length: 106786028 <br />Content-Range: bytes 1000-2000/106786028</p>
<p>返回的代码也变为206了。</p>
<p>在iphone里面做只需要加入这么一句就好了：</p>
<p>[request setValue:[NSString stringWithFormat:@"bytes=%d-", size] forHTTPHeaderField:@"Range"];</p>
<p>另外，找到了一个测试http连接的小工具：<a href="http://apikitchen.com/">http://apikitchen.com/</a>，可以在线测试，也有MacOS版。非常好用。</p>
<p>比如测试这个连接：</p>
<p><img title="apikitchen_1.png" src="http://phaibin.tk/wp-content/uploads/2012/01/apikitchen_1.png" border="0" alt="apikitchen_1" width="600" height="452" /></p>
<p>执行之后结果为：</p>
<p><img title="apikitchen_2.png" src="http://phaibin.tk/wp-content/uploads/2012/01/apikitchen_2.png" border="0" alt="apikitchen_2" width="600" height="452" /></p>
<p>唯一美中不足的是这个工具会把请求的文件全部获取下来，如果你测试的是一个很大的文件就不现实了。</p></p>
