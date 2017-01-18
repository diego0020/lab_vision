function Lab 
%%Laboratorio Imagenes Hibridas 
close all 
clear all 
%Lectura de las imagenes 
imagen1=imread('Imagen1.jpg');
imagen2=imread('Imagen2.jpg');

tam_im1=size(imagen1);

%Se cambia el tamaño de la Imagen 2 para que las dos imagenes queden del
%mismo tamaño 
imagen2=imresize(imagen2,[tam_im1(1) tam_im1(2)]);

%Creacion de Filtro Gaussiano para las imagenes 
Gauss=fspecial('gaussian',17,15);

%Filtro Pasa Bajas Imagen 1 
Low_Im1=imfilter(imagen1,Gauss);
%Filtro Pasa Altas Imagen 1 
High_Im1=imagen1-Low_Im1;

%Filtro Pasa Bajas Imagen 2 
Low_Im2=imfilter(imagen2,Gauss);
%Filtro Pasa Altas Imagen 2 
High_Im2=imagen2-Low_Im2;

%Creacion de la Imagen Hibrida 
H=High_Im1+Low_Im2;


%Visualizacion de la imagen hibrida. (Función tomada de "Project 1: Image
%Filtering and Hybrid Image": url:
%http://cs.brown.edu/courses/cs143/proj1/. La funcion esta disponible en el codigo disponible
% en el .zip. Nombre de la Funcion vis_hybrid_image) 
Result=vis_hybrid_image(H);
imshow(Result)
imwrite(Result,'Piramide.jpg')

function output = vis_hybrid_image(hybrid_image)
%visualize a hybrid image by progressively downsampling the image and
%concatenating all of the images together.

scales = 7; %how many downsampled versions to create
scale_factor = 0.8; %how much to downsample each time
padding = 5; %how many pixels to pad.

original_height = size(hybrid_image,1);
num_colors = size(hybrid_image,3); %counting how many color channels the input has
output = hybrid_image;
cur_image = hybrid_image;

for i = 2:scales
    %add padding
    output = cat(2, output, ones(original_height, padding, num_colors));
    
    %dowsample image;
    cur_image = imresize(cur_image, scale_factor, 'bilinear');
    %pad the top and append to the output
    tmp = cat(1,ones(original_height - size(cur_image,1), size(cur_image,2), num_colors), cur_image);
    output = cat(2, output, tmp);    
end

%code by James Hays