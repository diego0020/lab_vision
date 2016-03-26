
addpath('lib')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;


% imagen de referencia para construir diccionario de textones
im1=double(rgb2gray(imread('9_1_s.bmp')))/255;
im2=double(rgb2gray(imread('6_1_s.bmp')))/255;
im = [im1 im2];
% numero de textones en diccionario
k = 50;

% diccionario de textones
[map,textons] = computeTextons(fbRun(fb,im),k);
%figure;imshow(map,[]);colormap(jet);

D=dir('*.bmp');
% texton maps de dos nuevas imagenes
for i=1:numel(D),
    im2=double(rgb2gray(imread(D(i).name)))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');
    
    % la distribucion de textones en la oveja deberia ser similar a la de la
    % imagen de referencia.
    figure;subplot(1,2,1);imshow(tmap,[]);colormap(jet);
    subplot(1,2,2);bar(histc(tmap(:),1:k)/numel(tmap));
    drawnow;
end

