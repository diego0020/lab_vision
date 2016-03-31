addpath('lib')
clear all;close all;clc;
tic
load 'Diccionario.mat'
% create filter bank
[fb] = fbCreate;
% Se crea la direccion en la que estan las imagenes
Direccion = 'textures/train';
Imagenes=dir(fullfile(Direccion,'*.jpg'));
k = 50;
histrain=[];
Nombre=cell(0);
% Se recorre el tama?o de las imagenes para asignarles los textones
for i=1:numel(Imagenes)
    % se abre cada imagen
im2=double(imread(fullfile(Direccion,Imagenes(i).name)))/255;
% se asignan los textones
tmap = assignTextons(fbRun(fb,im2),textons');
% Se obtienen los histogramas
histrain(i,:)=histc(tmap(:),1:k)/numel(tmap);
% se crean las etiquetas
Nombre{i}=Imagenes(i).name(2:3);
disp(i)
end
toc
% se guarda el entrenamiento
save('HistogramaTrain','histrain');