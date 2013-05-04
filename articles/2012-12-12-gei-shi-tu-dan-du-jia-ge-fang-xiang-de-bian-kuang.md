---
layout: post
title: 给视图单独加一个方向的边框
date: 2012-12-12 15:42
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>CALayer *bottomBorder = [CALayer layer];<br />bottomBorder.frame = CGRectMake(0.0f, 43.0f, toScrollView.frame.size.width, 1.0f);<br />bottomBorder.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;<br />[toScrollView.layer addSublayer:bottomBorder];</p></p>
