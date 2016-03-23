function [et]=Clust_Wts(image,hmin)

%Codigo tomado de Lecture 7. Computer Vision. Pablo Arbelaez 

%Conversion imagen a escala de grises 
im=rgb2gray(image);

%Creacion de filtro para gradiente, se hace tanto vertical como horizontal 
hy=fspecial('sobel');
hx=hy';
Iy=imfilter(double(im),hy,'replicate');
Ix=imfilter(double(im),hx,'replicate');
grad=sqrt(Ix.^2+Iy.^2);

% Marcador con minimos extendidos 
marker=imextendedmin(grad,hmin);
%Actualización de gradiente con imposicion de minimos 
new_grad=imimposemin(grad,marker);
%Implementacion Watershed sobre el nuevo gradiente (Imagen escala de
%grises modificada
et=watershed(new_grad);



end 