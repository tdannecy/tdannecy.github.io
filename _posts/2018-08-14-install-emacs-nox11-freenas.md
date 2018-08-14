---

layout: post
title: Install emacs-nox11 on FreeNAS

published: true

tags: tech

---

I ran into some issues installing [emacs](https://www.gnu.org/software/emacs/) in a FreeBSD jail on my 
FreeNAS server and wanted to share how I got it working.

Before you start, *install freshports for FreeBSD* and load the packages. This can be done by running the 
following command:

`portsnap fetch extract && portsnap fetch update`

I should note that as of writing this post, I'm running FreeBSD Plex 11.1-STABLE in a Jail on a FreeNAS 
box running the same version of FreeBSD.

`cd /usr/ports/editors/emacs && make FLAVOR=nox install clean ALLOW_UNSUPPORTED_SYSTEM=true`

This should take a few minutes to compile the program, but after that, you can run emacs by just typing in 
 `emacs` from the shell. Hope this helps!
