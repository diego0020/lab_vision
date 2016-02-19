# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/CarlosAAcostaH/lab_vision.git

2.  What is the output of the ``cal`` command?

           February 2016
           Su Mo Tu We Th Fr Sa
           1  2  3  4  5  6
           7  8  9 10 11 12 13
           14 15 16 17 18 19 20
           21 22 23 24 25 26 27
           28 29
           


# Homework Questions

1.  What is the ``grep``command?
    >
        "The grep utility searches any given input files, selecting lines that
         match one or more patterns"
                                                                       -man grep

2.  What is a *makefile*?
    >   A *makefile* is a text file used to built or manange proyects with commands in C/C++

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   
            ``-prune`` causes ``find`` to not descend into the current file.
            Ex.: find . -name .ingnore_Dir -prune -o -name '*.xyz' -print
            It will find files with xyz extention but ignore the directory `.ignore_Dir`

5.  Where is the ``grub.cfg``  file
    >   On ubuntu exist 3 ubications: /etc/grub.d, /usr/lib/grub and /usr/share/grub. On MacOS don't exist.

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   zero (find /usr/src/ -name gnu | wc -l)

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   52 files (grep -lr "gpl" /usr/src/ | wc -l)

8.  What does the ``cut`` command do?
    >   
        "cut out selected portions of each line of a file"
                                                    -man cut

9.  What does the ``wget`` command do?
    >   Download files from the Web

9.  What does the ``rsync`` command do?
    >   Copy files localy and to/from another host

10.  What does the ``diff`` command do?
    >   
        "Compare files line by line"
                               -man diff

10.  What does the ``tail`` command do?
    >  
        "Print  the  last  10  lines of each FILE to standard output"
                                                            -man tail

10.  What does the ``tail -f`` command do?
    >   Show the new lines in the file in real time

10.  What does the ``link`` command do?
    >   Creates ``linked files``

11.  How many users exist in the course server?
    >   30 users

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cut -d':' -f1,7 /etc/passwd | sort | tr ':' '\t'

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   grep '/sbin/nologin' /etc/passwd | cut -d':' -f1 | wc -l

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   The first two characters ``#!`` mean that the file is executable. The rest of the line mean the path where the script is execute.

17. How many unique images are in the ``sipi_images`` database?
    >   answer
    
