---
layout: post
title: 创建渐变的图像
date: 2011-11-04 03:43
categories:
- iphone
tags:
- cocoa2D
- iphone
published: true
comments: true
---
<p>[code lang="objc"]<br />
// create a 2 bit CGImage containing a gradient that will be used for masking the <br />
// main view content to create the 'fade' of the reflection.  The CGImageCreateWithMask<br />
// function will stretch the bitmap image as required, so we can create a 1 pixel wide<br />
// gradient<br />
CGImageRef gradientMaskImage=AEViewCreateGradientImage(1,height);</p>

<p>// Create an image by masking the bitmap of the mainView content with the gradient view<br />
// then release the  pre-masked content bitmap and the gradient bitmap<br />
CGImageRef reflectionImage=CGImageCreateWithMask(mainViewContentBitmapContext,gradientMaskImage);<br />
CGImageRelease(mainViewContentBitmapContext);<br />
CGImageRelease(gradientMaskImage);<br />
[/code]</p>

<p>[code lang="objc"]<br />
CGImageRef AEViewCreateGradientImage (int pixelsWide,<br />
									  int pixelsHigh)<br />
{
	CGImageRef theCGImage = NULL;<br />
    CGContextRef gradientBitmapContext = NULL;<br />
    CGColorSpaceRef colorSpace;<br />
	CGGradientRef grayScaleGradient;<br />
	CGPoint gradientStartPoint, gradientEndPoint;<br />
	
	// Our gradient is always black-white and the mask<br />
	// must be in the gray colorspace<br />
    colorSpace = CGColorSpaceCreateDeviceGray();<br />
	
	// create the bitmap context<br />
    gradientBitmapContext = CGBitmapContextCreate (NULL, pixelsWide, pixelsHigh,<br />
												   8, 0, colorSpace, kCGImageAlphaNone);<br />
	
	if (gradientBitmapContext != NULL) {<br />
		// define the start and end grayscale values (with the alpha, even though<br />
		// our bitmap context doesn't support alpha the gradient requires it)<br />
		CGFloat colors[] = {0.0, 1.0,1.0, 1.0,};<br />
		<br />
		// create the CGGradient and then release the gray color space<br />
		grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);<br />
		<br />
		// create the start and end points for the gradient vector (straight down)<br />
		gradientStartPoint = CGPointZero;<br />
		gradientEndPoint = CGPointMake(0,pixelsHigh);<br />
		<br />
		// draw the gradient into the gray bitmap context<br />
		CGContextDrawLinearGradient (gradientBitmapContext, grayScaleGradient, gradientStartPoint, gradientEndPoint, kCGGradientDrawsAfterEndLocation);<br />
		<br />
		// clean up the gradient<br />
		CGGradientRelease(grayScaleGradient);<br />
		<br />
		// convert the context into a CGImageRef and release the<br />
		// context<br />
		theCGImage=CGBitmapContextCreateImage(gradientBitmapContext);<br />
		CGContextRelease(gradientBitmapContext);<br />
		<br />
	}<br />
	
	// clean up the colorspace<br />
	CGColorSpaceRelease(colorSpace);<br />
	
	// return the imageref containing the gradient<br />
    return theCGImage;<br />
}
[/code]</p>
