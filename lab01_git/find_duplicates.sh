#!/bin/bash
  #This script was based on that available on https://github.com/diego0020/lab_vision/tree/master/lab00_linux_intro
  #Change to wanted directory
  cd $1
  # find all files whose name end in .tif
  images1=$(find . -name "*.tiff")
  images2=$(find . -name "*.tiff")

  #iterate over them
  for im1 in ${images1[*]}
  do
    for im2 in ${images2[*]}
    do
       # check if two files are equal
       comp=$(cmp $im1 $im2|wc -l)

       # $? gives the exit code of the last command, in this case cmp, it will contain "differ" if a difference was found
       if [ $comp -eq 0 -a $im1 != $im2 ]
       then
          echo $im1 is duplicated in $im2
       fi
    done
  done