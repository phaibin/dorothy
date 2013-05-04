---
layout: post
title: XCode4.2和iOS5中的定位
date: 2011-11-18 07:08
categories:
- iphone
tags:
- ios5
- xcode
- 定位
published: true
comments: true
---
<p><p>从Lion和XCode4.1开始就不能定位了，升级到XCode4.2之后增加了模拟定位，改变位置方便了，找自己的位置还是不太方便。要改变模拟定位，一种方法是在Schema里面：</p>
<p><img title="xcode42_location_1.png" src="http://phaibin.tk/wp-content/uploads/2011/11/xcode42_location_1.png" border="0" alt="xcode42_location_1" width="600" height="497" /></p>
<p>或者在运行的时候在debug bar改变：</p>
<p><img title="xcode42_location_2.png" src="http://phaibin.tk/wp-content/uploads/2011/11/xcode42_location_2.png" border="0" alt="xcode42_location_2" width="419" height="285" /></p>
<p>要想模拟自己的位置，需要加一个GPX文件：</p>
<p><img title="xcode42_location_3.png" src="http://phaibin.tk/wp-content/uploads/2011/11/xcode42_location_3.png" border="0" alt="xcode42_location_3" width="600" height="393" /></p>
<p>这个文件是xml格式的，可是更改为自己的经纬度。添加之后选择这个文件就可以定位到当前位置了。</p></p>
