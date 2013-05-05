---
layout: post
title: BYDialog变模糊的原因
date: 2012-01-11 23:42
categories:
- iphone
tags:
- bydialog
- iphone
published: true
comments: true
---
<p><p>在项目里面用了别人写的一个模式对话框，名字叫BYDialog。刚开始没有发现什么问题，可是今天加入美工做的一个图片进去，发现图片显示的很模糊。模拟器和真机都试验了，都是一样的。跟美工确认过了图片是没有问题的。我再对着界面端详一会，突然发现不只是图片，就连按钮和文字都是模糊的，那就肯定不是图片的问题了。</p>
<p>因为这个对话框弹出的过程会做一些几何变换，我就想会不会是变换的过程中frame发生了变化，导致view失真呢。然后我调试了一下，发现大小没有变，跟设计的时候是一模一样的。既然这个控件有问题，我就试着用一些别的方法来显示这个对话框，可是总是不太理想。没办法，还是先用回BYDialog，模糊先放着慢慢解决。然后我又在作者的主页留了言，希望能得到一些解答。</p>
<p>晚上回到家，没想到作者已经留了言。作者的估计是frame中有小数，解决的方法就是用CGRectIntegral转换一下。可是我调试的时候大小根本没有小数的，跟nib里面的是一样的。抱着再试一试的心情我又调试了一下，打印view的frame。这次的结果让我眼前一亮：</p>
<p><img title="ByDialog_frame.jpg" src="http://phaibin.tk/wp-content/uploads/2012/01/ByDialog_frame.jpg" border="0" alt="ByDialog_frame.jpg" width="597" height="34" /></p>
<p>frame的大小确实没有小数，值也是对的，但是前面的x，y就比较奇怪了，带了.5的小数。我只注意了大小，却没注意前面的坐标有问题。难怪显示会变模糊。</p>
<p>经过用CGRectIntegral转换，问题迎刃而解了，有高手指点就是不一样。哈哈，好高兴。</p></p>