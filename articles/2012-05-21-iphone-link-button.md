---
layout: post
title: iphone Link button
date: 2012-05-21 22:42
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">UIUnderlinedButton.h</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">@interface UIUnderlinedButton : UIButton {</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">}</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">+ (UIUnderlinedButton*) underlinedButton;</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">@end</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">UIUnderlinedButton.m</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">@implementation UIUnderlinedButton</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco; min-height: 16.0px;"> </p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">+ (UIUnderlinedButton*) underlinedButton {</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">UIUnderlinedButton* button = [[UIUnderlinedButton alloc] init];</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">return [button autorelease];</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">}</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">- (void) drawRect:(CGRect)rect {</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGRect textRect = self.titleLabel.frame;</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">// need to put the line at top of descenders (negative value)</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGFloat descender = self.titleLabel.font.descender;</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGContextRef contextRef = UIGraphicsGetCurrentContext();</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">// set to same colour as text</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.textColor.CGColor);</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender);</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender);</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGContextClosePath(contextRef);</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">CGContextDrawPath(contextRef, kCGPathStroke);</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Monaco;">}</p></p>
