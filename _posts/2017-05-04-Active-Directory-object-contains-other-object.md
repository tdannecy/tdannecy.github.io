---

layout: post
title: Microsoft Active Directory deletion - "Object contains other objects"

published: false

tags: tech

---

Our organization uses Active Directory to manage our users. When users leave the organization, we remove their account from the domain using the Active Directory Users and Computers app. 

![Screenshot of my current version of Microsoft Active Directory Users and Computers version 10.0.14393.347](/images/2017-05-04-Active-Directory-Users-and-Computers.png)

This morning, I encountered an issue for the first time when deleting a departing user. I searched for the user, right clicked on the search result and clicked "Delete". 

![Screenshot of the Microsoft Active Directory Subtree Deletion confirmation window](/images/2017-05-04-Active-Directory-delete-confirmation.png)

My first guess was that the error was from the employee being a manager, but this wasn't the case. There were no direct reports listed on the "Organization" tab, so that theory was out.

Following [this](https://social.technet.microsoft.com/Forums/ie/en-US/02240017-cab8-46cd-8442-cf585db8ad72/active-directory-user-account-question-object-name-contains-other-objects-are-you-sure-you?forum=winserverDS) guide, I was able to figure out that the issue is related to mobile devices.

You can check which devices are linked to the account by turning on the 