%% Laboratory #3 - Hybrid Images
% By Gustavo Pérez Sarabia
% 22/02/2016
% IBIO4680L

clear all; clc;
cd ('C:\Users\Gustavo\Tavo\UNIANDES\PRIMER SEMESTRE\VISION POR COMPUTADOR\LABORATORIO');
im1 = imread('eye6.jpg'); % Load first Image
im2 = imread('valencia2.jpg'); % Load Second Image
[x,y,z] = size(im1); im2 = imcrop(im2,[0 0 y x]); % Resize Image 2 to have Image1's size
[x2,y2,z2] = size(im2); im1 = imcrop(im1,[0 0 y2 x2]); % Resize Image 1 to have Image2's size, in the case image 2 is smaller

n = 6; % Number of iterations of the pyramid
h = fspecial('gaussian',30,20); % Gaussian filter

im1array1(1).image = im1;
im2array1(1).image = im2;
for i = 1:n
    im1array1(i+1).image = imfilter(im1array1(i).image, h, 'replicate'); % Gaussian filtering of image 1
    im2array1(i+1).image = imfilter(im2array1(i).image, h, 'replicate'); % Gaussian filtering of image 2
    im2array2(i).image = im2array1(i).image - im2array1(i+1).image; % Substraction for high frequencies
end

im1final = im1array1(n).image; % Final image 1
im2final = im2array2(1).image*2.0; % Final image 2
hybrid = im1final + im2final; 

figure, imshow(hybrid) % Hybrid image visualization

% Pyramid vizualization
scales = n;
output = vis_hybrid_image(hybrid, scales); % code by James Hays with a small modification.
figure, imshow(output)
