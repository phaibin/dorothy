---
layout: post
title: python中将unicode形式字符串转换为unicode编码（转）
date: 2012-09-21 22:45
categories:
- Python
tags: []
published: true
comments: true
---
<p><p>原文：<a href="http://hi.baidu.com/kanif/item/398612af052770ad29ce9d99">http://hi.baidu.com/kanif/item/398612af052770ad29ce9d99</a></p>
<p style="margin: 0px; padding: 0px; color: #454545; font-family: 'Microsoft Yahei', 微软雅黑, Tahoma, Arial, Helvetica, STHeiti; font-size: 14px;">  在网页抓取中，经常会遇到服务器端返回的结果为unicode形式的字符串，例如 ["j\/\u6781\u4e50\u9662\u5973\u5b50\u9ad8\u5bee\u7269\u8bed\/16\/gokujo02_139.jpg","j\/\u6781\u4e50\u9662\u5973\u5b50\u9ad8\u5bee\u7269\u8bed\/16\/gokujo02_140.jpg"]，那么如何将这种字符换转换为真正的unicode格式呢。 主要有两种方法：</p>
<p style="margin: 0px; padding: 0px; color: #454545; font-family: 'Microsoft Yahei', 微软雅黑, Tahoma, Arial, Helvetica, STHeiti; font-size: 14px;">   1. 对于json字符串可使用json.loads或者cjson.decode进行解析和转换。<br />   2. 对于非json字符串，可以自行解的unicode码后得到。</p>
[code lang="python"]<br />
def ustr2unicode(input):    <br />
    end = len(input)    <br />
    pos = 0    <br />
    output = u&quot;&quot;    <br />
    while pos &lt; end:        <br />
        if pos &lt;= end - 6 and input[pos] == '\\' and input[pos+1] == 'u':            <br />
            output += unichr(int(input[pos+2:pos+6], 16))            <br />
            pos = pos + 6        <br />
        else:            <br />
            output += unicode(input[pos])            <br />
            pos += 1    <br />
    return output<br />
[/code]</p>
