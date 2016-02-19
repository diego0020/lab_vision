# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/PardoAlejo/lab_vision

2.  What is the output of the ``cal`` command?

        multi
        line
        answer

# Homework Questions

1.  What is the ``grep``command?
    >   grep allows to look for a command in the code, and helps to make many actions, like print in the screen, count the number of matches, and look for complexes combinations of strings.

2.  What is a *makefile*?
    >   Is the file that allow the project to be build. 

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   prune option help to find what we are looking for, without search in all subdirectories or without look in a particular subdirectory. 

5.  Where is the ``grub.cfg``  file
    >   This is the default boot loader and launcher of ubuntu, and it is in /boot/grub/grub.cfg.

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   0 files  using find /usr/src/ - gnu | wc -l.

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   844 files, by using: grep -irm 1 "gpl" /usr/src/ | wc -l


8.  What does the ``cut`` command do?
    >   with the command cut, you can "cut" the number of characters to the number of characters that you want. 

9.  What does the ``wget`` command do?
    >   this command follow links of the web and download files, also can create local versions of websites, recreating the directoy of the original file, in order to prevents you to repeat the same processes in the same website many times.

9.  What does the ``rsync`` command do?
    >   rsync allows to transfer just the differences between two sets of files across the network link, 

10.  What does the ``diff`` command do?
    >   Diff command analize a couple of files and print on the screen the lines which both are different.

10.  What does the ``tail`` command do?
    >   read the last lines of a file and write them as an output.

10.  What does the ``tail -f`` command do?
    >  with the additional -f, allows to the file to be monitored, if the file is modified by another process, tail shows in the display the changes, it is mainly use to monitor log files.

10.  What does the ``link`` command do?
    >   Links two files, and in consecuence any change in one of the files affects the other one. It link the files puting them in the same place of the disk.

11.  How many users exist in the course server?
    >   38

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   answer

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   answer

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   answer

17. How many unique images are in the ``sipi_images`` database?
    >   answer
    
