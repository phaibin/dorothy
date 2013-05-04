---
layout: post
title: tableview隐藏section
date: 2013-01-06 17:46
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>先设置<br />tableView.sectionHeaderHeight = 0;<br />tableView.sectionFooterHeight = 0;</p>
<p>再根据需要实现：<br />- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section<br />- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section</p></p>
