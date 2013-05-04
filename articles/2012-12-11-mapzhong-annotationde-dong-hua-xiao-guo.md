---
layout: post
title: map中Annotation的动画效果
date: 2012-12-11 11:49
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>如果用<a style="color: #003366; text-decoration: none; font-family: Courier, Consolas, monospace; font-size: 13px;" href="https://developer.apple.com/library/ios/documentation/MapKit/Reference/MKPinAnnotationView_Class/Reference/Reference.html#//apple_ref/occ/cl/MKPinAnnotationView" target="_self">MKPinAnnotationView</a>，可以用<span style="font-size: 13px; white-space: nowrap;">animatesDrop属性来控制动画落下的效果。但是要自定义annotation的样式只能用MKAnnotationView，</span></p>
<p><span style="font-size: 13px; white-space: nowrap;">这样需要在delegate方法</span></p>
<p><span style="font-size: 13px; white-space: nowrap;">- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views</span></p>
<p><span style="font-size: 13px; white-space: nowrap;">中来控制：</span></p>
<p>MKAnnotationView *aV;<br />for (aV in views) {<br /> CGRect endFrame = aV.frame;<br /> <br /> aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - 300, aV.frame.size.width, aV.frame.size.height);<br /> <br /> [UIView beginAnimations:nil context:NULL];<br /> [UIView setAnimationDuration:0.45];<br /> [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];<br /> [aV setFrame:endFrame];<br /> [UIView commitAnimations];<br />}</p>
<p><span style="font-size: 13px; white-space: nowrap;">用控制动画一个一个落下的效果，在给mapview加annotation的时候加一个延迟：</span></p>
<p><span style="font-size: 13px; white-space: nowrap;">[mapView performSelector:@selector(addAnnotation:) withObject:annotation afterDelay:0.2*i];</span></p></p>
