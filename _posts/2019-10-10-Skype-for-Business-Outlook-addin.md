---
layout: post
title: Powershell script to re-enable the Skype for Business meeting plugin in Outlook
published: true

tags: tech
---

I have had to run this script to re-enable the meetings plugin for Outlook countless times. We're running Office 365 and I have an E5 license and it seems like Outlook just likes to turn off this plugin. Here's how you can use Powershell to turn it back on.

```powershell
$AddinName = 'UCAddin.dll'
$ErrorActionPreference = 'SilentlyContinue'
$OutlookVersion = (Get-Item HKLM:\SOFTWARE\Classes\Outlook.Application\CurVer)."(default)".Replace("Outlook.Application.", "")
$wshell = New-Object -ComObject Wscript.Shell

$wshell.Popup("Click 'OK' to close Outlook. [Haga clic en 'Aceptar' para cerrar Outlook.]",0,"Done",0x0) > $null
Get-Process 'OUTLOOK' | Foreach-Object { $_.CloseMainWindow() | Out-Null } | stop-process –force

Get-Item -Path "HKCU:\Software\Policies\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\AddinList" | Set-ItemProperty -Name $AddinName -Value 1
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\DoNotDisableAddinList" | Set-ItemProperty -Name $AddinName -Value 1
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\DisabledItems" | Remove-Item
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\DisabledItems" | Out-Null
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\CrashingAddinList" | Remove-Item
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\CrashingAddinList" | Out-Null
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\NotificationReminderAddinData" | Set-ItemProperty -Name ([string]::Format("{0}\dtype",$AddinName)) -Value 2
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency\NotificationReminderAddinData" | Set-ItemProperty -Name $AddinName -Value 2524611661
Get-Item -Path "HKCU:\Software\Microsoft\Office\$OutlookVersion.0\Outlook\Resiliency" | Set-ItemProperty -Name "CheckPoint" -Value 1
Get-Item -Path "HKCU:\Software\Microsoft\Office\Outlook\Addins\UCAddin.LyncAddin.1" | Set-ItemProperty -Name '(Default)' -Value 0
Get-Item -Path "HKCU:\Software\Microsoft\Office\Outlook\Addins\UCAddin.LyncAddin.1" | Set-ItemProperty -Name 'LoadBehavior' -Value 3

$wshell.Popup("Outlook plugin for Skype for Business meetings re-enabled. [Complemento de Outlook para reuniones de Skype Empresarial re-habilitado.]",0,"Done",0x0) > $null
```
