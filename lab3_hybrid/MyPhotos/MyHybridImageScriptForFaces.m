function [HybridImage] = MyHybridImageScriptForFaces(lowSize,lowSigma,imgForLowF,highSize,highSigma,imgForHighF,hfScale, adjust)
% function [HybridImage] = MyHybridImageScriptForFaces(lowSize,lowSigma,imgForLowF,highSize,highSigma,imgForHighF)
%
% Composes a hybrid image from two given images an the parameters for low- and high- pass filtering.
%
% Input
%	lowSize		size of filter to be used in low-pass filtering.
%	lowSigma	sigma of filter to be used in low-pass filtering.
%	imgForLowF	pathname of the image to be used in low-pass filtering.
%	highSize	size of filter to be used in high-pass filtering.
%	highSigma	sigma of filter to be used in high-pass filtering.
%	imgForHighF	pathname of the image to be used in low-pass filtering.
%	hfScale     percentage of the smoothed image that should be removed in 
%               an attempt for keeping the color in high frequencies.This 
%               value must be between 0 and 1. The smaller more colors are
%               preserved.
%	adjust      if 1 the high pass filtered image will be stretched, if 0 will not.
%
% Output
%	HybridImage	The hybrid image obtained by summing the low and high filtered images.
%
% Jos� Valero <ja.valero@uniandes.edu.co>
% 2016/Mar/02
h1 = fspecial('gaussian', lowSize,lowSigma);   % Low-pass filter creation for the low filtering process
figure('Name',sprintf('Low-pass filter (size: %d,sigma:%d)',lowSize,lowSigma), ...
       'NumberTitle','off', ...
       'MenuBar','none', ...
       'ToolBar','none', ...
       'WindowStyle','modal')
mesh(h1)
im1 = imread(imgForLowF);
figure('Name','Original image for low-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(im1)
fim1 = imfilter(im1,h1);
figure('Name','Original image low-pass filtered','NumberTitle','off','MenuBar','none','ToolBar','none')
imshow(fim1);
h2 = fspecial('gaussian', highSize,highSigma); % Low-pass filter creation for the high filtering process
figure('Name','High-pass filter (size:20,sigma:6)','NumberTitle','off','MenuBar','none','ToolBar','none')
mesh(h2)
im2 = imread(imgForHighF);
figure('Name','Original image for high-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(im2)
fim2 = im2 - hfScale * imfilter(im2,h2);
figure('Name','Original image high-pass filtered','NumberTitle','off','MenuBar','none','ToolBar','none')
imshow(fim2);

if adjust
    fim2A = imadjust(fim2,stretchlim(fim2));% This line is an attempt for get more 
                                            % of the high-filtered image by
                                            % stretching it that will make easier to preceive the high pass filtered image  
    figure('Name','High-pass filtered image stretched','NumberTitle','off','MenuBar','none','ToolBar','none')
    imshow(fim2A);
else
    fim2A = fim2; %This line will make easier to preceive the low pass filtered image.
end

HybridImage = fim1 + fim2A;
%HybridImage = imadjust(fim1 + fim2A,stretchlim(fim1 + fim2A));
figure('Name','Hybrid image','NumberTitle','off','MenuBar','none','ToolBar','none')
imshow(HybridImage);imwrite(HybridImage,'TransGenerationHybridImage.bmp');
% pyramid visualization
hbVis = vis_hybrid_image(HybridImage);
imshow(hbVis);imwrite(hbVis,'PyramidFacesImage.bmp');
pause
