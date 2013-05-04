---
layout: post
title: Moutain Lion 10.8.2 开启Trim
date: 2013-02-05 00:48
categories:
- Mac
tags:
- ssd
- trim
published: true
comments: true
---
<p><p><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">第一步：</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">sudo perl -pi -e 's|(\x52\x6F\x74\x61\x74\x69\x6F\x6E\x61\x6C\x00).{9}(\x00\x4D)|$1\x00\x00\x00\x00\x00\x00\x00\x00\x00$2|sg' /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">第二步：</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">sudo kextcache -system-prelinked-kernel</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">第三步：</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">sudo kextcache -system-caches</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">第四步：</span><br style="outline: none; color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;" /><span style="color: #333333; font-family: Arial; font-size: 14px; line-height: 26px;">重启电脑</span></p></p>
