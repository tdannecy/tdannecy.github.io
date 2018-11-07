---

layout: post
title: Windows 10 Upgrade Issues

published: true

tags: tech

---

I ran into an issue trying to upgrade a Windows 7 machine to Windows 10. I kept getting an error that said...

> Windows10UpgraderApp.exe - System Error

> The program can't start because api-ms-win-core-libraryloader-l1-1-1.dll is missing from your computer. Try reinstalling the program to fix this problem.

I read through 
[this](https://social.technet.microsoft.com/Forums/en-US/8ab132c5-fdf5-409d-92c8-a96ebfc3eeaa/error-while-upgrading-to-windows-10?forum=win10itprosetup) 
article and found the solution and I wanted to re-post it for my future use.

1. Close the Windows 10 updater app, if open.

1. Copy the file at `C:\Windows\System32\wimgapi.dll`

1. Replace the file at `C:\Windows10Upgrade\wimgapi.dll`


That's it! You should be able to upgrade to Windows 10 without any other DLL issues. 
