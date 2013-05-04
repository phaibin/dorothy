---
layout: post
title: Xcode 4.4中增加的“Objective-C Libterals"新语法特性
date: 2012-10-27 20:41
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>今天用Xcode建项目看到了一行很奇怪的代码：</p>
<p>[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];</p>
<p>之前从来没有见过@这样的用法，真的是太古怪了。</p>
<p>然后搜索了一下，原来是Xcode 4.4启用新的LLVM 4.0编译器之后，增加的新的Objective-C语法特性。在Xcode 4.4的release notes里面提到：</p>
<p>LLVM 4.0 Compiler</p>
<p>Xcode now includes the Apple LLVM Compiler version 4.0, including the following newObjective-C language features: [...]<br />- Objective-C literals: create literals for NSArray, NSDictionary, and NSNumber, just the same as the literals for NSString</p>
<p>就是类似NSString用@创建常量的方法，给NSArray、NSDictionary、NSNumber等几个类增加了同样的语法。</p>
<p>使用方法：</p>
<p>array = [NSArray arrayWithObjects:a, b, c, nil];       =&gt;           array = @[a, b, c];</p>
<p>dict = [NSDictionary dictionaryWithObjects:@[o1, o2, o3] forKeys:@[k1, k2, k3]];       =&gt;        dict = @{k1: o1, k2 : o2, k3 : o3};</p>
<p>number = [NSNumber numberWithChar:'x'];         =&gt;        number = @'x';</p>
<p>number = [NSNumber numberWithInt:12345];         =&gt;        number = @12345;</p>
<p>[arr objectAtIndex:index]      =&gt;        arr[index]</p>
<p>[dict objectForKey:key]       =&gt;         dict[key]</p>
<p>其实很多种语言都是这么用的，Objective-C之前的写法才古怪，但是现在写多了反而觉得不习惯了。</p>
<p>参考：</p>
<p><a href="http://stackoverflow.com/questions/9347722/what-are-the-details-of-objective-c-literals-mentioned-in-the-xcode-4-4-releas">http://stackoverflow.com/questions/9347722/what-are-the-details-of-objective-c-literals-mentioned-in-the-xcode-4-4-releas</a></p>
<p><a href="http://cocoaheads.tumblr.com/post/17757846453/objective-c-literals-for-nsdictionary-nsarray-and">http://cocoaheads.tumblr.com/post/17757846453/objective-c-literals-for-nsdictionary-nsarray-and</a></p></p>
