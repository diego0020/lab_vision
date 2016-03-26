clc, clear all, close all

addpath('processed','origs');

% Read images
im1 = imread('im1p.jpg');
im2 = imread('im2p.jpg');

% Resize for memory and same-size purposes.
im1 = imresize(im1,0.5);
im2 = imresize(im2,[size(im1,1),size(im1,2)]);

% Create low pass filters
H = fspecial('gaussian',71,30);
HH = fspecial('gaussian',101,100);

% Apply filters
im1f = imfilter(im1,H);
im2f = imfilter(im2,HH);

% High pass filtered image
im2ff = im2 - im2f;

% Final hybrid image
imf = im1f + im2ff;

% visualize
figure; imshow(imf);
out=vis_hybrid_image(imf);
figure;
imshow(out);