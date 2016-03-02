# Lab 2: Introduction to LaTeX

## LaTeX Books

- http://en.wikibooks.org/wiki/LaTeX
- https://tobi.oetiker.ch/lshort/lshort.pdf

## Installing LaTeX

### Windows

- MikTex
- TexLive

Tip: Use *sumatraPDF* instead of Adobe Acrobat to preview generated pdfs.

### Linux

Use the package manager, for example in Ubuntu 
´apt-get install texlive´

#### Additional packages

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

### Osx

- MacTex 

## CVPR Style (Must be used on all lab reports) 

http://www.pamitc.org/cvpr15/author_guidelines.php

## LaTeX and git

Latex files work very well with version control, however latex uses several intermediary files that we don't
need in the version control system. The only files we trully want are the source files, including images and 
other assets. 

The ``.gitignore`` file tells git to ignore files whose name match a certain pattern. Take a look at it.

## Compiling (rendering) LaTeX files

LaTeX files are written as plain text, and must be compiled into PDF or DVI to produce publication ready documents. 

From the commandline you can use the ´pdflatex´ (recommended) or ´latex´ commands. Some modern alternatives are ´xelatex´
and ´luatex´, which have better handing of not ascii characters.

Most LaTeX IDEs can call these command automatically and show the results. Moreover, they can link text in the rendered file to text in the source. 
  
## Style files  
  
Latex style files control most of the stetic aspects from the document. When writing articles for a journal
or congress, the will provide you with the style file and instructions on how to use it. Style files should
be copied to the same directory as the rest of your latex source files. This repository already includes the 
[cvpr](http://www.pamitc.org/cvpr15/author_guidelines.php) style. To look at it compile their example file
``egpaper_final.tex``.

## Images

  - The file ``1-images.tex`` illustrates how to add images in LaTeX.
  - It contains the same image in several different formats
  	- Can you see the differences?
  	- Which format is more appropriate?
  - To edit vector graphics (svg or pdf) you may use [inkscape](https://inkscape.org)
  - To edit raster graphics (png or jpg) you may use [gimp](https://gimp.org)

### Image Formats
  
- Vectorial (svg -> pdf)
 - Stores geometry information
 - Can be scaled to any size
 - Great for diagrams and plots
- Raster lossless (png)
 - Stores pixel information
 - Limited resolution
 - Great for renders, screenshots, photos
- Raster lossy (jpg)
 - The compression process discards information
 - Optimized based on human perception of natural images
 - Great for natural photos for humans (Frequencies that our eyes can't perceive are removed, but maybe computers could use this information)
  
##  Code Fragments

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
	-   kbibtex
-	Cloud
	-   Zotero
	-   Mendeley

Be sure to check them out and start using them.

The file ``3-bibliography.tex`` illustrates how to add bibliography in LaTeX; using the database file ``vision.bib``

## Cloud Latex

- [Sharelatex](https://www.sharelatex.com?r=646eabb2&rm=d&rs=b)
- [Overleaf](https://www.overleaf.com/signup?ref=e22adb5e092e)
