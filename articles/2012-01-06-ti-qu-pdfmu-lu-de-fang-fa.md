---
layout: post
title: 提取pdf目录的方法
date: 2012-01-06 14:54
categories:
- iphone
tags:
- iphone
- pdf
published: true
comments: true
---
<p><p>理论知识：<a href="http://stackoverflow.com/questions/4643489/how-do-i-retrieve-a-page-number-or-page-reference-for-an-outline-destination-in">http://stackoverflow.com/questions/4643489/how-do-i-retrieve-a-page-number-or-page-reference-for-an-outline-destination-in</a></p>
<p>原理就是：通过CGPDFDocumentGetCatalog方法可以获取pdf的元信息，这是一个类似Dictionary的结构，而目录信息就放在里面，需要自己解析出来。</p>
<p>在这里：<a href="https://github.com/below/PDF-Voyeur">https://github.com/below/PDF-Voyeur</a>有一个人写的开源项目，可以查看pdf的元信息，而我也是根据他的代码来找出pdf的目录的。</p>
<p>比如这本书：</p>
<p><img title="iphone_outlines.png" src="http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines.png" border="0" alt="iphone_outlines" width="286" height="198" /></p>
<p>用PDF-Voyeur打开之后看到的是这样的：</p>
<p><img title="Voyeur_iphone.png" src="http://phaibin.tk/wp-content/uploads/2012/01/Voyeur_iphone.png" border="0" alt="Voyeur_iphone" width="600" height="518" /></p>
<p>/Outlines这个节点代表的就是目录，点开Outlines之后会看到/First和/Last，这两个就是第一个和最后一个目录</p>
<p><img title="Voyeur_iphone_2.png" src="http://phaibin.tk/wp-content/uploads/2012/01/Voyeur_iphone_2.png" border="0" alt="Voyeur_iphone_2" width="409" height="194" /></p>
<p>而/First下面又包含/Next，所有的目录就像链表一样这样串联起来的。</p>
<p>在目录的节点下面可以看到title，就是目录的名字，但是要找到跳转的页数就不容易了。根据本文第一个链接里面的回答，目录索引的方式有3种：</p>
<p>1. 用/Dest来索引，Dest是一个array，这时候/Dest下面第一个对象就是page的对象。跟节点下面的pages对象包含的就是所有的page对象，代表每一页，把/Dest下面的page跟所有的page对比，用==判断，就可以找出页码。需要注意的是pages有的时候下面不直接包含page对象，而是像子目录一样包含了很多层级，需要判断节点的type是pages还是page。</p>
<p><img title="iphone_outlines_dest.png" src="http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines_dest.png" border="0" alt="iphone_outlines_dest" width="480" height="247" /></p>
<p>2. 用/Dest索引，但是Dest是一个name，这时候需要在根节点下面的/Dests里面找到对应名字的节点，然后从里面找到page对象，再用类型1里面的方法来找到页数</p>
<p><img title="iphone_outlines_dest_name.png" src="http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines_dest_name.png" border="0" alt="iphone_outlines_dest_name" width="576" height="600" /></p>
<p>3. 用/A来索引，这种情况跟第一个类似，只要在/D下面找到page对象就好了</p>
<p><img title="iphone_outlines_a.png" src="http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines_a.png" border="0" alt="iphone_outlines_a" width="472" height="215" /></p>
<p> </p>
<p>最后附上我做的一个demo：<a href="http://phaibin.tk/wp-content/uploads/2012/01/IPadTest.zip">IPadTest.zip</a></p></p>
