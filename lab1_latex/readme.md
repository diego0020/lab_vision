# Lab 1: Intro to LaTeX

Companion Slides are available at http://goo.gl/xJ3SBu


## Required packages

- git-gui
- gitg
- kile
- inkscape
- gimp
- dvipng
- ghostscript
- imagemagick
- psutils
- texlive
- texlive-humanities
- python-pygments
- kbibtex
- texlive-latex-extra 
- texlive-latex-recommended

## Pre requisite

1.	Clone the original copy this repository at https://github.com/diego0020/lab_vision; also clone your own fork.
2.	Copy the folder lab1_latex from the original repository into your fork
3.	Copy the .gitignore file from the original repositor into your fork (notice this is a *hidden* file)
4.	Commit changes in your fork
5.	Push your fork to github

> If you like challenges, try *pulling* from the original repository into your fork

## Introduction

Latex files behave very well with version control, however latex uses several intermediary files that we don't
need in the version control system. The only files we trully want are the source files, including images and 
other assets. 

The ``.gitignore`` file tells git to ignore files whose name match a certain pattern. Take a look at it.
  
## Style files  
  
Latex style files control most of the stetic aspects from the document. When writing articles for magazines
or congress, the will provide you with the style file and instructions on how to use it. Style files should
be copied to the same directory as the rest of your latex source files. This repository already includes the 
[cvpr](http://www.pamitc.org/cvpr15/author_guidelines.php) style. To look at it compile their example file
``egpaper_final.tex``.
  
## Images

  - The file ``1-images.tex`` illustrates how to add images in LaTeX.
  - It contains the same image in several different formats
  	- Can you see the differences?
  	- Which format is more appropriate?
  - Look at the slide about image formats for LaTeX
  - To edit vector graphics (svg or pdf) you may use [inkscape](https://inkscape.org)
  - To edit raster graphics (png or jpg) you may use [gimp](https://gimp.org)
  
##  Code

  - The file ``2-code.tex`` illustrates how to add code fragments in LaTeX.
  - It uses the [Minted](https://github.com/gpoore/minted) package
  - The latest version of minted is included in this repository
  - requires the *-shell-escape* flag
  	- 	If you are using *kile* go to settings > build > pdflatex and add this flag to the command
  	- 	Be very careful with extra ading extra minus signs ``-``
      


##  Bibliography

Latex uses the *bibtex* program to insert bibliography into documents. Bibtex reads its data from a documents
database with ``.bib`` extension. This database is a plain text file with the format described 
[here](http://www.bibtex.org/Format/). In order to add a reference in LaTeX use ``\cite{ref}`` where ref
is the identifier of the reference in the bibtex database. Notice the database may contain several more items
than the ones you are citing in the current document. 

The bibtex database format is very complex, and hard to maintain by hand. Fortunately there are several 
graphical applications that can do this for you.
    -   Local
    	-   JabRef
    	-   Mendeley
    -	Cloud
    	-   Zotero
    	-   kbibtex

Be sure to check them out and start using them.

The file ``3-bibliography.tex`` illustrates how to add bibliography in LaTeX; using the database file ``vision.bib``

