% Script for finding duplicate images based on their content 
% Taken from https://www.linux.com/learn/tutorials/774031-how-to-sort-and-remove-duplicate-photos-in-linux

% This counts all the files in Pictures without counting directories:
find Pictures/ -type f | wc -l 

% It finds only duplicates, and will not count files that are not duplicated:
find Pictures/  -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > dupes.txt

% Counts all the lines with filenames:
awk 'NF != 0 {++count} END {print count}' dupes.txt

% look for the blank lines, and then counts only the line immediately following a blank line:
awk '/^$/{getline;print;}' dupes.txt |wc -l 


% Another way to look for duplicates is with the fdupes command, whose only job in life is to find duplicate files, 
% and to optionally delete them. It operates like our long find command, using md5sums, with the advantage of being simpler to use. 
% It has a simple set of options that you can read all about in man fdupes, and it displays a progress meter as it works. 
% This example counts up all the duplicates in Pictures, and how much disk space they're using:
fdupes -rSm Pictures/
