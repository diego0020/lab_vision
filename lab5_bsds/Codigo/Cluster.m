clc 
clear all
close all
%Se extrae la direccion en la cual se encuentra la imagen
Direccion= '/Users/carlosreyes/Documents/MATLAB/Clustering/BSDS500/data/images/train';
%Se convierte la carpeta donde se encuentran las imagenes en un archivo que
%se puede iterar
Imagenes=dir(Direccion);
et=cell(1,length(Imagenes)-3);
%Se crea una celda con el numero de k que se va a variar
segs=cell(1,10);
% Se recorre la carpeta en las cuales se contienen las imagens
for i=3:length(Imagenes)-1
    % Se recorren los 10 k escogidos
    for j=2:11
    Nombre=Imagenes(i).name;
    %se lee la imagen correspondiente a la posicion i
    Imagen=imread(strcat(Direccion,'/',Nombre));
    %Se llama la funcion creada y se concatena el resultado en la celda
    %segs
    segs{j-1} = segment_by_clustering( Imagen, 'hsvxy', 'GMM',j);    
   
    end 
    
 disp(i)
 % se guarda en un archivo .m la matriz de respuesta al clustering
save(strcat(fullfile('train','hsvxy'),'/',Nombre(1:end-4),'.mat'),'segs');

end

for i=3:length(Imagenes)-1
    % Se recorren los 10 k escogidos
    for j=2:11
    Nombre=Imagenes(i).name;
    %se lee la imagen correspondiente a la posicion i
    Imagen=imread(strcat(Direccion,'/',Nombre));
    %Se llama la funcion creada y se concatena el resultado en la celda
    %segs
    segs{j-1} = segment_by_clustering( Imagen, 'labxy', 'GMM',j);    
   
    end 
    
 disp(i)
 % se guarda en un archivo .m la matriz de respuesta al clustering
save(strcat(fullfile('train','labxy'),'/',Nombre(1:end-4),'.mat'),'segs');

end

for i=3:length(Imagenes)-1
    % Se recorren los 10 k escogidos
    for j=2:11
    Nombre=Imagenes(i).name;
    %se lee la imagen correspondiente a la posicion i
    Imagen=imread(strcat(Direccion,'/',Nombre));
    %Se llama la funcion creada y se concatena el resultado en la celda
    %segs
    segs{j-1} = segment_by_clustering( Imagen, 'rgbxy', 'GMM',j);    
   
    end 
    
 disp(i)
 % se guarda en un archivo .m la matriz de respuesta al clustering
save(strcat(fullfile('train','rgbxy'),'/',Nombre(1:end-4),'.mat'),'segs');

end
