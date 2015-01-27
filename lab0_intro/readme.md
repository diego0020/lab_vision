# Introduction to the lab

## Before

1. Boot from a live cd
2. Configure keyboard and software repository

## Linux

1. The graphical interface
2. Ubuntu flavors https://wiki.ubuntu.com/UbuntuFlavors
2. The file system through the terminal
   -  ls
   -  cd
   -  cat
   -  mv
   -  cp
   -  rm
   -  touch
   -  echo
   -  nano
   -  find
   -  find --help
   -  man find
   -  which find

2. Find the ```passwd```file
   -  use find
   -  2> /dev/null

3. Display better with
   
   ```bash
   cat /etc/passwd | tr ':' '\t'
   ```


## Image database

1. connect to guitaca

   ```bash
   
   #connect
   ssh vision@guitaca.uniandes.edu.co
   
   #copy 
   scp vision@guitaca:/home/vision/sipi_images/<file> .
   ```
   
2.  decompress images (use ``tar``, check the man)
3.  use  ``imagemagick`` to find all *grayscale* images
    
    ```bash
    find . -name "*.tiff" -exec identify {} \; | grep -i gray | wc -l
    ```
    
4.  create a script to copy all *color* images to a different folder
       
      ```bash
      #!/bin/bash
      
      cd ~
      rm -r color_images 2>/dev/null
      mkdir color_images
      images=$(find sipi_images -name *.tiff)
      
      for im in ${images[*]}
      do
         identify $im | grep -q -i gray
         if [ $? -eq 0 ]
         then
            echo $im is gray
         else
            echo $im is color
            cp $im color_images
         fi
      done
      
      ```
      -  save it for example as ``find_duplicates.sh``
      -  make executable (``chmod u+x``)
      -  run (``./find_duplicates.sh``)
      
5.  find all images with size larger than 500k
    how many are there? (use ``wc``)
   

## Compiling

4. Install git (from terminal)
5. package ``g++`` and ``autoconf``
5. clone open syobon
6. 
   ```bash
   git clone https://github.com/Alexander--/open-syobon.git
   ```
   
6. read install
7. activate universe repository
6. install dependencies (SDL version 1.2)
   > Note: to search packages use ``apt-cache search ```

   ```bash
   sudo apt-get install libsdl-gfx1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libfontconfig1-dev
   ```
   
   
7. Create configure file

   ```bash
   #to generate the configuration file
   autoreconf --install
   autoconf
   ```
   
   
7. compile game

   ```bash
   ./configure --prefix=/usr/local
   make
   sudo make install
   ```
   > Note in newer projects ``cmake`` is replacing configure
   
8. test

   ```bash
   syobon -window
   #If he is jumping like crazy press all 4 arrow keys sequentially
   ```

## GitHub

1. closer look to open syobon repository
   
   - commits
   - author: repositories, activity

2. vision lab repository
3. fork vision lab repository

## SmartGit

2. Install smart git http://www.syntevo.com/smartgit/download
   choose debian package
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



