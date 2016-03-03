%function ImagenesHibridas
function ImagenesHibridas(Image1,Image2)
%Image1 and Image2 are the complete name of the images that are going to be
%mixed.
close all
 
%Image1 = 'einstein.bmp';
%Image2 = 'marilyn.bmp';
 
A = imread(Image1);
B = imread(Image2);
% The command imread generates a numeric matrix with the value of each
% channel (R,G,B) of the image.
kernel1 = fspecial('gaussian',[100 100],500);
kernel2 = fspecial('gaussian',[500 500],10000);
% The command fspecial generates a matrix filter with parameters such as,
% the type of the filter, the size of the filter and in this case the
% variance of the gaussian filter. This two filter are high pass filters.
% The parameters specify inside, determines the cut off frecuency.
 
Af = imfilter(A./2,kernel1);
Bf = (B - imfilter(B,kernel2));
%The command imfilter applies the generate filter with fspecial to the
%image. Like the gaussian filter is a high pass filter, in order to obtein
%a low pass filter it must substract the low frecuency to the original
%image in order to obtein only the high frecuency.
 
HI = Af + Bf;
% In order to obtein the mixed image, it was requeried to sum the two
% filtered images.
HIC = vis_hybrid_image(HI,[255 255 255]);
% With the function vis_hybrid_image, it could be visualized the piramid. I
% modify this function in order to have another optional parameter, the
% background color of the piramid.
 
figure
imshow(HI,[])
title([Image1 ' and ' Image2])
figure
imshow(HIC)
title(['Piramid visualization of ' Image1 ' and ' Image2])
% These finals command allow us to visualized the results.
end
 
function output = vis_hybrid_image(hybrid_image,BackGround_Color)
%visualize a hybrid image by progressively downsampling the image and
%concatenating all of the images together.
 
% BackGround_color specify the background color of the piramid
% representation. This variable must be a vector of three components, each
% one for each of the RGB channels.
if(nargin == 1)
    BackGround_Color = [1 1 1];
end
 
if(size(BackGround_Color,1)~=1 && size(BackGround_Color,2)~=3)
    BackGround_Color = [1 1 1];
elseif(max(BackGround_Color)>255 && min(BackGround_Color)<0)
    BackGround_Color = [1 1 1];
end
 
scales = 5; %how many downsampled versions to create
scale_factor = 0.5; %how much to downsample each time
padding = 5; %how many pixels to pad.
original_height = size(hybrid_image,1);
num_colors = size(hybrid_image,3); %counting how many color channels the input has
output = hybrid_image;
cur_image = hybrid_image;
 
 
for i = 2:scales
    %add padding
    output = cat(2, output, ones(original_height, padding, num_colors));
    %dowsample image;
    cur_image = imresize(cur_image, scale_factor, 'bilinear');
    %pad the top and append to the output
    tmp = cat(1,ones(original_height - size(cur_image,1), size(cur_image,2), num_colors), cur_image);
    output = cat(2, output, tmp);
end
 
BackGround_Color = uint8(BackGround_Color);
 
A = output(:,:,1);
A(A == 1) = BackGround_Color(1);
B = output(:,:,2);
B(B == 1) = BackGround_Color(2);
C = output(:,:,3);
C(C == 1) = BackGround_Color(3);
 
 
output(:,:,1) = A;
output(:,:,2) = B;
output(:,:,3) = C;
%code by James Hays extracted from http://cs.brown.edu/courses/cs143/proj1/
end