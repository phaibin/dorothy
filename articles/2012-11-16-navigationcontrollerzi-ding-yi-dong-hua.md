---
layout: post
title: NavigationController自定义动画
date: 2012-11-16 11:40
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>[UIView<br /> transitionWithView:self.navigationController.view<br /> duration:0.8<br /> options:UIViewAnimationOptionTransitionCrossDissolve<br /> animations:^{<br /> [self.navigationController pushViewController:elementController animated:NO];<br /> [elementController release];<br /> } completion:NULL];</p></p>
