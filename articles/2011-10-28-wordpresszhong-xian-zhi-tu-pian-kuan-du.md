---
layout: post
title: Wordpress中限制图片宽度
date: 2011-10-28 09:24
categories:
- Wordpress
tags:
- Wordpress
published: true
comments: true
---
<p><p>解决的方法有二：</p>
<ol>
<li>
<p>每次上传宽度超过500px的图片都指定宽度为500px，高度不设定。浏览器会自动保持比例。</p>
</li>
<li>在style.css中加上如下代码</li>
</ol>
<p>
<p>/* Image MaxWidth Setting */</p>
<p>img {</p>
<p>max-width: 500px;</p>
<p>width: expression(this.width &gt; 500 ? 500 : this.width);</p>
<p>height: auto;</p>
<p>}</p>
</p>
<ol>
<p>其中两种不同的宽度设置是为了兼容浏览器，高度auto是为了保持比例。</p>
</ol>
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">/* Image MaxWidth Setting */</div>
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">img {</div>
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">max-width: 500px;</div>
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">width: expression(this.width &gt; 500 ? 500 : this.width);</div>
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">height: auto;</div>
<div id="_mcePaste" class="mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">}<span style="font-family: 'Heiti SC Light'; font-size: 12px;">/* Image MaxWidth Setting */</span></div>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">img {</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">max-width: 500px;</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">width: expression(this.width &gt; 500 ? 500 : this.width);</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">height: auto;</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px 'Heiti SC Light';">}</p>
</div></p>
