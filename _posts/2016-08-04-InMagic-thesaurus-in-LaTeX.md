---
layout: post
title: Generating a printable document with LaTeX from an InMagic thesaurus
published: true
tags: 'library, tech, LaTeX'
---

The library that I'm currently working at uses an old cataloging system. Since 2000, InMagic DB/Textworks for SQL has been our workhorse. We rely on it for circulation, acquisitions, cataloging, generating reports, and to manage our serial subscriptions on a daily basis. On top of the backend database, we have additional modules that serve a public-facing catalog for employees on our intranet.

While [Lucidia's current product page for InMagic](http://lucidea.com/inmagic/dbtextworks/) is shiny and responsive, the application itself is neither. The current version is 15.50, but the company has mothballed the project and only provides sporadic bug fixes and support for catastrophic outages. 

![Screenshot of InMagic DB/Textworks for SQL 15.50](/images/2016-08-04-InMagic.png)

One of the many quirks of InMagic is that it uses its own proprietary database structure and metadata standards. Most new OPAC systems rely on MARC or some other standard (e.g. METS, MODS, Dublin Core) so that they are interoperable with bigger networks like WorldCat or LOC. Transitioning to another catalog system has been an issue for us because we can't easily move records from InMagic into a new one without paying a consultant to convert the database into a standard that's compatible with the new system. Luckily, InMagic allows you to export the records to CSV, but moving over to a different system will lose edit history, textbase structure, and other parts of the database that should be kept for recordkeeping.

Additionally, because InMagic doesn't understand MARC records, we can't really import anything. This means that we aren't able to do [copy cataloging](https://archive.is/zxNgm) and have to create each record by hand. To make things worse, InMagic's thesaurus feature is clunky and each descriptor lookup is buggy, taking about 10-30 seconds per entry. Cataloging is a chore.

![Screenshot of a catalog record in InMagic DB/Textworks for SQL 15.50](/images/2016-08-04-InMagic-record.png)

While this may be frustrating at times, one of the benefits of having a quirky system like InMagic is that in the absence of a standard being forced upon us, we have developed a bespoke thesaurus to fit our needs. Our library has made additions and tweaks in InMagic based on the terms from the [2010 edition of POPLINE keywords](http://web.archive.org/web/20130404093842/http://www.popline.org/sites/default/files/POPLINEKeywordGuide_NinthEdition.pdf) and we now use descriptors that are completely tailored to our scope of work. In some ways, there are a lot of terms that are the same in our thesaurus and in POPLINE's. Since the fork in 2010, however, we've added terms for project-specific descriptors, updated terms to be more neutral (THIRD WORLD COUNTRIES > DEVELOPING COUNTRIES), and added more information or "near terms" to existing descriptors so that they're easier to understand.

To get around InMagic's slowness, we try to avoid accessing the thesaurus file and instead use a paper binder of all the terms. We printed the POPLINE keywords back in 2010 and have since marked up the pages with a pen whenever we make a change. It's a mess, but it's much easier than waiting on the program for 30 seconds to tell you your descriptor is incorrect. The binder has been an invaluable part of our cataloging process and we refer to it daily.

Recently, we took on a big descriptor weeding project. We wanted to reduce the number of terms that we have so that lookups are more straightforward. For librarians, weeding is therapy. It feels so great to streamline your collection or, in our case, the terms that you use to describe the collection, and it gives you a moment to pause and think critically about what what's important to your library.

You probably saw this coming, but there's no quick way to print the thesaurus and all of the definitions from InMagic. This made us concerned. We'd be editing the terms directly _in_ InMagic and we don't know how we'd get them back out again. We were thinking about the nightmare of going through each term and typing up the definition in Word, one by one. You can probably see this coming too: That would be my job.

I definitely didn't want to slog through 200+ pages of descriptors, updating each term from the InMagic entry, and then waiting 10-30 seconds for each lookup. I knew there had to be a better way to generate a list of terms without having to type each one by hand.

I started investigating by looking at the thesaurus database file that InMagic uses. It's a .cba file and I wasn't able to edit the file in Excel or in Notepad++ because the encoding is old and/or proprietary.

![Screenshot of InMagic's thesaurus file](images/2016-08-04-InMagic-thesaurus.png)

Instead, I opened the thesaurus file in InMagic and exported it to an ASCII .csv file, saved or encapsulated in a .dmp file. The export process can be overwhelming if you're not sure what you're looking for. In my best guess, I'd say that the InMagic Tagged Format is the proprietary format that I tried to read earlier. It's not helpful in this export either. The XML might be helpful, but I think that the ASCII format was the simplest and most useful solution for this project.

The Delimiter Options are important, but I didn't realize some of the issues I'd have later on down the line. InMagic actually gives you a lot of freedom to input whatever character you want in the field. The Record Separator refers to the divider between each term. In this case, when we look at the exported spreadsheet, these are the rows. The default option {CR}{LF} inserts line breaks. The Field Separator option refers to the character that goes between each section of the term. In this case, when we look at the exported spreadsheet, these are the columns. The Entry Separator option refers to the character that goes in between multiple items in a column. For this example, our terms have several synonyms that fall under one column. The Comment field isn't relevant to this export, so I left it at the default value. The Quote Character option is important 


I wanted the printed document to be formatted like a traditional dictionary (term, definition, synonyms, etc.), so I only selected a few fields for InMagic to export.



Now that I had everything in a spreadsheet, I just needed a way to automatically format the entries.

[LaTeX](http://sharelatex.com) to the rescue!!

<script src="https://gist.github.com/tdannecy/0dc406b9678795b0c7d60bae10e639fc.js">
</script>

Here's how the final document turned out!

<iframe src="/projects/2016-08-17-InMagic-thesaurus.pdf" style="width:100%; height:500px;" frameborder="0">
</iframe>
