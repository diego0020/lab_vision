# Introduction to the lab

## Before

1. Install ubuntu linux on virtual machine
2. Install vbox guest additions

## Linux

1. Tour the interface
2. ubuntu flavors https://wiki.ubuntu.com/UbuntuFlavors
2. Tour the file system through the terminal
   -  ls
   -  cd
   -  cat
   -  touch
   -  echo
   -  nano
   -  find
   -  find --help
   -  man find
   -  which find

2. Find the ```password```file
   -  use find
   -  2> /dev/null

## get images

1. connect to guitaca

   ```bash
   
   #connect
   ssh vision@guitaca.uniandes.edu.co
   
   #copy 
   scp vision@guitaca:/home/vision/sipi_images/<file> .
   ```
2.  decompress images
3.  use  ```tiffinfo`` to find all color images
4.  create a script to copy all color images to a different folder
5.  find all images with size larger than 500k
    how many are there? (tip use ``wc``)
   

## Compiling

4. Install git (from terminal)
5. package ``g++`
5. clone open syobon
6. 
   ```bash
   git clone https://github.com/Alexander--/open-syobon.git
   ```
   
6. read install
7. activate universe repository
6. install dependencies (SDL version 1.2), use grep, less with apt-cache
7. Create configure file

   ```bash
   #to generate the configuration file
   autoreconf --install
   autoconf
   ```
   
   use 
   -  apt-cache, 
   -  head, 
   -  less, 
   -  grep
   
7. compile game

   ```bash
   ./configure --prefix=/usr/local
   make
   sudo make install
   ```
   
8. test

   ```bash
   syobon -window
   ```

## GitHub

1. closer look to open syobon repository
   
   - commits
   - author: repositories, activity

2. vision lab repository
3. fork vision lab repository

## Tortoise Git

3. clone copy of vision lab repository
4. open the ``questions.md`` file
4. answer the first question in github
5. pull
6. answer the second question gedit
5. commit
6. push
7. verify changes in github

## Homework

Answer the rest of the questions in ``questions.md``



