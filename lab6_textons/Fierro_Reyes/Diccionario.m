
addpath('lib')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;

%Direccion='D:\Docs\Documents\UNIVERSIDAD\ULTIMO\Vision en Computador\Lab Textones\train';
%Direccion=train;

Imagenes=dir(fullfile(Direccion,'*.jpg'));
im=[];

%Concatenacion Imagenes
for i=1:30:length(Imagenes);
    for j=0:2
        
        im1=double(imread(fullfile(Direccion,Imagenes(i+j).name)))/255;
        im = [im im1];
        disp(i+j);
    end
    
end

%Numero de textones 
k = 50;
 
% % Creacion de diccionario de textones 
[map,textons] = computeTextons(fbRun(fb,im),k);
save('Diccionario2.mat','map','textons');   



