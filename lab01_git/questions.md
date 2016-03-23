# Warmup Questions

1.  What is the clone url of this repository?
>   https://github.com/careyes1787/lab_vision

2.  What is the output of the ``cal`` command?
 Pone el calendario  del mes y año en el que se esta
        multi
        line
        answer

# Homework Questions

1.  What is the ``grep``command?
>  El comando grep  busca en los archivos un texto o patrón especifico

2.  What is a *makefile*?
>   Un makefile es un archivo especial que contiene información sobre cómo compilar el software, si se debe incluir información en el archivo ejecutable de depuración,  dónde instalar los binarios compilados terminados (ejecutables), páginas manuales, archivos de datos, archivos de bibliotecas dependientes, archivos de configuración, etc

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   El comando prune no permite que el comando find se meta dentro de otros directorios, solo busca en el actual así pues si se esta buscando una archivo en un directorio y el mismo se encuentra dentro de otra carpeta mediante prune el find solo va a mostrar el que esta en ese directorio

5.  Where is the ``grub.cfg``  file
>  	grub.cfg se encuentra en la ruta  /boot/grub/ grub.cfg

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   66 archivos

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
>   2 grep: linux-headers-4.2.0-16: Is a directory
> grep: linux-headers-4.2.0-16-generic: Is a directory

8.  What does the ``cut`` command do?
>  El comando cut remueve o corta secciones de cada línea de un archivo o archivos .

9.  What does the ``wget`` command do?
>  El comando wget descarga archivo de la red

9.  What does the ``rsync`` command do?
    >   El comando rsync es una herramienta de sincronización de archivos remoto y local mediante el cual se puede ingresar remotamente a librerías en otros ordenadores asi como en el propio

10.  What does the ``diff`` command do?
>   El comando diff analiza dos archivos e imprime las líneas que son diferentes. En esencia, se da salida a una serie de instrucciones para saber cómo cambiar un archivo con el fin de que sea idéntica a la del segundo archivo.

11.  What does the ``tail`` command do?
>   El comando tail muestra las diez últimas líneas de un archivo.

12.  What does the ``tail -f`` command do?
    >   El comando tail-f muestra los últimos diez líneas del archivo y supervisa el archivo para cualquier nuevo cambio

13.  What does the ``link`` command do?
>   El comando link crea un enlace llamado archivo 2 en un archivo 1

14.  How many users exist in the course server?
    >   41

15. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
>   cat /bin/sh /etc/passwd| tr ':' '\t'|sort | cut -f1,4 -d:


16. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
>   grep ' /sbin/nologin' /etc/passwd | cut -d ':' -f 1,10| wc –l

17. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

18. What is the meaning of ``#! /bin/bash`` at the start of scripts?
>   Se llama un shebang y es el que le dice al con que programa se ejecuta el scrip cuando se ejecuta

19. How many unique images are in the ``sipi_images`` database?
    >   301
    
