addpath('lib')
clear all;close all;clc;
tic
% se carga el diccionario y el entrenamiento
load 'Diccionario.mat'
load 'histrain.mat'
% create filter bank
[fb] = fbCreate;
% se crean las direcciones de test y train
Direccion = 'textures/train';
Imagenes=dir(fullfile(Direccion,'*.jpg'));
k = 50;
DireccionT = 'textures/test';
ImagenesT=dir(fullfile(DireccionT,'*.jpg'));
histest=[];
Anotaciones=cell(0);
Predicciones=cell(0);
dist=[];
% se crean las funciones de distancia chi cuadrado e interseccion de kernel
chi_2_distance = @(x,y)((bsxfun(@minus,x,y).^2)/(bsxfun(@plus,x,y)));
distance_kernel = @(x,Y) sum(bsxfun(@min,x,Y),2);
for i=1:numel(ImagenesT)
    % se abren las imagenes
im2=double(imread(fullfile(DireccionT,ImagenesT(i).name)))/255;
% se asignan los textones a las imagenes de test
tmap = assignTextons(fbRun(fb,im2),textons');
% se crean los histogramas
histest(i,:)=histc(tmap(:),1:k)/numel(tmap);
% se obtienen las anotaciones para cada imagen de test
Anotaciones{i}=ImagenesT(i).name(2:3);
% se compara con las distancias anteriormente obtenidas los histogramas del
% entrenamiento y del test
for j=1:numel(Imagenes)
   %dist(j)=chi_2_distance(histest(i),histrain(j)); 
   dist(j)=distance_kernel(histest(i),histrain(j)); 
end
% se encuentra la menor distancia
p=find(dist==min(dist));
% Se le asigna la etiqueta de la imagen con la menor distancia
Predicciones{i}=Imagenes(p,1).name(2:3);
disp(i)
end
toc
% se contruye la matriz de confusion
[C order]= confusionmat(Anotaciones,Predicciones)
save('Confusion','C','order');