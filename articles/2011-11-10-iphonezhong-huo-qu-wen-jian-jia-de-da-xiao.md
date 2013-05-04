---
layout: post
title: iphone中获取文件夹的大小
date: 2011-11-10 08:49
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p>[code lang="objc"]<br />
- (unsigned long long) folderSize:(NSString *)folder {<br />
    NSFileManager *_manager = [NSFileManager defaultManager];<br />
    NSArray *_cacheFileList;<br />
    NSEnumerator *_cacheEnumerator;<br />
    NSString *_cacheFilePath;<br />
    unsigned long long _cacheFolderSize = 0;<br />
    <br />
    _cacheFileList = [_manager subpathsAtPath:folder];<br />
    _cacheEnumerator = [_cacheFileList objectEnumerator];<br />
    while (_cacheFilePath = [_cacheEnumerator nextObject]) {<br />
        NSDictionary *_cacheFileAttributes = [_manager attributesOfItemAtPath:[folder stringByAppendingPathComponent:_cacheFilePath] error:nil];<br />
        _cacheFolderSize += [_cacheFileAttributes fileSize];<br />
    }<br />
    <br />
    return _cacheFolderSize;<br />
}
[/code]<br />
因为iphone上面只能获取文件夹节点的大小，不能获取占磁盘的大小，只能通过遍历所有文件来计算，这样计算的结果可能跟在finder中看到的结果有一点出入。返回的结果以字节计算。</p>
