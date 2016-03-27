# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/milongo/lab_vision

2.  What is the output of the ``cal`` command?

           Febrero 2016      
do lu ma mi ju vi sá  
    1  2  3  4  5  6  
 7  8  9 10 11 12 13  
14 15 16 17 18 19 20  
21 22 23 24 25 26 27  
28 29   

# Homework Questions

1.  What is the ``grep``command?
    >  grep searches files for specified words or patterns

2.  What is a *makefile*?
    >   A makefile is a file that contains shell commands. While in its directory, typing "make" into the terminal will execute the commands in it. 

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   The prune option of find enables one to ignore a directory and the files under it when using find (which searches for files in a directory hierarchy). 

> find . -type d -name '.git*' -prune -o -type f -print

This would prune out directories starting with .git

5.  Where is the ``grub.cfg``  file
    >   /usr/share/doc/grub-common/examples/grub.cfg


6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   0

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   150

8.  What does the ``cut`` command do?
    > it prints selected parts of lines from a given file.

9.  What does the ``wget`` command do?
    >   wget allows non-interactive download of files from the web.

9.  What does the ``rsync`` command do?
    >   rsync is a file copying tool. 

10.  What does the ``diff`` command do?
    >   the diff command compares two files line by line
10.  What does the ``tail`` command do?
    >   tail outputs the last 10 lines of a file.

10.  What does the ``tail -f`` command do?
    >   outputs the appended data as the file grows

10.  What does the ``link`` command do?
    >   calls the link function to create a link to a file

11.  How many users exist in the course server?
    >   30

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   answer

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   grep '/sbin/nologin' table.txt | wc -l


15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   It tells the shell that the script should be run using bash language

17. How many unique images are in the ``sipi_images`` database?
    >   can't decompress/access images

