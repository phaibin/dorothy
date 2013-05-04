---
layout: post
title: iphone缓存的一种策略
date: 2011-11-10 01:46
categories:
- iphone
tags:
- iphone
- 缓存
published: true
comments: true
---
<p>第一部分，直到数据被请求时才将数据加载到内存<br />
[code lang="objc"] <br />
- (id)retriveObjectNamed:(NSString *)someKey <br />
{ <br />
	id object = [self.myCache objectForKey:someKey];<br />
	if (!object) {<br />
		object= [self loadObjectNamed:someKey];<br />
		[self.myCache setObject:object forKey:someKey];<br />
	}<br />
	return object;<br />
}
[/code]<br />
缓存的第二个职责是当应用程序遇到低内存状况时能够自我清除<br />
[code lang="objc"]<br />
- (void)respondToMemoryWarning<br />
{
	[self.myCache removeAllObjects];<br />
}
[/code]</p>
