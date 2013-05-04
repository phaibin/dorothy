---
layout: post
title: Internet Explorer conditional comments
date: 2012-03-14 15:44
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>原来HTML针对IE有一种特殊的写法，可以根据IE的版本输出不同的信息：</p>
<pre style="font-family: monospace; color: #070606; background-color: #eef0eb; margin-top: 2em; margin-right: -334px; margin-bottom: 2em; padding-top: 1em; padding-right: 0px; padding-bottom: 1em; border-top-width: 1px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 12px; line-height: 18px; margin-left: -233px; padding-left: 233px; zoom: 1; border-color: #b7c4d3; border-style: dotted;">&lt;p class="accent"&gt;
&lt;!--[if IE]&gt;
According to the conditional comment this is IE&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if IE 6]&gt;
According to the conditional comment this is IE 6&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if IE 7]&gt;
According to the conditional comment this is IE 7&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if IE 8]&gt;
According to the conditional comment this is IE 8&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if IE 9]&gt;
According to the conditional comment this is IE 9&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if gte IE 8]&gt;
According to the conditional comment this is IE 8 or higher&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if lt IE 9]&gt;
According to the conditional comment this is IE lower than 9&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if lte IE 7]&gt;
According to the conditional comment this is IE lower or equal to 7&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if gt IE 6]&gt;
According to the conditional comment this is IE greater than 6&lt;br /&gt;
&lt;![endif]--&gt;
&lt;!--[if !IE]&gt; --&gt;
According to the conditional comment this is not IE&lt;br /&gt;
&lt;!-- &lt;![endif]--&gt;
&lt;/p&gt;</pre>
<p>这种写法真的很神奇。平时用应该只需要判断是不是IE就可以了。HAML写法：</p>
<pre class="code" style="color: #000000; font-family: monospace; display: block; padding-top: 5px; padding-right: 12px; padding-bottom: 5px; padding-left: 12px; margin-top: 4px; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: #f5f5ff; background-position: initial initial; background-repeat: initial initial; border: 1px solid #eeeeff;">/[if IE]
  %a{ :href =&gt; 'http://www.mozilla.com/en-US/firefox/' }
    %h1 Get Firefox</pre></p>
