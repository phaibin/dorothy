---
layout: post
title: 'Django在syncdb时出现“ValueError: unknown locale: UTF-8″ 的解决办法'
date: 2012-06-25 10:47
categories:
- Python
tags:
- django
published: true
comments: true
---
<p><p>参考<a href="http://patrick.arminio.info/blog/2012/02/fix-valueerror-unknown-locale-utf8/">http://patrick.arminio.info/blog/2012/02/fix-valueerror-unknown-locale-utf8/</a></p>
<p>在.bash_profile中加入：</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LANG="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_COLLATE="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_CTYPE="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_MESSAGES="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_MONETARY="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_NUMERIC="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_TIME="zh_CN.UTF-8"</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">export LC_ALL=</p>
<p>zh_CN是你本地的语言代码。</p></p>
