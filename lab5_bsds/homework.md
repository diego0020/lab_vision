1. Métodos de segmentación: 
 
 Descripción básica de los métodos. Alternativas para el espacio de segmentación. ¿Qué métodos escogieron? ¿Por qué?
 ### Método K-means
 Es el método de segmentación mas simple y segmenta en k clusters donde k es un parametro. Su funcionamiento depende de los centroides iniciales. El algoritmo de este método es:
  1. Definir k centroides en el el espacio de segmentación
  2. Realizar la partición del espacio de segmentación con un diagrama de Voronoi con los k centroides
  3. Recalcular el centroide de las k celdas como el promedio de los puntos pertenecientes a la celda de Voronoi
  4. Si los centroides cambian, vuelva a paso ii; de lo contrario termino.
 Al finalizar el algoritmo, el punto pertenece al cluster correspondiente al centroide mas cercano.
 
### Método GMM
Al igual que en el método de K-means, se recibe como parametro el numero de clusters deseados. En este caso no se asigna la pertenencia de un punto a un cluster durante la ejecución del método sino que se le asigna la probabilidad de pertenecer a un cluster y al finalizar se le asigna la etiqueta correspondiente al cluster más probable.

###Método Watershed
En este método se convierte la imagen con un sólo descriptor a un relieve del cual se encuentra las líneas de división de aguas. Para este método se convierte en escala de grises y el relieve es la magnitud del gradiente de la imagen en escaladegrises

2. Metodología de pruebas: 

 Descripción de la base de datos: ¿Cuántas imágenes son? ¿De qué tamaño? ¿De qué tipo ? ¿Cómo estaba organizada? ¿Cuál era la verdad terreno?; ¿Qué era lo que se medía en el benchmark? También rectificar que hubieran usado adecuadamente los conjuntos de train y test; especialmente que no hubieran iterado sobre "test".
3. Presentación resultados: 
 
 ¿Corrieron el benchmark con éxito? ¿Presentan imágenes segmentadas para ilustrar los procedimientos? ¿Describen con palabras los aspectos importantes que se ven en las imágenes y las gráficas?  
4. Discusión: 
 
 ¿Cómo se comparan los algoritmos? ¿A qué creen que se deben las diferencias? ¿Cuáles son las implicaciones prácticas de los resultados? ¿Qué método recomiendan? ¿Cuáles son las limitaciones de los métodos?
5. Mejoras: 

 ¿Cómo se podrían obtener mejores resultados en la segmentación? (acá pueden ser muy creativos)
