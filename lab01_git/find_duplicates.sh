#!/bin/bash

# Declaracion de variables
declare -A arr
shopt -s globstar

# Ciclo for iterativo
for file in **; do
  [[ -f "$file" ]] || continue

  # Revisa el checksum de cada archivo
  read cksm _ < <(md5sum "$file")
  if ((arr[$cksm]++)); then 
    # Si los checksum son iguales imprime el nombre del archivo, es decir los archivos son el mismo.
    echo "rm $file"
  fi
done

#Extraido de: http://superuser.com/questions/386199/how-to-remove-duplicated-files-in-a-directory