# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/diego0020/lab_vision

2.  What is the output of the ``cal`` command?

   febrero de 2016  
lu ma mi ju vi sá do
 1  2  3  4  5  6  7 
 8  9 10 11 12 13 14 
15 16 17 18 19 20 21 
22 23 24 25 26 27 28 
29                   

# Homework Questions

1.  What is the ``grep``command?
    >   Searches for a pattern inside a file or on the standard input. This command has so much options

2.  What is a *makefile*?
    >   It is a file with several shell commands inside that the command "make" will execute while in a directory containing it.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   It prevents find command from recursive into matching directories.
    > e.g. find lab_vision -prune will show listed only the lab_vision directory, if any, due to it was prevented to in there.

5.  Where is the ``grub.cfg``  file
    >   That file does not exist.

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   no one in my linux

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   no one in my linux

8.  What does the ``cut`` command do?
    >   Print selected parts of lines from each FILE to standard output.

9.  What does the ``wget`` command do?
    >   it is a non iteractive network downloader

9.  What does the ``rsync`` command do?
    >   It is a remote file copying tool.

10.  What does the ``diff`` command do?
    >   It compares to files lene by line.

10.  What does the ``tail`` command do?
    >   It shows the last 10 lines of a file.

10.  What does the ``tail -f`` command do?
    >   It continues showing each new final

10.  What does the ``link`` command do?
    >   It creates a link to a file

11.  How many users exist in the course server?
    >   more /etc/passwd|wc -l

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cut -d : -f 1,7 /etc/passwd|sort -t : -k 2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   cut -d : -f 1,7 /etc/passwd|sort -t : -k 2

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   It is to comunicate which interpreter must be used

17. How many unique images are in the ``sipi_images`` database?
    >   Excuse me but I did not understand this question.
    
