---
layout: post
title: 让Django自带的服务器输出SQL语句的方法
date: 2012-07-31 17:53
categories:
- Python
tags:
- django
- python
published: true
comments: true
---
<p><p>修改settings.py里面的LOGGING，加入：</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">LOGGING = {</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    'handlers': {</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        'console': {</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">            'level': 'DEBUG',</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">            'class': 'logging.StreamHandler',</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        },</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    },</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    'loggers': {</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        'django.db.backends': {</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">            'level': 'DEBUG',</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">            'handlers': ['console'],</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        },</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">        ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    },</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">    ...</p>
<p style="margin: 0px; font-size: 12px; font-family: Helvetica;">}</p></p>
