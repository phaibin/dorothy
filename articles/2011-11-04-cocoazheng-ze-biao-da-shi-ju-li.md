---
layout: post
title: cocoa正则表达式举例
date: 2011-11-04 06:22
categories:
- Cocoa
tags:
- cocoa
- 正则表达式
published: true
comments: true
---
<p>匹配用matchesInString方法，返回所有的匹配。然后用rangeAtIndex获取分组信息，1为第一个分组</p>

<p>[code lang="objc"]<br />
NSString *regexString = @&quot;&lt;a href=&quot;\&amp;quot;(.*)\&amp;quot;&quot; target=&quot;\&amp;quot;_blank\&amp;quot;&quot;&gt;(.*)&lt;/a&gt;&quot;;<br />
NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:NULL];<br />
NSArray *results = [regex matchesInString:text options:0 range:NSMakeRange(0, [text length])];<br />
NSMutableArray *links = [NSMutableArray array];<br />
for(id result in results)<br />
{
    NSString *url = [text substringWithRange:[result rangeAtIndex:1]];<br />
    NSString *linkString = [text substringWithRange:[result rangeAtIndex:2]];<br />
    [links addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSValue valueWithRange:[result range]], @&quot;range&quot;, url, @&quot;url&quot;, linkString, @&quot;linkString&quot;, nil]];<br />
}
[/code]<br />
非贪婪模式在后面加?，比如(.*)写为(.*?)</p>
