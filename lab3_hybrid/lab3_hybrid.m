clear all;
close all;
I1=imread('./fotos/NuevaCapilla.jpg');
I2=imread('./fotos/ViejaCapilla.jpg');
a=40;
b=40;
F1=fspecial('gaussian',floor(2*a+1)*[1 1],a*0.5);
F2=fspecial('gaussian',floor(2*b+1)*[1 1],b*0.5);
G1=imfilter(I1,F1);
G2=imfilter(I2,F2);
check=true;
% subplot (1,2,1); imshow(I1);
% subplot (1,2,2); imshow(G1);
if check
    imshow(G1+(I2-G2));
    imwrite(G1+(I2-G2),'./fotos/HibridaCapilla.jpg')
else
    imshow(G2+(I1-G1));
    imwrite(G2+(I1-G1),'./fotos/HibridaCapilla.jpg')
end