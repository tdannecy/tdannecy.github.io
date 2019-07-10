---

layout: post
title: Moving Outlook contacts on Windows 10 to iCloud 

published: true

tags: tech

---

I had this come up at work and it's a bigger pain than I realized. 

Open Outlook and switch to the Contacts view. Find the contacts you want to 
move over and select them with Shift+click. It might be easier to put them in a
folder to keep everything organized. 

Once they're selected, navigate to the Home tab in the Ribbon and select 
**Forward Contact** --> **As a Business Card**. This will create a new email 
message with the selected contacts formatted as `.vcf` files, the format that 
iCloud accepts. Send the message to your Outlook email address.

Outlook freaks out and crashes if you select too many contacts. I haven't found
a sweet spot, but it seems to be around 30 contacts at a time.

When the message arrives with your contacts, open it in Outlook and select one 
of the attachments. Click on the arrow to the right of the attachment and 
select "Save All Attachments". Put them in a new folder somewhere on your 
computer.

Now, we get into the weeds. Outlook exports vcf contacts with the version set 
to 2.1. For some reason, iCloud doesn't like the version and will refuse to 
import your contacts. I'm running Office Version 1906 (Build 11727.20244 
Click-to-Run) and I'm on an Office 365 E5 license, so things may have changed 
since I wrote this guide. In any case, we need to change the version number in
each file from 2.1 to 3.0. 

You can do this using several different tools. I'm sure Regex will get you
there, but figuring out the right syntax might be too much trouble. You could 
edit them one by one if you don't have too many. I opened one of the vcf files 
in Notepad++ and used the Find & Replace tool on my exported folder. Here's a 
screenshot:

Once you've changed the version, log in to iCloud, open the Contacts page and 
click and drag the vcf files over into the Contacts column. It should upload 
and import them to iCloud and you'll be able to access them on your iPhone or 
other devices that use iCloud's contact sync.

Let me know if this worked for you. I couldn't find anything online, so it may
be helpful to some people.
