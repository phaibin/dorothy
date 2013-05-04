---
layout: post
title: 给cocoa程序加入URL schema
date: 2011-11-05 10:43
categories:
- Cocoa
tags:
- cocoa
- url schema
published: true
comments: true
---
<p><p>类似iphone，cocoa中也可以实现URL schema（其实应该是cocoa先实现，不过我是先学iphone）。</p>
<p>加入URL schema跟iphone项目一样，参照我另一篇文章：<a href="http://phaibin.tk/实现定制的url模式">http://phaibin.tk/实现定制的url模式</a></p>
<p>然后在响应URL的类中加入注册schema的方法：</p>
<p>[[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];</p>
<p>handelURLEvent的例子是：</p>
<p>- (void)handleURLEvent:(NSAppleEventDescriptor*)event withReplyEvent:(NSAppleEventDescriptor*)replyEvent<br />{<br />NSString* url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];    <br />NSLog(@"%@", url);<br />}</p>
<p>Apple官方文档：<a href="http://developer.apple.com/mac/library/DOCUMENTATION/Cocoa/Conceptual/ScriptableCocoaApplications/SApps_handle_AEs/SAppsHandleAEs.html#//apple_ref/doc/uid/20001239-SW10">Installing a Get URL Handler</a></p>
<p>至于调用URL的方法，在iphone中是[[UIApplication sharedApplication] openURL:url]，于是我想当然的写了：</p>
<p>[NSApp openURL:url];</p>
<p>结果总是提示出错。查了半条才发现原来不是这么写的，需要这么写才对：</p>
<p>[[NSWorkspace sharedWorkspace] openURL:url];</p>
<p>很疑惑为什么是这样的。</p></p>
