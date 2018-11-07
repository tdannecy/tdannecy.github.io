---
layout: post
title: Using chflags in FreeNAS
published: true

tags: tech
---

I was trying to protect a file in a jail on my FreeNAS server but the `chmod +t` tag wasn't 
cutting it for me. I wanted to use flags to protect the file, a common practice in FreeBSD 
and other POSIX systems.

I tried running `chflags schg foo.bar`, but the terminal spat out "Operation not 
permitted." I was puzzled. There are multiple instances where chflags support was added to 
ZFS many versions ago so I didn't understand why I couldn't use the feature.

I found out that the default FreeNAS jails template creates jails without support for 
changing flags. I had to go into the web interface and open up my jail instance, open the Advanced Settings, and add `allow.chflags=1` to the Sysctls field.

Make sure you have a comma separating any other existing configuration and that you restart 
the jail for the changes to take effect.

Here's my current Sysctls field:
```
allow.raw_sockets=true,allow.chflags=1
```

I'm running a jail version FreeBSD 10.3-STABLE #0 r295946+21897e6695f(HEAD) on FreeNAS-9.10.2-U6 (561f0d7a1).
