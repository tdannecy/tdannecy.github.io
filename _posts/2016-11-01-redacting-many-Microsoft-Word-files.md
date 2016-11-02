---
layout: post
title: Redacting many Microsoft Word files quickly

tags: tech
published: true
---

Recently, my organization was cleaning out their files on SharePoint and moving them to be archived. The main concern with this was privacy as many of the documents in the collecion have sensitive information. All of these files were stored in SharePoint, making it really difficult to work with them (download, edit, save, upload, repeat).

So, here's what I did to redact the 30,000 files. I'm using Windows 7 and the most up to date software as of 2016.

First of all, to make sure these documents are completely rid of sensitive information, you're going to need to do several things to make the process easier and to make sure you find and redact everything you're looking for.

# Mounting the SharePoint folder

Before we begin working on the files, we need to mount the SharePoint folder to your computer so that Windows treats it like a local folder on your hard drive. 

1.  Navigate to **Start > Computer**. In the top toolbar, click **Map network drive**. ![Mounting a SharePoint drive in Windows 7](/images/2016-11-01-mount-drive.png)

2.  Now, open your browser and navigate to the folder location you want on SharePoint.

3.  Copy and paste that address into the Folder location in the Map network drive window. The drive letter doesn't matter, so you can change it to whatever is available in the list. Check the box to enable **Reconnect at logon** and then, click **Finish.** ![Mounting a SharePoint drive in Windows 7 - wizard](/images/2016-11-01-mount-drive-wizard.png)

Now, you can work with the files on the SharePoint server without having to download/upload every time you edit them.

# Renaming files

Many of the files in the Duke Archive had donor names in the filennames. One single file is easy to rename, but when we're dealing with a lot, it will take you forever if you rename each file one by one. We're going to use two programs to rename files in bulk.

## Bulk Rename Utility

This is a slow application, but it gets the job done. 

1.  [Download the program](http://www.bulkrenameutility.co.uk/Download.php) and install it. 

2.  Open the program. There are TONS of options and features that you can use, but we're only going to use a few features. Locate your mounted SharePoint drive in the top left pane and navigate to the folder with all of the targeted files. ![Bulk Rename Utility_main window screenshot](/images/2016-11-01-Bulk-Rename-Utility-screenshot.png)

3.  When you've located your files, make sure that the "Subfolder" checkbox is checked in box 12 titled **Filters**. This will make the program search within the folders you've selected and rename the nested files. The program will immediately start working to populate the list of files. This process may take up to 30 minutes, so be patient! ![Bulk Rename Utility_main window screenshot with an arrow](/images/2016-11-01-Bulk-Rename-Utility-screenshot-arrow.png)

4.  When the program is finished building the list, you can begin to rename the filenames. In box 3, type the name of the word you want to redact in the **Replace** field. In the Duke archives, I'm going to use a donor name. In the **With** field, I'm going to type "XXX DONOR". Then, click in the file list pane at the top right of the window and press **Ctrl + a** on the keyboard to select all of the files. This process might take some time, so be patient. You can check the status of the selection in the bottom of the window. ![Bulk Rename Utility_main window screenshot indicating the Replace field](/images/2016-11-01-Bulk-Rename-Utility-screenshot-replace.png)

5.  When the process is complete, click the **Rename **button at the bottom right of the window. The popup will give you a summary of the changes you will make to the files. Click **OK **if everything looks right. ![Bulk Rename Utility_sreenshot of completed window](/images/2016-11-01-Bulk-Rename-Utility-screenshot-complete.png)

This process will take a long time, maybe over an hour. Minimize the program and ignore it for a while. A dialog window will popup with the results of the rename process when it is complete. The program may say "Not Responding" in the title bar, but rest assured that it's still running in the background. Ignore the warnings and just let it run.

## Total Commander file manager

While Bulk Rename Tool does a great job, we're going to use a second program to cover all of our bases. Total Commander is an old (and ugly) application, but its rename tool is very powerful.

1.  [Download the application](http://www.ghisler.com/download.htm) and install it. Open the program when the install process is complete.

2.  Total Commander is ugly and can be very confusing to use. Don't worry! We're just going to focus on the leftmost navigation pane.

3.  Click on the address bar at the top of the left pane. Navigate to your mounted SharePoint drive. ![Total Commander main window screenshot](/images/2016-11-01-Total-Commander-screenshot-main.png)

4.  Click inside the left pane with the file contents and press **Ctrl + b** on the keyboard to begin locating all of the subfolders and files. The program might take a few minutes, but it's working hard locating all of the files in the directory.  ![Total Commander rename in progress screenshot](/images/2016-11-01-Total-Commander-screenshot-in-process.png)

5.  When the process is complete, press **Ctrl + A** on the keyboard to select all of these subfolders and files. This process might take a few minutes. When the program is finished, all of your files in the left pane should be highlighted red. ![Total Commander rename red screenshot](/images/2016-11-01-Total-Commander-screenshot-red.png)

6.  Now, press **Ctrl + M** on the keyboard to open up the renaming tool. Leave the **Rename mask **and the **Extension** box at their default values. Change the fields in **Search & Replace** to what you're looking to redact. In the case of the Duke Archives, I'll type a donor name in the **Search for **field and type "XXX DONOR" in the **Replace with **field. You can scroll through the file list at the bottom of the window to see if the file names look correct. The left column has the original name and the one to the right gives a preview of what the file will be named after the process is complete. ![Total Commander search and replace screenshot](/images/2016-11-01-Total-Commander-screenshot-search.png)

7.  Click the **Start!** button and let it do its thing.

Total Commander is faster than the Bulk Rename Utility, but it still might take up to an hour to rename all of the files if you have a lot. When the program is finished with the renaming process, it will give you a confirmation message. 

Once the program is finished renaming everything, you should be finished with everything you need to do as far as renaming goes. If you're satisfied, move on to configure Word.

# Setting up Microsoft Word

If you want, you can open up each file in Word, look for every donor name, and try to redact everything yourself. That will take too long. 

First, we have to tell Word to loosen up on security so that we can open up everything on our SharePoint folder.

1.  Open Word. Create a blank document and click on **File** in the Ribbon. Click **Options **and click on **Trust Center**. Then, click on the **Trust Center Settings...** button. ![Microsoft Word Trust Center screenshot](/images/2016-11-01-Microsoft-Word-Trust-Center.png)

2.  From here, we're going to open up some of the security settings. Just trust me on these options. It'll save you headaches later.

*   Click on the **Trusted Documents **category in the left pane. Make sure that the checkbox for **Allow documents on a network to be trusted** is checked.

*   On the **Macro Settings** category, select the option to **Enbable all macros**.

*   On the **Protected View** category, make sure that all of the checkboxes are not checked.

*   On the **File Block Settings** category, make sure that there are no checkboxes beside any of the file types. This will allow you to open older files without restrictions. Also, select the option to **Open selected file types in Protected View and allow editing**. 

Once you're finished changing those options, click **OK** and return to the main document view.

Now, you're going to want to add a macro to Word so that we can automate the redaction process. 

1.  First, download this macro file:

    <script src="https://gist.github.com/tdannecy/41232d264059baaf7dceb5ce8aed2b90.js"></script>

2.  Open the file in Notepad or another file editor like [Notepad++](https://notepad-plus-plus.org/download/). Inside that file, there are instructions on how to edit and tweak the macro to your needs. Make sure you follow the instructions in the file and edit the code before moving on to the next step. When you're finished making changes, copy the entire file contents of the **Redaction macro** text file to the clipboard. (Just press **Ctrl + c** keyboard)

3.  Open Word and navigate to **View > Macros** on the ribbon. The macro window should pop up. Type "AutoOpen" in the **Macro name** field and then click on the **Create** button. ![Microsoft Word macros screenshot](/images/2016-11-01-Microsoft-Word-macros.png)


4.  A new Visual Basic window will popup. In the whitespace, press **Ctrl + A** on the keyboard to select all of the text and then press **Ctrl + V** to paste in your edited macro. Check to make sure everything looks right and click the **Save** icon in the toolbar. ![Microsoft Word Visual Basic editor](/images/2016-11-01-Microsoft-Word-VB-editor.png)

Sometimes, documents want to remove your macros or replace the ones you've saved. You want to make the Normal macro file Read Only to prevent this from happening. 

1.  Exit Word and navigate to **Start > Computer** and paste **%userprofile%\AppData\Roaming\Microsoft\Templates** in the location bar. Right click on the file titled **Normal.dotm**. ![Microsoft Word template location in Windows Explorer](/images/2016-11-01-Microsoft-Word-templates.png)

2.  Check the **Read-only** checkbox and click **OK**. ![Screenshot of files properties in Windows Explorer](/images/2016-11-01-read-only.png)

# Searching through file contents

To find the names within the document text, you'll need to build an index and search through it. To do this, you'll need a program called DocFetcher. 

1.  [Download the application](http://docfetcher.sourceforge.net/) and install it. Open the program when the install process is complete.

2.  Before we search through the contents, we have to build an index. Right click on the bottom left "Search Scope" pane and selecting **Create Index From > Folder...** ![Screenshot of the DocFetcher main window](/images/2016-11-01-Doc-Fetcher-screenshot-main.png)

3.  Navigate to your mounted folder and click OK.

4.  Leave the indexing options on the default settings and click **Run** to begin building the index. ![Screenshot of the DocFetcher indexing queue](/images/2016-11-01-Doc-Fetcher-screenshot-indexing-queue.png)

5.  Click on the Minimize button within DocFetcher to hide the window. ![minimize.PNG](/images/2016-11-01-Doc-Fetcher-screenshot-minimize.png)

6. Select the scope in the bottom left "Search Scope" pane and you can begin searching through the documents. For this example, I'm going to find the word "Ipas" in every file.

1.  In the bottom left "Search Scope" pane, make sure that you have added a checkmark to the folders you want to search.

2.  At the top of the window, type your search term in the white search bar and click on "Search".

3.  The results will populate in the main window pane. You can sort these using the column headers. For this example, we're going to redact information from Word documents (DOC or DOCX files). Sorting by filetype will be the most useful.

4.  You can click on the arrow on the bottom of the screen to open up a preview of the text within the file. It will highlight your search term. You can click on the up and down arrows at the top of the pane to turn the page. ![Screenshot of the DocFetcher preview pane](/images/2016-11-01-Doc-Fetcher-screenshot-preview.png)

When you locate the file you want to redact, double-click on the file name to open it up in the default application. You can open up 10 files at a time. If you've opened up a Word document, you can make changes and redact the sensitive information by hand. If you're using the macro, it will automatically remove all of the text that you've specified. Just be sure to go through the document to make sure your macro removed everything correctly. When you save the file, it will automatically create a new version on SharePoint, so you don't have to worry about reuploading or any of that SharePoint nonsense.
