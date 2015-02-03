# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/raficuperman/lab_vision.git

2.  What is the output of the ``cal`` command?

    >"The cal utility displays a simple calendar in traditional format 		and ncal offers an alternative layout, more options and the 		date of Easter.  The new format is a little cramped but it 		makes a year fit on a 25x80 terminal.  If arguments are 	not specified, the current month is displayed." Es decir, el comando cal muestra el calendario del mes actual, junto con el día presente resaltado. Al ejecutarlo se observa lo siguiente:
January 2015 
Su Mo Tu We Th Fr Sa 
             1  2  3  
 4  5  6  7  8  9 10 
11 12 13 14 15 16 17 
18 19 20 21 22 23 24 
25 26 27 28 29 30 31


# Homework Questions

1.  What is the ``grep``command?

    >   El comando grep es un comando que busca, en los archivos seleccionados, las líneas de ellos que contengan una cadena de caracteres específicos. Por ejemplo, el comando 'grep hola saludo.txt' buscará en el archivo saludo la palabra hola y mostrará las líneas de dicho archivo que contienen hola
2.  What is a *makefile*?
    >   Un makefile es un archivo de texto que dicta las reglas de compilación de un programa que se desea compilar (y luego instalar) bajo el comando 'make'. En este documento escrito se encuentra información como manuales, dónde instalar los ficheros, documentos, datos, etc

3.  What is *git*?
    >   Git es un software con el cual se puede tener un muy buen manejo de control de versiones de un documento para así llevar control sobre los cambios que se han hecho sobre este. Una de las diferencia más importante de git con respecto a otros softwares de control de versiones, se basa en que git maneja los datos como una sucesión de snapshots.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   La opción -prune bajo el comando 'find' hace que se excluda la búsqueda realizada por 'find' en el (o los) directorios seleccionados. Por ejemplo, la sentencia 'find . -name "*.md"' buscará todos los archivos que terminen en .md en la carpeta actual (incluyendo las carpetas que están dentro de la carpeta actual), sin embargo la sentencia 'find . -name "lab*" -prune -o -name "*.md"' buscará todos los archivos que terminen en .md en la carpeta actual, exceptuando buscar en los directorios que comienzan por "lab"
5.  Where is the file ``xxxxxx``
    >   Se puede buscar este archivo empezando desde el Home con el siguiente comando: find ~ -name "xxxxxx"

6.  How many files with ``gnu`` in its name are in ``/usr/src​``
    >   Mediante el siguiente comando se puede saber lo anterior: find ./usr/src​ -name "*gnu*" | wc -l

7.  How many files contain ``gpl`` inside in ``/usr/src​``
    >   Mediante el siguiente código se puede saber lo anterior:grep -rl gpl ./usr/src​ |wc -l


8.  What does the ``cut`` command do?
    >   El comando cut, como su nombre lo dice, corta o extrae una parte específica de una línea de texto determinada por las opciones del comando.

9.  What does the ``wget`` command do?
    >   El comando wget permite descargar archivos de internet a partir de la URL, por ejemplo.

10.  What does the ``diff`` command do?
    >   El comando diff compara dos archivos línea por línea, mostrando las líneas que no se encuentran exactamente igual en ambos archivos.

11.  How many users exist in *Guitaca*?
    >   48 (mediante el comando cat /etc/passwd)

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cut -d':' -f1,7 /etc/passwd | sort -t':' -k 2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   cat  /etc/passwd | grep "/sbin/nologin" | wc
        Son 41

14.  What is the name of the linux distribution running on *Guitaca*?
    >   Linux version 3.17.8-200.fc20.x86_64 (mockbuild@bkernel02.phx2.fedoraproject.org) (gcc version 4.8.3 20140911     >(Red Hat 4.8.3-7) (GCC) ) #1 SMP Thu Jan 8 23:26:57 UTC 2015

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github 
    >	El script se encuentra subido a github. Este script genera el hash de cada imagen terminada en .tiff (si están en otro formato sólo basta con cambiar .tiff al formato correspondiente), los ordena y luego con el comando uniq compara estos hash de cada imagen, mostando el nombre de las imagenes que tienen este mismo valor, es decir, son duplicadas. Referencia: "Find Duplicate Files (based on Size First, Then MD5 Hash)." Commandlinefu.com. N.p., 4 Aug. 2008. Web. 02 Feb. 2015. <http://www.commandlinefu.com/commands/view/3555/find-duplicate-files-based-on-size-first-then-md5-hash>.


16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   El par de caracteres #! se denomina un shebang. A continuación de el shebang, al principio del script, se le especifica al shell cuál es la dirección exacta del programa que va a interpretar el script para ejecutarlo. En este caso, se entiende que el programa que interpretará el script se encuentra en /bin/bash

17. How many unique images are in the ``sipi_images`` folder?
    >   Hay 215 imágenes únicas en sipi_images. Se encuentra este número ejecutando el script ImagenesUnicas.sh (que se encuentra subido a github) dentro de la carpeta sipi_images

    
