---
layout: post
title: GPS开启状态判断
date: 2012-12-18 11:53
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>[CLLocationManager locationServicesEnabled]</p>
<p>这个是判断整个手机的GPS开启情况</p>
<p>[CLLocationManager authorizationStatus]</p>
<p>这个是判断单个app的GPS开启情况，返回值有4种情况：</p>
<p>kCLAuthorizationStatusNotDetermined：用户还没有选择<br />kCLAuthorizationStatusRestricted：app没有授权使用GPS<br />kCLAuthorizationStatusDenied：用户显示地禁用了GPS<br />kCLAuthorizationStatusAuthorized：允许使用</p></p>
