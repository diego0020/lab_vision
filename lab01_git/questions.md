# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/JaMartinez1423/lab_vision

2.  What is the output of the ``cal`` command?

    >  Una matriz con los días y las fechas del presente mes. Esto mostrado en el promt de la terminal.

# Homework Questions

1.  What is the ``grep``command?
    >   Se utiliza para buscar palabras dentro de un archivo especificado como parámetro de entrada.

2.  What is a *makefile*?
    >   Es un archivo en donde se especifica una serie de programas que deben ser compilados al ejecutar el comando make.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   Permite encontrar el  parámetro de búsqueda sin tener que recorrer cada uno de los directorios.

5.  Where is the ``grub.cfg``  file
    >   En la carpeta /boot/grub .

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   0

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   0

8.  What does the ``cut`` command do?
    >   Permite seleccionar la cantidad de caracteres que entra por parámetro.

9.  What does the ``wget`` command do?
    >   Permite seguir links de internet. 

9.  What does the ``rsync`` command do?
    >   Por medio de un protocolo de transmisión de datos se envían las diferencias entre dos grupos de datos.

10.  What does the ``diff`` command do?
    >   Este comando permite visualizar las diferencias (lineas añadidas o eliminadas) entre dos archivos.

10.  What does the ``tail`` command do?
    >   Permite visualizar las ultimas lineas de un archivo.

10.  What does the ``tail -f`` command do?
    >   Con el parámetro -f se permite monitorear el archivo especificado, mostrado las ultimas lineas cada vez que cambia el mismo.

10.  What does the ``link`` command do?
    >   Permite enlazar dos archivos, generando cambios en uno cuando el otro es modificado. Esto se hace cambiando la dirección de almacenamiento de uno de los archivos.

11.  How many users exist in the course server?
    >   39

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cat /etc/passwd | sort

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   cat /etc/passwd | grep '/sbin/nologin'| wc -l

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   Este comienzo le permite saber a Unix con que programa debe ejecutarse el script. Por defecto utilizara bash, de lo contrario el programa especificado.

17. How many unique images are in the ``sipi_images`` database?
    >   301
    
