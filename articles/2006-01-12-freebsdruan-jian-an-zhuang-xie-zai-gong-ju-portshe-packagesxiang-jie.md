---
layout: post
title: FreeBSD软件安装卸载工具--Ports和Packages详解！
date: 2006-01-12 16:12
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p>摘抄并简体化此文，与初学同仁共享。 <br /><br />＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝ <br /><br />FNP：FAQ - Ports and Packages v 1.5 <br />2004.08.20 Table of Contents <br /><br />1、如何只抓取 tarball？ <br />2、如何仅做到解开 tarball的步骤？ <br />3、如何仅做到解开 tarball 并补上官方提供的 patch？ <br />4、如何安装一个新的 port？ <br />5、如何安装一个新的 port，并将打包(package)起来？ <br />6、如何打包一个 port，并将其所有相依的 ports 也打包起来？ <br />7、如何对一个已经安装的 port 打包？ <br />8、如何清理 ports 编辑期间所产生的暂存资料？ <br />9、如何清理 ports 编辑期间所产生的暂存资料，以及其相对应的 tarball？ <br />10、如何在安装 ports 前查询所需依赖/相关的套件？ <br />11、如何移除已安装的 ports？ <br />12、如何一并移除所相依的 ports？ <br />13、如何重新安装已安装过的 ports？ <br />14、如何以关键字搜寻 ports？ <br />15、如何升级已安装的 ports？ <br />16、如何查询目前系统安装了哪些套件？ <br />17、如何查询目前系统有没有安装这个关键字的套件？ <br />18、如何查询某个档案是属於哪些套件？ <br />19、如何查询某个套件安装了哪些档案？ <br />20、如何安装旧版的 ports？ <br />21、如何更新 ports Mk？ <br />22、如何解决安装 ports 时出现 sed -i 的错误？ <br />23、如何列出所有可以升级的 ports？ <br />24、如何得知 ports system 对某个 ports 所提供的编译叁数？ <br />25、如何手动加入编译 ports 的叁数？ <br />26、如何指定 ports 的安装路径？ <br />27、安装 ports 出现 FORCE_PKG_REGISTER 的错误讯息 <br />28、安装 ports 出现 Shared object libintl.so.X not found 的错误讯息 <br />29、如何安装 packages？ <br />30、如何强制安装 packages？ <br />31、如何查询 packages 与其他 packages 之间的相依性？ <br />32、如何远端安装 packages？ <br />33、如何更新 INDEX 对照表？ <br />34、如何更新 INDEX HTML？ <br />35、如何针对某些 ports 不做 CVSup？ <br />36、如何使用 CVSup 同步 ports collections？ <br />37、安装 ports 出现 port is outdated 的错误讯息 <br />39、安装 ports 出现 OpenSSL vulnerabilities 的错误讯息 <br />40、如何在 FreeBSD 上模拟 Linux 的环境？ <br />41、如何在 FreeBSD 上安装 Linux rpm？ <br />42、安装 ports 时，原本应该出现的清单选项不见了 <br />43、如何检查是否有安装重覆的 ports/packages？ `make deinstall' 与 `pkg_delete' 有什麽不同？ <br />44、安装 ports 出现 local modification time does not match remote 的 <br />错误讯息 <br /><br /><br /><span>1、如何只抓取 tarball？</span> <br /><br />如果只希望抓取 tarball 下来的话，仅需下 make fetch 即可。 <br />如果是要抓取单一的 port，以 editors/joe 为例的话，则： <br /><br /><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/editors/joe/ <br />make fetch </td></tr></tbody></table><span class="postbody"><br /><br />预设会将 joe 的 tarball 下载至 /usr/ports/distfiles/ 目录下。 <br />如果是希望抓取安装此 ports 所有须要的其他 ports 的 tarball，以 <br /><br />systuils/portupgrade 为例的话，则： <br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/systuils/portupgrade/ <br />make fetch-recursive </td></tr></tbody></table><span class="postbody"><br /><br />预设会将此 ports 的 tarball 与所有须要的其他 ports 的 tarball，下载至 /usr/ports/distfiles/ 目录下。 <br /><br />如果是希望抓取全部所有 ports 的 tarball ，则： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/ <br />make fetch </td></tr></tbody></table><span class="postbody"><br /><br />则会所将全部所有 ports 的 tarball 下载至 /usr/ports/distfiles/ 目录下。 <br />如果是希望抓取全部 ftp 下所有 ports 的 tarball ，则： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/ftp/ <br />make fetch </td></tr></tbody></table><span class="postbody"><br /><br />则会所将全部 ftp 下所有 ports 的 tarball 下载至 /usr/ports/distfiles/ <br />目录下。 <br /><br /><span>2、如何仅做到解开 tarball的步骤？</span> <br /><br />有时候习惯自己 patch/修正 原始码的时候，很常用到这个功能。 <br />以 editors/joe 为例的话，则： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/editors/joe/ <br />make extract </td></tr></tbody></table><span class="postbody"><br /><br />会将 tarball解开至 /usr/ports/editors/joe/work/ 目录下。 <br /><br /><br /><span>3、如何仅做到解开 tarball 并补上官方提供的 patch？</span> <br /><br />此方法与 2 有一些类似，不同於是先补上官方提供的 patch ，再行 patch 自己 <br />的修正。以 editors/joe 为例的话，则： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/editors/joe/ <br />make patch </td></tr></tbody></table><span class="postbody"><br /><br />会将 tarball解开至 /usr/ports/editors/joe/work/ 目录下，并已经 patch 上 <br />官方提供的 patch。 <br /><br /><span>4、如何安装一个新的 port？</span> <br /><br />如果系统上未安装此软体，则可以选择安装一个新的 port。 <br />以 editors/joe 为例的话，则： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/editors/joe/ <br />make install </td></tr></tbody></table><span class="postbody"><br /><br />如此会在系统上安装一个新的 joe 软体。如果需要在安装完成後，一并清除编辑 <br />时期所留下来的暂存目录，则可叁考 FAQ 8 的方法，一起使用，如： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/editors/joe/ <br />#make clean </td></tr></tbody></table><span class="postbody"><br /><br />如果想要一次清掉所有 ports 产生的暂存资料，则只要回到 ports 的根目录执 <br />行即可： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/ <br />#make clean </td></tr></tbody></table><span class="postbody"><br /><br /><span>5、如何安装一个新的 port，并将打包(package)起来？</span> <br /><br />将安装完成的软体打包起来，有许多便利性：包括在丛集系统中，可供其它机器 <br />使用，或将未来此软体出问题可重新利用此 package 重新快速安装。 <br />以 editors/joe 为例的话，则： <br /><br /></span><table cellspacing="1" cellpadding="3" width="90%" align="center" border="0"><tbody><tr><td><span class="genmed"><b>代码:</b></span></td></tr><tr><td class="code">cd /usr/ports/editors/joe/ <br />#make package </td></tr></tbody></table><span class="postbody"><br /><br /></span></p>