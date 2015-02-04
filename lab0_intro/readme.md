# Introduction to the lab

## Preparation

1. Boot from a live cd
   We will be using the [Ubuntu gnome](http://ubuntugnome.org/) distribution

2. Configure keyboard and software repository
   From the *Activities* menu (top left corner, or *start* key):
      -  Go to settings, keyboard and add the layout for latin america
      -  Go to software and updates, and select the server for Colombia

## Introduction to Linux

1. The graphical interface
   Linux can be run using a graphical interface. There are several of these available for every taste.
   (http://www.howtogeek.com/163154/linux-users-have-a-choice-8-linux-desktop-environments/).
   Most activities can be accomplished from the interface, but the terminal is where the real power lies.

2. Linux Distributions
   Linux is free software, and as such it is possible for people to do all kinds of things with it.
   The main component in linux is the kernel, which is the part of the operating system that communicates
   with the hardware and manages resources. On top of it applications run. Just the kernel is not very useful,
   applications are required to get the job done. Distributions pack together the kernel with several 
   applications in order to provide a complete system. There are hundreds of linux distributions available. In
   this lab we will be using Ubuntu because it is one of the largest, more supported, and user friendly distributions.

2. The file system through the terminal
   Some basic systems to navigate through the file system

   -  ls: List contents of current directory
   -  pwd: Give location of current directory
   -  cd: Change Directory
   -  cat: Print contents of a file (and concatenate files)
   -  mv: Move a file
   -  cp: Copy a file
   -  rm: Remove a file
   -  touch: Create a file, or update its timestamp
   -  echo: Print something to standard output
   -  nano: Edit files
   -  find: Find files and perform actions on it
   -  which: Find the location of a binary

   Some special directories are:
      - ``.`` (dot) : The current directory
      -  ``..`` (two dots) : The parent of the current directory
      -  ``/`` (slash): The root of the file system
      -  ``~`` (tilde) :  Home directory
      
   Take some time to explore the file system
   
   To find more information about a command call it with the ``--help`` flag, call ``man <command>``, like
   for example ``man find`` or search in google.

2. Find the ```passwd```file
   >  ``find / -name passwd 2 > /dev/null``

   The ``2>`` operator redirects the error output to ``/dev/null``. This is a special file that acts as a sink,
   anything that is send to it will dissappear. Other important redirection operations are
      -  `` > `` : Redirect standard output to a file
      -  `` | `` : Redirect standard output to standar input of another program
      -  `` 2> ``: Redirect error output to a file
      -  `` < `` : Send contents of a file to standard input
      -  `` 2>&1``: Send error output to the sampe place as standard output

3. To have a nicer display of the *passwd* we can use the following command. It sends the content of the 
   file to the ``tr`` command, which translates columns to tabs.

   ```bash
   cat /etc/passwd | tr ':' '\t'
   ```


## Image database

1. The following command lets us connect to another system and use the terminal as it where there,
   the second command lets us copy files between systems.

   ```bash
   
   #connect
   ssh vision@guitaca.uniandes.edu.co
   
   #copy 
   scp vision@guitaca:/home/vision/sipi_images/<file> .
   ```
   
2.  Decompress the images (use ``tar``, check the man)
3.  use  ``imagemagick`` to find all *grayscale* images
    Notice that we first need to install the *imagemagick* package by typing

    ```bash
    sudo apt-get install imagemagick
    ```
    
    Sudo is a special command that lets us perform the next command as if we were system administrators
    (super users). In general it is not recommended to work as a super user, it should only be used 
    when it is necessary. This is like that to protect you from breaking the system.
    
    ```bash
    find . -name "*.tiff" -exec identify {} \; | grep -i gray | wc -l
    ```
    
4.  Create a script to copy all *color* images to a different folder
    Lines that start with # are comments
       
      ```bash
      #!/bin/bash
      
      # go to Home directory
      cd ~
      # remove the folder created by a previous run from the script
      rm -r color_images 2>/dev/null
      # create otuput directory
      mkdir color_images
      # find all files whose name end in .tif
      images=$(find sipi_images -name *.tiff)
      
      #iterate over them
      for im in ${images[*]}
      do
         # check if the output from identify contains the word "gray"
         identify $im | grep -q -i gray
         
         # $? gives the exit code of the last command, in this case grep, it will be zero if a coincidense was found
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
      -  make executable ``chmod u+x`` (This means add Execute permiisin for the user)
      -  run ``./find_duplicates.sh`` (The dot is necessary to run a program in the current directory)
      
5.  Find all images with size larger than 500k
    how many are there? (use ``wc`` and ``find``)
   

## Compiling a program

4. Install git (use ``apt-get`` as before)
5. Also install ``g++`` and ``autoconf`` 
5. clone open syobon
   ```bash
   git clone https://github.com/Alexander--/open-syobon.git
   ```
   This will create the repository directory in the current directory
   
6. Find a file named ``install`` and read it.
6. install dependencies (SDL version 1.2)
   > Note: to search packages use ``apt-cache search ``

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
   > WARNING: The game is very noisy

   ```bash
   syobon -window
   #If he is jumping like crazy press all 4 arrow keys sequentially
   ```

## GitHub

1. Open the openSyobon repository on the web browser
   https://github.com/Alexander--/open-syobon
   
   -  Look at the commit history
   -  How many other repositories does the author have

2. Vision lab repository: https://github.com/diego0020/lab_vision
   
3. Fork vision lab repository to your account

## SmartGit

1. Install smart git from http://www.syntevo.com/smartgit/download
   choose debian package
2. Configure your github account
3. Clone your fork of the vision_lab repository (use the clone button)
4. open the ``questions.md`` file
4. answer the first question in the github web interface, and commit
5. pull
   > This will bring changes from the server to your local copy
6. answer the second question in gedit at your local pc
5. commit the changes
6. push
   > This sends changes from your local copy to the server
7. verify changes in github

   Notice that in order to push, your local copy and that of the server must be synchronized. If it is not the
   case, you need to first pull the changes from the server, and rebase or merge, solving the possible conflicts.
   
   For more information about git look at
   https://www.atlassian.com/git/tutorials

## Homework

Answer the rest of the questions in ``questions.md``



