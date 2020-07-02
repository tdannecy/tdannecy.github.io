---
layout: post
title: CentOS 8 network reminder

tags: tech
published: true
---

This is just a post to remind myself that by default, CentOS 8 does not set the NIC to connect automatically.

I needed to edit the file at `/etc/sysconfig/network-scripts/ifcfg-ens3` to set `ONBOOT=yes`.

Reading through the support [here](https://community.spiceworks.com/topic/2264348-network-connection-not-starting-automatically-after-reboot-centos-8-1) and just wanted to make a note for future reference.
