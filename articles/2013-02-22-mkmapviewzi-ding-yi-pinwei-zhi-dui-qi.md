---
layout: post
title: MKMapView自定义pin位置对齐
date: 2013-02-22 09:25
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>原文：<a href="http://blog.csdn.net/favormm/article/details/6191109">http://blog.csdn.net/favormm/article/details/6191109</a></p>
<p>用MKAnnotationView自定义pin的时候，默认使用图片的中心点来表示pin的位置，这样有可能就会显示不正确。MKAnnotationView有个属性可以调整pin的位置：</p>
<ol class="dp-cpp" style="margin: 0px; padding: 5px 0px; border: none; position: relative; list-style-position: initial; list-style-image: initial; color: #5c5c5c; font-family: Consolas, 'Courier New', Courier, mono, serif; font-size: 12px; line-height: 26px; text-align: left;" start="1">
<li class="alt" style="margin: 0px !important; padding: 0px 3px 0px 10px !important; border: none; list-style: decimal-leading-zero outside; color: inherit; line-height: 13px;"><span style="margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;"><span class="comment" style="margin: 0px; padding: 0px; border: none; color: #999999; background-color: inherit;">// By default, the center of annotation view is placed over the coordinate of the annotation.</span><span style="margin: 0px; padding: 0px; border: none; background-color: inherit;">  </span></span></li>
<li style="margin: 0px !important; padding: 0px 3px 0px 10px !important; border: none; list-style: decimal-leading-zero outside; line-height: 13px;"><span style="margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;"><span class="comment" style="margin: 0px; padding: 0px; border: none; color: #999999; background-color: inherit;">// centerOffset is the offset in pixels from the center of the annotion view.</span><span style="margin: 0px; padding: 0px; border: none; background-color: inherit;">  </span></span></li>
<li class="alt" style="margin: 0px !important; padding: 0px 3px 0px 10px !important; border: none; list-style: decimal-leading-zero outside; color: inherit; line-height: 13px;"><span style="margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;">@property (nonatomic) CGPoint centerOffset;  </span></li>
</ol>
<div style="text-align: left;">正的值使annotation view向右下移动。</div>
<div style="text-align: left;">还有一个calloutOffset属性，用来移动callout。</div></p>
