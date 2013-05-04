---
layout: post
title: Cocoa中改变菜单
date: 2011-10-28 11:06
categories:
- Cocoa
tags:
- cocoa
- 菜单
published: true
comments: true
---
<p><p>实现NSWindowDelegate的方法：</p>
<p>- (void)windowDidBecomeKey:(NSNotification *)notification</p>
<p>然后调用NSApplication的- (void)setMainMenu:(NSMenu *)aMenu方法</p></p>
