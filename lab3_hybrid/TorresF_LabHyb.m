clc, clear all, close all
%% Begining, reading the images
%For the Boot
Boot = imread('https://www.dropbox.com/s/snulaqkfod3shmu/Boot.jpg?dl=1');
Boot = rgb2gray(imresize(Boot,[256,256]));
%For the Bottle
Bottle = imread('https://www.dropbox.com/s/jp4trcppem35o6m/Bottle.jpg?dl=1');
Bottle = rgb2gray(imresize(Bottle,[256,256]));

%% Creation of the filters.
Gss = fspecial('gaussian',[45 45],4);
Gss2 = fspecial('gaussian',[30,30],8);

%% Filtering of the images
Low = imfilter(Bottle,Gss2);
Hi = Boot-imfilter(Boot,Gss);

Hyb = Low-Hi;
figure
imshow(Hyb),
title('Hybrid image between the bottle and the boot');

pause

%% Creation of the Piramid

Vec = [256,200,175,150,125,100,75,50,25];
Ims = im2uint8(zeros([256,256,3,length(Vec)]));
for x = 1:length(Vec)
    Im = imresize(Hyb,[Vec(x) Vec(x)]);
    Im = imresize(Im,[256 256]);
    Im = repmat(Im,1,1,3);
    Ims(:,:,:,x) = Im;
end

figure
montage(Ims);
title('Image Pyramid');

%Storing the Pyramid
im = getimage(gca);
imwrite(im,'Pyramid.png');




