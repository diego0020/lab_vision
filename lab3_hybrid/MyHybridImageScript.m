h1 = fspecial('gaussian', 20,6);
figure('Name','Low-pass filter (size:20,sigma:6)','NumberTitle','off','MenuBar','none','ToolBar','none')
mesh(h1)
im1 = imread('submarine.bmp');
figure('Name','Original image for low-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(im1)                    % Display it as gray level image
fim1 = imfilter(im1,h1);
figure('Name','Original image low-pass filtered','NumberTitle','off','MenuBar','none','ToolBar','none')
imshow(fim1);
h2 = fspecial('gaussian', 20,6);
figure('Name','High-pass filter (size:20,sigma:6)','NumberTitle','off','MenuBar','none','ToolBar','none')
mesh(h2)
im2 = imread('fish.bmp');
figure('Name','Original image for high-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(im2)                    % Display it as gray level image
fim2 = im2 - imfilter(im2,h2);
figure('Name','Original image high-pass filtered','NumberTitle','off','MenuBar','none','ToolBar','none')
imshow(fim2);
figure('Name','fft2 of original image for low-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(fftshift(fft2(rgb2gray(im1))))))
figure('Name','fft2 of original image for high-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(fftshift(fft2(rgb2gray(im2))))))
figure('Name','fft2 of gaussian low-pass filter','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(fftshift(fft2(h1)))))
figure('Name','fft2 of gaussian filter for high-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(fftshift(fft2(h2)))))
figure('Name','fft2 of low-pass filtered image','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(fftshift(fft2(rgb2gray(fim1))))))
figure('Name','fft2 of high-pass filtered image','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(fftshift(fft2(rgb2gray(fim2))))))
figure('Name','dct2 of original image for low-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(dct2(rgb2gray(im1)))))
figure('Name','dct2 of original image for high-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(dct2(rgb2gray(im2)))))
figure('Name','dct2 of gaussian low-pass filter','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(dct2(h1))))
figure('Name','dct2 of gaussian filter for high-pass filtering','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(dct2(h2))))
figure('Name','dct2 of low-pass filtered image','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(dct2(rgb2gray(fim1)))))
figure('Name','dct2 of high-pass filtered image','NumberTitle','off','MenuBar','none','ToolBar','none')
imagesc(log(abs(dct2(rgb2gray(fim2)))))
HybridImage = fim1 + fim2;
figure('Name','Hybrid image','NumberTitle','off','MenuBar','none','ToolBar','none')
imshow(HybridImage);
