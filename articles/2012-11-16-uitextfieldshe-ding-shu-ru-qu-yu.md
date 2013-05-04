---
layout: post
title: UITextField设定输入区域
date: 2012-11-16 14:24
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>UITextField设置边界为无之后，输入光标会从左边界开始。</p>
<p><img title="NewImage.png" src="http://phaibin.tk/wp-content/uploads/2012/11/NewImage1.png" alt="NewImage" width="280" height="80" border="0" /></p>
<p>要自定义输入位置，或者使用图片，或者定义一个UITextField的子类，然后覆盖下面的方法：</p>
<p>// placeholder position<br />- (CGRect)textRectForBounds:(CGRect)bounds {<br /> return CGRectInset(bounds, 10, 10);<br />}</p>
<p>// text position<br />- (CGRect)editingRectForBounds:(CGRect)bounds {<br /> return CGRectInset(bounds, 10, 10);<br />}</p>
<p><img title="NewImage.png" src="http://phaibin.tk/wp-content/uploads/2012/11/NewImage.png" alt="NewImage" width="270" height="63" border="0" /></p></p>
