---
layout: post
title: Generating a printable document with LaTeX from an InMagic thesaurus

published: true
tags: library, tech, LaTeX
---

The library that I'm currently working at uses an old cataloging system. Since 2000, InMagic DB/Textworks for SQL has been our workhorse. We rely on it for circulation, acquisitions, cataloging, generating reports, and to manage our serial subscriptions on a daily basis. On top of the backend database, we have additional modules that serve a public-facing catalog for employees on our intranet.

While [Lucidia's current product page for InMagic](https://archive.is/LEs6I) is shiny and responsive, the application itself is neither. The current version is 15.50, but the company has mothballed the project and only provides sporadic bug fixes and support for catastrophic outages. 

![Screenshot of InMagic DB/Textworks for SQL 15.50](images/2016-08-04-InMagic.png)

One of the many quirks of InMagic is that it uses its own proprietary database structure and metadata standards. Most new OPAC systems rely on MARC or some other standard (e.g. METS, MODS, Dublin Core) so that they are interoperable with bigger networks like WorldCat or LOC. Transitioning to another catalog system has been an issue for us because we can't easily move records from InMagic into a new one without paying a consultant to convert the database into a standard that's compatible with the new system. Additionally, InMagic doesn't understand MARC records, so we can't import anything. This means that we aren't able to do [copy cataloging](https://archive.is/zxNgm) and have to create each record by hand. To make things worse, InMagic's thesaurus feature is clunky and each descriptor lookup takes about 10-30 seconds, making cataloging a chore.

While this may be frustrating at times, one of the benefits of having a quirky system like InMagic is that in the absence of a standard being forced upon us, we have developed a bespoke thesaurus to fit our needs. Our library has made additions and tweaks in InMagic based on the terms from the [2010 edition of POPLINE keywords](http://web.archive.org/web/20130404093842/http://www.popline.org/sites/default/files/POPLINEKeywordGuide_NinthEdition.pdf) and we now use descriptors that are completely tailored to our scope of work. In some ways, there are a lot of terms that are the same in our thesaurus and in POPLINE's. Since the fork in 2010, however, we've added terms for project-specific descriptors, updated terms to be more neutral (THIRD WORLD COUNTRIES &gt; DEVELOPING COUNTRIES), and added more information or "near terms" to existing descriptors so that they're easier to understand. 

To get around InMagic's slowness, we try to avoid accessing the thesaurus file and instead use a paper binder of all the terms. We printed the POPLINE keywords back in 2010 and have since marked up the pages with a pen whenever we make a change. It's a mess, but it's much easier than waiting on the program to respond after it freezes for about 30 seconds. It's been an invaluable part of our cataloging process and we refer to it daily. 

Recently, we took on a big descriptor weeding project. We wanted to reduce the number of terms that we have so that lookups are more straightforward. For librarians, weeding is therapy. It feels so great to streamline your collection or, in our case, the terms that you use to describe the collection, and it gives you a moment to pause and think critically about what what's important to your library. 

You probably saw this coming, but there's no way to print the thesaurus and all of the definitions from InMagic. This made us concerned. We'd be editing the terms directly *in* InMagic and we don't know how we'd get them back out again. We were thinking about the nightmare of going through each term and typing up the definition in Word, one by one. You can probably see this coming too: That would be my job. 

I definitely didn't want to slog through 200+ pages, updating each term from the InMagic entry, and waiting 10-30 seconds for each lookup. I knew there had to be a better way to generate a list of terms without having to type each one by hand. 

I started investigating by looking at the thesaurus database file that InMagic uses. 

LaTeX to the rescue!!

 This is important because the CSV reader may import an empty cell as a non-printing character. Further on in the code, we ask LaTeX to define terms, but only if the term 

```tex
\documentclass[twoside]{article}

% This section has the required packages for changing the CSV into something usable in LaTeX.
\usepackage{xspace}
\usepackage{xstring}
\usepackage{csvsimple}

% This section contains semi-optional formatting packages.
\usepackage[letterpaper]{geometry}
\geometry{top=.75in, bottom=.75in, left=.75in, right=.5in}
\usepackage{tabto}
	\NumTabs{15}
\usepackage{multicol}
\usepackage{setspace}
\usepackage{times}
\usepackage{fancyhdr}
	\fancyfoot[LE,RO]{\thepage}
	\renewcommand{\headrulewidth}{.4pt}
		\fancyhf{}
		\chead{\bfseries Keyword Dictionary}
\usepackage{titlesec}

% Defining some basic information about the document.
\title{InMagic Thesaurus}
\date{Last updated \\ August 17, 2016}
\author{Exported from InMagic, slightly modified, and generated in \LaTeX\ .}

% Just generating a pretty title here.
\titleformat*{\section}{\large\bfseries}

% This section is complicated. It's basically telling LaTeX to treat spaces differently.
\def\UseEgregsIfNoText{}% 
\makeatletter
\def\IgnoreSpacesAndImplicitePars{%
  \begingroup
  \catcode13=10
  \@ifnextchar\relax
    {\endgroup}%
    {\endgroup}%
}
\def\IgnoreSpacesAndAllPars{%
  \begingroup
  \catcode13=10
  \@ifnextchar\par
    {\endgroup\expandafter\IgnoreSpacesAndAllPars\@gobble}%
    {\endgroup}%
}
\makeatother

% This section is also a bit complicated, but it tells LaTeX to do certain things if a macro is empty. The macro names come from the next section.
\ifdefined\UseEgregsIfNoText
    \newcommand{\IfNoText}[3]{%
        \sbox0{#1}%
        \ifdim\wd0=0pt %
            {#2}%
        \else%
          \ifdim0pt=\dimexpr\ht0+\dp0\relax
            {#2}
          \else
            {#3}%
          \fi
        \fi%
    }
\else
    \newcommand{\IfNoText}[3]{%
        \IfStrEq{#1}{\empty}{#2}{#3}%
    }
\fi
\newcommand*{\MandatoryName}{\empty}%
\newcommand*{\SetName}[1]{\renewcommand*{\MandatoryName}{#1\xspace}}%
\newcommand{\OptionalUse}{\empty}%
\newcommand{\SetUse}[1]{%
    \IfNoText{#1}{% 
        %
    }{%
        \gdef\OptionalUse{\ignorespaces#1}%
    }%
}%
\newcommand{\OptionalNote}{\empty}%
\newcommand{\SetNote}[1]{%
    \IfNoText{#1}{% 
        %
    }{%
        \gdef\OptionalNote{\ignorespaces#1}%
    }%
}%
\newcommand{\OptionalBT}{\empty}%
\newcommand{\SetBT}[1]{%
    \IfNoText{#1}{% 
        %
    }{%
        \gdef\OptionalBT{\ignorespaces#1}%
    }%
}%
\newcommand{\OptionalNT}{\empty}%
\newcommand{\SetNT}[1]{%
    \IfNoText{#1}{% 
        %
    }{%
        \gdef\OptionalNT{\ignorespaces#1}%
    }%
}%
\newcommand{\OptionalRT}{\empty}%
\newcommand{\SetRT}[1]{%
    \IfNoText{#1}{% 
        %
    }{%
        \gdef\OptionalRT{\ignorespaces#1}%
    }%
}%


% All of these commands in this section are arbitrarily named and point to the therms that are named in the CSV reader section. Essentially, this section uses macros that are defined in the previous sections to generate each definition section. There's some text formatting stuff in here too, including using the 'tabto' package to space things nicely.
\newcommand*{\Show}{%
    \section*{\MandatoryName}
    \IfNoText{\OptionalUse}{}{%
        \underline{use:}~\vbox{\textbf{\OptionalUse}}
    }%
     \IfNoText{\OptionalNote}{}{%
         \vbox{\small\textit{\OptionalNote}}
    }%
    \IfNoText{\OptionalBT}{}{%
         \tab\textbf{BT:}~\tab\OptionalBT\\
    }% 
    \IfNoText{\OptionalNT}{}{%
         \tab\tab\textbf{NT:}~\tab\OptionalNT\\
    }% 
    \IfNoText{\OptionalRT}{}{%
         \tab\tab\textbf{RT:}~\tab\OptionalRT
    }%
}

% Now that all of that technical stuff is out of the way, this part is to actually generate the document.
\begin{document}

% More formatting stuff.
\begin{multicols}{2}
\pagestyle{fancy}

% This first part tells the CSV reader to import the entries from the spreadsheet and turn them into defined names, depending on the column that they're in. The cool thing here is that these commands repeat for each line in the CSV file and the macros defined from the spreadsheet get redefined each time it repeats.
% Also note that I had to change the CSV separator to semicolon (I also changed it on my computer in the Locale settings) because some of the thesaurus defintions have commas and it was screwing up the import. 
% Also note that the terms that are defined are related to the commands in the previous section and come directly from the CSV file headers.
\csvreader[separator=semicolon,head to column names]{Data.csv}{Term=\Term,Use=\Use,Note=\Note,BT=\BT,NT=\NT,RT=\RT}
{%
    \SetName{\Term}
    \SetUse{\Use}
    \SetNote{\Note}
    \SetBT{\BT}
    \SetNT{\NT}
    \SetRT{\RT}
    \raggedcolumns\Show
}%

\end{multicols}

\end{document}

Lots of help from: http://tex.stackexchange.com/questions/23100/looking-for-an-ignorespacesandpars/23110#23110 and http://tex.stackexchange.com/questions/42280/expand-away-empty-macros-within-ifthenelse
```


<object data="projects/InMagic-thesaurus.pdf" type="application/pdf" width="100%" height="100%">
</object>

<iframe src="/projects/InMagic-thesaurus.pdf" style="width:100%; height:500px;" frameborder="0"></iframe>