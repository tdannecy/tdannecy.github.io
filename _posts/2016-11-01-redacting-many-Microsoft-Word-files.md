--
layout: post
title: Redacting many Microsoft Word files quickly
--

Recently, my organization was cleaning out their files on SharePoint and moving them to be archived. The main concern with this was privacy as many of 
the documents in the collecion have sensitive information. All of these files were stored in SharePoint, making it really difficult to work with them 
(download, edit, save, upload, repeat).

So, here's what I did to redact the 30,000 files.

| ​The Duke Archive project involved over 30,000 documents. ​​​​To make sure these documents are completely rid of sensitive information, you're going to need to do several things to ​make the process easier and to make sure you find and redact everything you're looking for.


# Mounting the ​SharePoint folder


Before we begin working on the files, we need to mount the SharePoint folder to your computer so that Windows treats it like a local folder on your hard drive. 


1.  Navigate to **​Start > Computer**. In the top toolbar, click **Map network drive**. ![2016-04-18_09-41-56.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/2016-04-18_09-41-56.png)


2.  Now, open your browser and navigate to the folder location you want in Luna. For this example, the Duke folder is located at <span class="ms-rteThemeBackColor-4-0">https://luna.ipas.org/sites/KS/dukearchives/​

3.  Copy and paste that address into the Folder location in the Map network drive window. The drive letter doesn't matter, so you can change it to whatever is available in the list. Check the box to enable **Reconnect at logon** and then, click **Finish.** ![explorer_2016-04-18_09-51-43.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/explorer_2016-04-18_09-51-43.png)


Now, you can​ work with the files on the SharePoint server without having to download/upload every time you edit them.


# Rena​ming​​ files


Many of the files in the Duke Archive had donor names in the filennames. One single file is easy to rename, but when we're dealing with a lot, it will take you forever if you rename each file one by one. We're going to use two programs to rename files in bulk.


## Bulk Rename Uti​​lity


​This is a slow application, but it gets the job done. 


1.  [​Download the program​](http://www.bulkrenameutility.co.uk/Download.php) and install it. 


2.  Open the program. There are TONS of options and features that you can use, but we're only going to use a few features. Locate your mounted SharePoint drive in the top left pane and navigate to the folder with all of the targeted files. ![Bulk Rename Utility_2016-04-18_10-40-11.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/Bulk%20Rename%20Utility_2016-04-18_10-40-11.png)


3.  When you've located your files, make sure that the "Subfolder" checkbox is checked in box 12 titled **Filters**. This will make the program search within the folders you've selected and rename the nested files. The program will immediately start working to populate the list of files. This process may take up to 30 minutes, so be patient! ![Bulk Rename Utility_2016-04-18_10-42-15.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/Bulk%20Rename%20Utility_2016-04-18_10-42-15.png)


4.  When the program is finished building the list, you can begin to rename the filenames. In box 3, type the name of the word you want to redact in the **Replace** field. In the Duke archives, I'm going to use a donor name. In the **With** field, I'm going to type "XXX DONOR". Then, click in the file list pane at the top right of the window and press **Ctrl + a** on the keyboard to select all of the files. This process might take some time, so be patient. You can check the status of the selection in the bottom of the window. ![Bulk Rename Utility_2016-04-18_10-47-20.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/Bulk%20Rename%20Utility_2016-04-18_10-47-20.png)


5.  When the process is complete, click the **Rename **button at the bottom right of the window. The popup will give you a summary of the changes you will make to the files. Click **OK **if everything looks right. ![Bulk Rename Utility_2016-04-18_10-49-56.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/Bulk%20Rename%20Utility_2016-04-18_10-49-56.png)


This process will take a long time, maybe over an hour. Minimize the program and ignore it for a while. A dialog window will popup with the results of the rename process when it is complete. The program may say "Not Responding" in the title bar, but rest assured that it's still running in the background. Ignore the warnings and just let it run.


## Total Commander fil​e manager​​


​While Bulk Rename Tool ​does a great job, we're going to use a second program to cover all of our bases. Total Commander is an old (and ugly) application, but its rename tool is very powerful.


1.  ​​[Download the application](http://www.ghisler.com/download.htm) and install it. Open the program when the install process is complete.


2.  Total Commander is ugly and can be very confusing to use. Don't worry! We're just going to focus on the leftmost navigation pane.


3.  Click on the address bar at the top of the left pane. Navigate to your mounted SharePoint drive. ![TOTALCMD_2016-04-18_10-59-43.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/TOTALCMD_2016-04-18_10-59-43.png)


4.  Click inside the left pane with the file contents and press **Ctrl + b** on the keyboard to begin locating all of the subfolders and files. The program might take a few minutes, but it's working hard locating all of the files in the directory.  ![TOTALCMD_2016-04-18_11-02-29.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/TOTALCMD_2016-04-18_11-02-29.png)


5.  When the process is complete, press **Ctrl + A** on the keyboard to select all of these subfolders and files. This process might take a few minutes. When the program is finished, all of your files in the left pane should be highlighted red. ![TOTALCMD_2016-04-18_11-08-02.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/TOTALCMD_2016-04-18_11-08-02.png)


6.  Now, press **Ctrl + M** on the keyboard to open up the renaming tool. Leave the **Rename mask **and the **Extension** box at their default values. Change the fields in **Search & Replace** to what you're looking to redact. In the case of the Duke Archives, I'll type a donor name in the **Search for **field and type "XXX DONOR" in the **Replace with **field. You can scroll through the file list at the bottom of the window to see if the file names look correct. The left column has the original name and the one to the right gives a preview of what the file will be named after the process is complete. ![TOTALCMD_2016-04-18_11-12-47.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/TOTALCMD_2016-04-18_11-12-47.png)


7.  Click the **Start!** button and let it do its thing.


Total Command​er is faster than the Bulk​ Rename Utility, but it still might take up to an hour to rename all of the files. When the program is finished with the renaming process, it will give you a confirmation message. 


Once the program is finished renaming everything, you should be finished with the renaming process. If you're satisfied, move on to configure Word.​


# Setting up Word​


If you want, you can open up each file in Word, look for every donor name, and try to redact everything yourself. That will take too long. 


First, we have to tell Word to loosen up on security so that we can open up everything on our SharePoint folder.


1.  Open Word. Create a blank document and click on **File** in the Ribbon. Click **Options **and click on **Trust Center**. Then, click on the **Trust Center Settings...** button. ![WINWORD_2016-04-18_11-42-46.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/WINWORD_2016-04-18_11-42-46.png)


2.  From here, we're going to open up some of the security settings. Jus​​t trust me on these options. It'll save you headaches later.


*   Click on the **Trusted Documents **category in the ​​left pane. Make sure that the checkbox for **Allow documents on a network to be trusted** ​​is checked.


*   On the **Macro Settings** category, select the option to **Enbable all macros**.


*   On the **Protected View**​ category, make sure that all of the checkboxes are not checked.


*   On the **File Block Settings** category, make sure that there are no checkboxes beside any of the file types. This will allow you to open older files without restrictions. Also, select the option to **Open selected file types in Protected View and allow editing**. 


​Once you're finished changing those options, click **OK** ​and return to the main docu​ment view.​ ​


​​Now, you're going to want to add a macro to Word so that we can automate the redaction process. 


1.  ​First, download this macro file:

    [![](/_layouts/15/images/ictxt.gif)Redaction macro.txt](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/Redaction%20macro.txt)


2.  ​Open the file in Notepad or another file editor like [Notepad++​](https://notepad-plus-plus.org/download/). Inside that file, there are instructions on how to edit and tweak the macro to your needs. Make sure you follow the instructions in the file and edit the code before moving on to the next step.

3.  When you're finished making changes, copy the entire file contents of the **Redaction macro** text file to the clipboard. (Just press **Ctrl + C **on the keyboard)

4.  Open Word and navigate to **​View > Macros** on the ribbon. The macro window should pop up. Type "AutoOpen" in ​the **Macro name** field and then click on the **Create** button. ![WINWORD_2016-04-18_11-55-25.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/WINWORD_2016-04-18_11-57-39.png)


5.  A new Visual Basic window will popup. In the whitespace, press **Ctrl + A** on the keyboard to select all of the text and then press **Ctrl + V** to paste in your edited macro. Check to make sure everything looks right and click the **Save** icon in the toolbar. ![WINWORD_2016-04-18_12-00-50.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/WINWORD_2016-04-18_12-00-50.png)


​Sometimes, documents want to remove your macros or replace the ones you've saved. You want to make the Normal macro file Read Only to prevent this from happening. 


1.  Exit Word and navigate to **Start > Computer **and paste <span class="ms-rteBackColor-4">%userprofile%\AppData\Roaming\Microsoft\Templates​ in the location bar.​ Right click on the file titled **Normal.dotm**. ![explorer_2016-04-18_12-35-02.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/explorer_2016-04-18_12-35-02.png)

    

2.  Check the **Read-only** checkbox and click **OK**. ![explorer_2016-04-18_12-37-46.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/explorer_2016-04-18_12-37-46.png)


	# ​Searching through​ file contents


​To find the names within the document text, you'll need to build an index and search through it. To do this, you'll need a program cal​led DocFetcher. 


1.  [Download the application](http://docfetcher.sourceforge.net/) and install it. Open the program when the install process is complete.


2.  Before we search through the contents, we have to build an index. Right click on the bottom left "Search Scope" pane and selecting Create Index From > Folder... ![2016-04-14_15-30-24.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/2016-04-14_15-30-24.png)


3.  Navigate to your mounted folder and click OK.


4.  Leave the indexing options on the default settings and click **Run** to begin building the index. ![indexingoptions.PNG](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/indexingoptions.PNG)

5.  Click on the Minimize button within DocFetcher to hide the window. ![minimize.PNG](/sites/KS/team/SiteAssets/Procedure%20Manual/Redache bottom left "Search Scope" pane and you can begin searching through the documents. For this example, I'm going to find the word "Ipas" in every file.


1.  In the bottom left "Search Scope" pane, make sure that you have added a checkmark to the folders you want to search.


2.  At the top of the window, type your search term in the white search bar and click on "Search".


3.  The results will populate in the main window pane. You can sort these using the column headers. For this example, we're going to redact information from Word documents (DOC or DOCX files). Sorting by filetype will be the most useful. ​


4.  You can click on the arrow on the bottom of the screen to open up a preview of the text within the file. It will highlight your search term. You can click on the up and down arrows at the top of the pane to turn the page.​

    ​![2016-04-14_15-39-05.png](/sites/KS/team/SiteAssets/Procedure%20Manual/Redacting%20archival%20material%20for%20Duke/2016-04-14_15-39-05.png)


<div>When you locate the file you want to redact, double-click on the file name to open it up in the default application. You can open up 10 files at a time. If you've opened up a Word document, you can make changes and redact the sensitive information by hand. If you're using the macro, it will automatically remove all of the text that you've specified. Just be sure to go through the document to make sure your macro removed everything correctly. When you save the file, it will automatically create a new version on SharePoint, so you don't have to worry about reuploading or any of that SharePoint nonsense.
