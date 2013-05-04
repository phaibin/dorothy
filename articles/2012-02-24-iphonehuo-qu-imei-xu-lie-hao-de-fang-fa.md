---
layout: post
title: iphone获取IMEI，序列号的方法
date: 2012-02-24 13:52
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>首先加入IOKit.framework，然后加入下面两个文件</p>
<p> <br />
[code lang="objc"]<br />
////////////////头文件//////////////////////</p>

<p>/*<br />
 Erica Sadun, http://ericasadun.com<br />
 iPhone Developer's Cookbook, 3.0 Edition<br />
 BSD License, Use at your own risk<br />
 */</p>

<p>/*<br />
 http://broadcast.oreilly.com/2009/04/iphone-dev-iokit---the-missing.html<br />
 
 In Xcode, I was surprised to see that Apple didn't include IOKit header files. When I tried to <br />
 add #import &lt;IOKit/IOKit.h&gt;, the file could not be found. So I manually put together a simple <br />
 header file by hand, added IOKit to my frameworks and attempted to compile.<br />
 
 As you can see from the screenshot at the top of this post, I failed to do so. Xcode complained <br />
 that the IOKit framework could not be found. Despite being filed as public, IOKit is apparently <br />
 not meant to be used by the general public. As iPhone evangelist Matt Drance tweeted, <br />
 &quot;IOKit is not public on iPhone. Lack of headers and docs is rarely an oversight.&quot;<br />
 
 In the official docs, I found a quote that described IOKit as such: &quot;Contains interfaces used by<br />
 the device. Do not include this framework directly.&quot; So in the end, my desire to access that IOKit <br />
 information was thwarted. For whatever reason, Apple has chosen to list it as a public framework <br />
 but the reality is that it is not.<br />
*/</p>

<p>#import &lt;UIKit/UIKit.h&gt;</p>

<p>#define SUPPORTS_IOKIT_EXTENSIONS    1</p>

<p>/*<br />
 * To use, you must add the (semi)public IOKit framework before compiling<br />
 */</p>

<p>#if SUPPORTS_IOKIT_EXTENSIONS<br />
@interface UIDevice (IOKit_Extensions)<br />
- (NSString *) imei;<br />
- (NSString *) serialnumber;<br />
- (NSString *) backlightlevel;<br />
@end<br />
#endif</p>

<p>///////////////实现文件////////////////////</p>

<p> </p>

<p>/*<br />
 Erica Sadun, http://ericasadun.com<br />
 iPhone Developer's Cookbook, 3.0 Edition<br />
 BSD License, Use at your own risk<br />
 */</p>

<p>#import &quot;UIDevice-IOKitExtensions.h&quot;<br />
#include &lt;sys/types.h&gt;<br />
#include &lt;sys/sysctl.h&gt;<br />
#import &lt;mach/mach_host.h&gt;<br />
#include &lt;netinet/in.h&gt;<br />
#include &lt;arpa/inet.h&gt;<br />
#include &lt;netdb.h&gt;<br />
#include &lt;ifaddrs.h&gt;<br />
#include &lt;sys/socket.h&gt;<br />
#include &lt;net/if.h&gt;<br />
#include &lt;net/if_dl.h&gt;<br />
#include &lt;ifaddrs.h&gt;</p>

<p>#if SUPPORTS_IOKIT_EXTENSIONS<br />
#pragma mark IOKit miniheaders</p>

<p>#define kIODeviceTreePlane        &quot;IODeviceTree&quot;</p>

<p>enum {<br />
    kIORegistryIterateRecursively    = 0x00000001,<br />
    kIORegistryIterateParents        = 0x00000002<br />
};</p>

<p>typedef mach_port_t    io_object_t;<br />
typedef io_object_t    io_registry_entry_t;<br />
typedef char        io_name_t[128];<br />
typedef UInt32        IOOptionBits;</p>

<p>CFTypeRef<br />
IORegistryEntrySearchCFProperty(<br />
                                io_registry_entry_t    entry,<br />
                                const io_name_t        plane,<br />
                                CFStringRef        key,<br />
                                CFAllocatorRef        allocator,<br />
                                IOOptionBits        options );</p>

<p>kern_return_t<br />
IOMasterPort( mach_port_t    bootstrapPort,<br />
             mach_port_t *    masterPort );</p>

<p>io_registry_entry_t<br />
IORegistryGetRootEntry(<br />
                       mach_port_t    masterPort );</p>

<p>CFTypeRef<br />
IORegistryEntrySearchCFProperty(<br />
                                io_registry_entry_t    entry,<br />
                                const io_name_t        plane,<br />
                                CFStringRef        key,<br />
                                CFAllocatorRef        allocator,<br />
                                IOOptionBits        options );</p>

<p>kern_return_t   mach_port_deallocate<br />
(ipc_space_t                               task,<br />
 mach_port_name_t                          name);</p>

<p>@implementation UIDevice (IOKit_Extensions)<br />
#pragma mark IOKit Utils<br />
NSArray *getValue(NSString *iosearch)<br />
{
    mach_port_t          masterPort;<br />
    CFTypeID             propID = (CFTypeID) NULL;<br />
    unsigned int         bufSize;<br />
    <br />
    kern_return_t kr = IOMasterPort(MACH_PORT_NULL, &amp;masterPort);<br />
    if (kr != noErr) return nil;<br />
    <br />
    io_registry_entry_t entry = IORegistryGetRootEntry(masterPort);<br />
    if (entry == MACH_PORT_NULL) return nil;<br />
    <br />
    CFTypeRef prop = IORegistryEntrySearchCFProperty(entry, kIODeviceTreePlane, (CFStringRef) iosearch, nil, kIORegistryIterateRecursively);<br />
    if (!prop) return nil;<br />
    <br />
    propID = CFGetTypeID(prop);<br />
    if (!(propID == CFDataGetTypeID())) <br />
    {<br />
        mach_port_deallocate(mach_task_self(), masterPort);<br />
        return nil;<br />
    }<br />
    <br />
    CFDataRef propData = (CFDataRef) prop;<br />
    if (!propData) return nil;<br />
    <br />
    bufSize = CFDataGetLength(propData);<br />
    if (!bufSize) return nil;<br />
    <br />
    NSString *p1 = [[[NSString alloc] initWithBytes:CFDataGetBytePtr(propData) length:bufSize encoding:1] autorelease];<br />
    mach_port_deallocate(mach_task_self(), masterPort);<br />
    return [p1 componentsSeparatedByString:@&quot;/0&quot;];<br />
}</p>

<p>- (NSString *) imei<br />
{
    NSArray *results = getValue(@&quot;device-imei&quot;);<br />
    if (results) return [results objectAtIndex:0];<br />
    return nil;<br />
}</p>

<p>- (NSString *) serialnumber<br />
{
    NSArray *results = getValue(@&quot;serial-number&quot;);<br />
    if (results) return [results objectAtIndex:0];<br />
    return nil;<br />
}</p>

<p>- (NSString *) backlightlevel<br />
{
    NSArray *results = getValue(@&quot;backlight-level&quot;);<br />
    if (results) return [results objectAtIndex:0];<br />
    return nil;<br />
}
@end<br />
#endif<br />
[/code]
</p>
<p>加入IOKit.framework的方法是定位到/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.0.sdk/System/Library/Frameworks/，iOS5寻找类似的位置。</p>
<p>至于加入这个framework会不会被拒就众说纷纭了，不过大部分人是倾向于会被拒的。</p></p>
