---
layout: post
title: 使用UINib类来提高加载Nib文件的效率
date: 2013-01-23 10:13
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>平常我们要加载一个nib文件，典型的情况就是cell用一个nib文件来设计，然后在tableview的delegate方法里面加载这个nib文件，所使用的方法是：</p>
<p>NSArray *arrayNib = [[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:self options:nil];<br />MyCell = [arrayNib objectAtIndex:0]; </p>
<p>这样的问题是，加载tableview的第一屏所有的cell的都会调用初始化，也就会load nib。</p>
<p>从4.0开始iOS增加了一个UINib类，用来加速加载nib的过程，类似Mac OS里面的NSNib类。原理就是加载了nib一次之后，会放到内存中，下次就不需要再从文件里面读取了。</p>
<p>使用方法是：</p>
<p>UINib *nib = [UINib nibWithNibName:@"MyCell" bundle:nil];<br />MyCell *myCell = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];</p></p>
