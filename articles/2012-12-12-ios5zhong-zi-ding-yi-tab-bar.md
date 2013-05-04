---
layout: post
title: iOS5中自定义tab bar
date: 2012-12-12 15:59
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>参考：<a href="http://kashiv.com/2012/05/17/create-a-twitter-like-uitabbar-using-uiappearance-proxy/">http://kashiv.com/2012/05/17/create-a-twitter-like-uitabbar-using-uiappearance-proxy/</a></p>
<p>首先在AppDelegate.m中加入：</p>
<p>[[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"YourCustomBkgImage.png"]];<br />[[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"YourCustomSelectionIndicator.png"]];<br /> <br />[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:<br /> [UIColor colorWithWhite:0.5 alpha:1], UITextAttributeTextColor,<br /> [UIColor blackColor], UITextAttributeTextShadowColor, nil]<br /> forState:UIControlStateNormal];<br />[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:<br /> [UIColor colorWithWhite:0.85 alpha:1], UITextAttributeTextColor,<br /> [UIColor blackColor], UITextAttributeTextShadowColor, nil]<br /> forState:UIControlStateSelected];</p>
<p>然后在每个viewcontroller中加入：</p>
<p>[self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_image-selected.png"] <br />withFinishedUnselectedImage:[UIImage imageNamed:@"tab_image.png"]];</p>
<p>最后的样式为：</p>
<p><img title="ios5tabbar.png" src="http://phaibin.tk/wp-content/uploads/2012/12/ios5tabbar.png" alt="ios5tabbar" width="600" height="443" border="0" /></p></p>
