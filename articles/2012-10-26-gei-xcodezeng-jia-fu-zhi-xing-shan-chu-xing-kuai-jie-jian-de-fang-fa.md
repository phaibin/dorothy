---
layout: post
title: 给Xcode增加复制行、删除行快捷键的方法
date: 2012-10-26 01:02
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>参考：</p>
<p><a href="http://stackoverflow.com/questions/551383/xcode-duplicate-delete-line">http://stackoverflow.com/questions/551383/xcode-duplicate-delete-line</a></p>
<p><a href="http://stackoverflow.com/questions/10266170/xcode-4-duplicate-line">http://stackoverflow.com/questions/10266170/xcode-4-duplicate-line</a></p>
<p>适用于最新的Xcode 4.5.1</p>
<p>运行：</p>
<p>sudo chmod 666 /Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/IDETextKeyBindingSet.plist</p>
<p>然后打开/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/IDETextKeyBindingSet.plist，在Deletions下面增加：Delete Current Line，值为：</p>
<p>deleteToBeginningOfLine:, moveToEndOfLine:, deleteToBeginningOfLine:, deleteBackward:, moveDown:, moveToBeginningOfLine:</p>
<p>在Insertions and Indentations下面增加：Duplicate Current Line，值为：</p>
<p>selectLine:, copy:, moveToEndOfLine:, insertNewline:, paste:, deleteBackward:</p>
<p>然后重启Xcode，打开设置，Key Bindings，找到“Delete Current Line"和”Duplicate Current Line"这两项，设置为自己想要的快捷键。</p></p>
