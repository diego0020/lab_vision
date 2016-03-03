# Hybrid images

## Source

This lab is based on

- http://cs.brown.edu/courses/cs143/proj1/
- https://courses.engr.illinois.edu/cs498dh3/fa2014/projects/hybrid/ComputationalPhotography_ProjectHybrid.html
- http://cvcl.mit.edu/publications/OlivaTorralb_Hybrid_Siggraph06.pdf
- http://cvcl.mit.edu/hybridimage.htm (Link down)

## Examples

![Dolphin - Car](DolphinCarHybrid.jpg)

![Jaguar - Tiger](JaguarTigerHybrid.jpg)

These images look different when viewed from far (or zoomed out), than when looking at close range.

## Theory

*Hybrid images* are composed from two images. A low pass filter is applied to the first one and a high pass filter is applied to the other. From a close distance the high pass filtered imaged dominates, while from a far away the low pass filtered one does. The effect works best when images are aligned.

## Exercise

### Choose images

The data folder (originally downloaded from [here](http://cs.brown.edu/courses/cs143/proj1/) ) contains several pairs of aligned images. Choose one pair, and read both images into matlab.

### Filtering

Use [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) to apply a low pass filter to one image.
For creating the high-pass filtered image, apply a low pass filter to it, and then subtract it from the original image. Mathematically: *Y = X - f(X)* , where *X* is the input image and *f* is the low pass filter. Note that this image will contain negative values.

Look at the [fft](http://www.mathworks.com/help/matlab/ref/fft2.html) and [dct](http://www.mathworks.com/help/images/ref/dct2.html) transforms of

- The original images
- The filter
- The filtered images

### Summing the images

The hybrid image is composed by adding the two filtered images. The full formula would be

*H = f1(X1) + (X2 - f2(X2) )*

Where *f1* and *f2* are low pass filters, and *X1* and *X2* are the input images. Notice that the effect depends on the cut-off frequencies of both filters (see figure 5 of the [Hybrid Images paper](http://cvcl.mit.edu/publications/OlivaTorralb_Hybrid_Siggraph06.pdf)). Additionally, you may scale the amplitude of one of the images to reduce or increase its impact. Play with this parameters to get a good Hybrid Image.

- Upload the full matlab script used to generate the image to the repository
- Upload the final image to the repository

### Visualization

In order to simulate how the image will look from different distances we can use a pyramid (see figure at the bottom of http://cs.brown.edu/courses/cs143/proj1/ ).

- Create such a visualization for your image
- Upload it to the repository

## Homework

Create a hybrid image based on images from your own collections. The more original the better. Some ideas are

- You or people you know
- Pets
- Pictures of the university or the city
- Pictures of places you have visited (preferably in Colombia)
- Be creative
- Avoid images downloaded from internet

Notice that you will have to *align and crop* the images to get a good effect. To do this you may use image edition software like gimp or photoshop. You are free to do any additional processing that you want in order to increase the effect. Also consider how to deal with color on the images.



Finally, upload to the repository

These are my results:

- The original images
  ![originales](originals.jpg)
My girlfriend and me.
- The processed images (cropped, aligned, color adjusted)
  ![Processed images](modified.jpg)
-  For my girlfriend image I enhaced the contrast of the image, multiplying it by a constant >1 to give it more importance because it was going to be the image with the high frequencies and I realized that in this two photos the low frequency dominated. On the other hand, for my image I multiplied it by a constant <1 to reduce the contast and increase the effect of the hybrid image.

- The final hybrid image
 ![Processed images](result.jpg)
this is the result after take both , high and low frequencies and mixed up the images.

- The pyramid
 ![Processed images](pyramid.jpg)
Pyramid to see the effect of low and high frequencies.
- The code you used (with comments)

CODE:

% this is the code for make hybrid images by Alejandro Pardo
clc;clear all; close all;
%Add path of the functions
addpath(genpath('proj1'));

%Read the images
original_down=im2double(imread('IMG_1671.jpg'));
original_up=im2double(imread('IMG_1669.jpg'));

%Process the images before the transformation
down=0.4*original_down;
up=1.2*original_up;

%Cutoff frequencies, parameters of the filter
cutoff=7;
cutoff1=7;

%Filter masks, tipe gaussian, with variance as a function of the cutoff
%frequencies, resulting by the analysis of the convolution. the scale
%factor that multiplies the cutoff frequency is the one that set the
%overlaping of the frequencies of the images, this factor basically
%determines how the images are combined each other. The window size was 9x9
h=fspecial('gaussian',cutoff*3+1,9);
h1=fspecial('gaussian',cutoff1*3+1,9);

%Get the low frequencies of the image 1
god=imfilter(down,h);

%Get the high frequencies of the image 2
tac=imfilter(up,h1);
tac=(up-tac);

%Combine the images to generate the hybrid result
result=god+tac;

%Results visualization
figure;
subplot(1,2,1);imshow(original_down);title('Original Image low frequencies');
subplot(1,2,2);imshow(original_up);title('Original Image high frequencies');
figure;
subplot(1,2,1);imshow(down);title('Adjusted Image low frequencies');
subplot(1,2,2);imshow(up);title('Adjusted Image high frequencies');
figure
imshow(vis_hybrid_image(result));title('Pyramid')
figure 
imshow(result);title('Result');


**DUE**: 3 /3 /2016 ; 10:00 a.m.
