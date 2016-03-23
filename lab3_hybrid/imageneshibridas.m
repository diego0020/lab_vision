clc
clear all
close all
%% Modificacion Tamaños y centros imagenes
%Imagen1
%Lectura
ZukoO = imread('Zuko.jpg');
%Recorte
Zuko = imcrop(ZukoO,[100 0 530 515]);
imwrite(Zuko,'Imagen1Modificada.jpg')

[a,b,c]=size(Zuko);
%Imagen2
%Lectura
SebastianO= imread('Sebastian.jpg');
% Recorte
Sebastian = imcrop(SebastianO,[200 0 960 720]);
%Escalamiento
Sebastian = imresize(Sebastian,[a b]);
imwrite(Zuko,'Imagen2Modificada.jpg')
%% Piramides escaladas
% Imagen1
% Niveles
I0Z= Zuko;

I1Z = impyramid(I0Z, 'reduce');
I2Z = impyramid(I1Z, 'reduce');

I3Z = impyramid(I2Z, 'reduce');
I4Z = impyramid(I3Z, 'reduce');
I5Z = impyramid(I4Z, 'reduce');
UltimoNivelZ=impyramid(I5Z, 'reduce');
% Graficas
figure
subplot(2,3,1)
imagesc(I0Z)
title 'Imagen Original';
subplot(2,3,2)
imagesc(I1Z)
title 'Primer nivel piramide escalado';
subplot(2,3,3)
imagesc(I2Z)
title 'Segundo nivel piramide escalado';
subplot(2,3,4)
imagesc(I3Z)
title 'tercer nivel piramide escalado';
subplot(2,3,5)
imagesc(I4Z)
title 'Cuarto nivel piramide escalado';
subplot(2,3,6)
imagesc(UltimoNivelZ)
title 'Ultimo nivel piramide escalado';

% Imagen 2
% Niveles
I0S=Sebastian;
I1S = impyramid(I0S, 'reduce');
I2S = impyramid(I1S, 'reduce');
I3S = impyramid(I2S, 'reduce');
I4S = impyramid(I3S, 'reduce');
I5S =impyramid(I4S, 'reduce');
UltimoNivelS=impyramid(I5S, 'reduce');
% Graficas
figure
subplot(2,3,1)
imagesc(I0S)
title 'Imagen Original';
subplot(2,3,2)
imagesc(I1S)
title 'Primer nivel piramide escalado';
subplot(2,3,3)
imagesc(I2S)
title 'Segundo nivel piramide escalado';
subplot(2,3,4)
imagesc(I3S)
title 'tercer nivel piramide escalado';
subplot(2,3,5)
imagesc(I4S)
title 'Cuarto nivel piramide escalado';
subplot(2,3,6)
imagesc(UltimoNivelS)
title 'Ultimo nivel piramide escalado';

%% Frecuenciasbajas
% Imagen2
FrecuenciasBajasS= imresize(UltimoNivelS,[a,b]);
% Imagen1
FrecuenciasBajasZ= imresize(UltimoNivelZ,[a,b]);

%% FrecuenciasAltas
% Imagen2
FrecuenciAsaltasS=I0S-FrecuenciasBajasS;
% Imagen1
FrecuenciAsaltasZ=I0Z-FrecuenciasBajasZ;

%% Imagen hibrida
% Fondo Imagen 1
ImagenHibrida1=FrecuenciAsaltasS+FrecuenciasBajasZ;
imwrite(ImagenHibrida1,'ImagenHibrida1.jpg')

% Fondo Imagen 2
ImagenHibrida2=FrecuenciAsaltasZ+FrecuenciasBajasS;
imwrite(ImagenHibrida2,'ImagenHibrida2.jpg')
%Grafica
figure
subplot(1,2,1)
imagesc (ImagenHibrida1)
title 'Imagen hibrida 1- Frecuencias bajas imagen 1'
subplot(1,2,2)
imagesc(ImagenHibrida2)
title 'Imagen hibrida 2- Frecuencias altas imagen 1'
%% Piramide escalada Imagen hibrida

%Imagen 1
% Niveles
I0H1=ImagenHibrida1;
I1H1 = impyramid(I0H1, 'reduce');
I2H1 = impyramid(I1H1, 'reduce');
I3H1 = impyramid(I2H1, 'reduce');
I4H1 = impyramid(I3H1, 'reduce');
I5H1 =impyramid(I4H1, 'reduce');
UltimoNivelH1=impyramid(I5H1, 'reduce');

% Graficas 
figure
subplot(2,3,1)
imagesc(I0H1)
title 'Imagen Original';
subplot(2,3,2)
imagesc(I1H1)
title 'Primer nivel piramide escalado';
subplot(2,3,3)
imagesc(I2H1)
title 'Segundo nivel piramide escalado';
subplot(2,3,4)
imagesc(I3H1)
title 'tercer nivel piramide escalado';
subplot(2,3,5)
imagesc(I4H1)
title 'Cuarto nivel piramide escalado';
subplot(2,3,6)
imagesc(UltimoNivelH1)
title 'Ultimo nivel piramide escalado';

%Imagen 2
%Niveles
I0H2=ImagenHibrida2;
I1H2 = impyramid(I0H2, 'reduce');
I2H2 = impyramid(I1H2, 'reduce');
I3H2 = impyramid(I2H2, 'reduce');
I4H2 = impyramid(I3H2, 'reduce');
I5H2 =impyramid(I4H2, 'reduce');
UltimoNivelH2=impyramid(I5H2, 'reduce');

% Graficas 
figure
subplot(2,3,1)
imagesc(I0H2)
title 'Imagen Original';
subplot(2,3,2)
imagesc(I1H2)
title 'Primer nivel piramide escalado';
subplot(2,3,3)
imagesc(I2H2)
title 'Segundo nivel piramide escalado';
subplot(2,3,4)
imagesc(I3H2)
title 'tercer nivel piramide escalado';
subplot(2,3,5)
imagesc(I4H2)
title 'Cuarto nivel piramide escalado';
subplot(2,3,6)
imagesc(UltimoNivelH2)
title 'Ultimo nivel piramide escalado';

%% Piramides sin escalamiento
%Imagen1
visZ=vis_hybrid_image(I0Z);
figure 
imshow(visZ);
title 'Piramide de gauss Imagen 1';
imwrite(visZ,'PiramideImagen1.jpg')
%Imagen2
visS=vis_hybrid_image(I0S);
figure 
imshow(visS);
title 'Piramide de gauss Imagen 2';
imwrite(visS,'PiramideImagen2.jpg')
%Imagenhibrida1
visH1=vis_hybrid_image(I0H1);
figure 
imshow(visH1);
title 'Piramide de gauss Imagen Hibrida 1';
imwrite(visH1,'PiramideHibrida1.jpg')
%Imagenhibrida2
visH2=vis_hybrid_image(I0H2);
figure 
imshow(visH2);
title 'Piramide de gauss Imagen Hibrida 2';
imwrite(visH2,'PiramideHibrida2.jpg')

