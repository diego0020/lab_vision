clear all; % Clear all variables
close all; % Close all open figures
I1=imread('./fotos/NuevaCapilla.jpg'); % Create I1 as a 2016 chapel photo after modificated with GIMP(R)
I2=imread('./fotos/ViejaCapilla.jpg'); % Create I2 as a 1969 chapel photo after modificated with GIMP(R)
a=40; % Set an a parameter of the filter to apply to I1
b=40; % Set a b parameter of the filter to apply to I2
F1=fspecial('gaussian',floor(2*a+1)*[1 1],a*0.5); % Create a low-pass filter F1 that will be apply to I1
F2=fspecial('gaussian',floor(2*b+1)*[1 1],b*0.5); % Create a low-pass filter F1 that will be apply to I2
G1=imfilter(I1,F1); % Apply the filter F1 to I1 and save as G1
G2=imfilter(I2,F2); % Apply the filter F2 to I2 and save as G2
imshow(G1+(I2-G2)); % Show the hybrid image
imwrite(G1+(I2-G2),'./fotos/HibridaCapilla.jpg') % Save the hybrid image created in a jpg file
