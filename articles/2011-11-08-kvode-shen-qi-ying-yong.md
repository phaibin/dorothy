---
layout: post
title: KVO的神奇应用
date: 2011-11-08 10:08
categories:
- Cocoa
tags:
- cocoa
- KVO
published: true
comments: true
---
<p><p>今天又见识了一段神一样的代码，来自Apple官方的CustomMenus例子：</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">/* Make sure that any key value observer of selectedImageUrl is notified when change our internal selected index.</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">Note: Internally, keep track of a selected index so that we can eaasily refer to the imageView spinner and URL associated with index. Externally, supply only a selected URL.</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">*/</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">+ (NSSet *)keyPathsForValuesAffectingSelectedImageUrl</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">{</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">return [NSSet setWithObjects:@"selectedIndex", nil];</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">}</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">selectedIndex和selectedImageUrl都是这个类的属性，这段代码的作用就是当selectedIndex这个属性修改的时候更新selectedImageUrl属性。如果由我来实现这个功能，肯定是在selectedIndex的set方法里面来更新selectedImageUrl属性，觉得不会想到这种方式。</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">另外，这个方法的名字是动态生成的，定义不同的属性会有不同的方法。</p></p>
