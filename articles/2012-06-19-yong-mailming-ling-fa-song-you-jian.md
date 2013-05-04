---
layout: post
title: 用mail命令发送邮件
date: 2012-06-19 13:43
categories:
- Mac
tags:
- mac
published: true
comments: true
---
<p><p>首先编辑/etc/mail.rc文件，加入：</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">set from=me@wen.com</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">set smtp=smtp.wen.com</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">set smtp-auth-user=me@wen.com</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;">set smtp-auth-password=123456</p>
<p style="margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica;"> </p>
<p>直接发送：</p>
<p>echo "Test from mail command" | mail -s "title" xxx@gmail.com -f from@gmail.com -c contact2@gmail.com,contact3@gmail.com -b secret@gmail.com</p>
<p>-s指定邮件标题</p>
<p>-f指定发件人</p>
<p>-c抄送，后面是逗号连接的地址</p>
<p>-b密送</p>
<p>正文在文件中：</p>
<p>cat content.txt | mail -s "title" xxx@gmail.com</p>
<p>或</p>
<p>mail -s "title" xxx@gmail.com &lt; content.txt</p>
<p>发送附件：</p>
<p>uuencode ~/Desktop/test.jpg test.jpg | mail -s "title" xxx@gmail.com</p>
<p>uuencode第一个参数是附件，第二个参数是附件的标题</p>
<p>发送附件和正文：</p>
<p>(cat content.txt;uuencode ~/Desktop/test.jpg test.jpg) | mail -s "title" xxx@gmail.com</p></p>
