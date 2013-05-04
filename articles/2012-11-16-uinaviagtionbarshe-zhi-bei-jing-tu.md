---
layout: post
title: UINaviagtionBar设置背景图
date: 2012-11-16 13:23
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>@implementation UINavigationBar (CustomImage)</p>
<p>-(UIImage*)barBackground<br />{<br /> return[UIImage imageNamed:@"bg_header.png"];<br />}</p>
<p>-(void)didMoveToSuperview<br />{<br /> //iOS5 only<br /> if([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])<br /> {<br /> [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];<br /> }<br />}</p>
<p>//this doesn't work on iOS5 but is needed for iOS4 and earlier<br />-(void)drawRect:(CGRect)rect<br />{<br /> //draw image<br /> [[self barBackground] drawInRect:rect];<br />}</p>
<p>@end</p>
<p>对于iOS4之前的版本需要覆盖drawRect方法，iOS5之后增加了setBackgroundImage:forBarMetrics:方法。所以需要判断是否支持这个方法。</p>
<p> </p></p>
