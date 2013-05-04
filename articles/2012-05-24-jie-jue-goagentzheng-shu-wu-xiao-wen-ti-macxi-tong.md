---
layout: post
title: 解决GoAgent证书无效问题（mac系统）
date: 2012-05-24 07:09
categories:
- Mac
tags: []
published: true
comments: true
---
<p><ul style="font-family: inherit; font-size: 15px; font-style: inherit; font-weight: inherit; margin-top: 0px; margin-right: 0px; margin-bottom: 1.625em; margin-left: 2.5em; outline-width: 0px; outline-style: initial; outline-color: initial; vertical-align: baseline; list-style-type: square; list-style-position: initial; list-style-image: initial; padding: 0px; border: 0px initial initial;">
<li style="font-family: inherit; font-size: 15px; font-style: inherit; font-weight: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; vertical-align: baseline; padding: 0px; margin: 0px; border: 0px initial initial;">双击 GoAgent/local 目录下的 CA.crt 证书导入到系统</li>
<li style="font-family: inherit; font-size: 15px; font-style: inherit; font-weight: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; vertical-align: baseline; padding: 0px; margin: 0px; border: 0px initial initial;">在 Launchpad &gt; 实用工具 &gt; 钥匙串访问 &gt; 系统 中找到 GoAgent CA 并双击</li>
<li style="font-family: inherit; font-size: 15px; font-style: inherit; font-weight: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; vertical-align: baseline; padding: 0px; margin: 0px; border: 0px initial initial;"><strong style="font-family: inherit; font-size: 15px; font-style: inherit; font-weight: bold; outline-width: 0px; outline-style: initial; outline-color: initial; vertical-align: baseline; padding: 0px; margin: 0px; border: 0px initial initial;">选择 信任 &gt; 使用此证书时 &gt; 总是信任</strong></li>
<li style="font-family: inherit; font-size: 15px; font-style: inherit; font-weight: inherit; outline-width: 0px; outline-style: initial; outline-color: initial; vertical-align: baseline; padding: 0px; margin: 0px; border: 0px initial initial;">重启浏览器</li>
</ul></p>
