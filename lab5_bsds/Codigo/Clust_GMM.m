function [ idx] = Clust_GMM( Image, feature_space,K )
% Se transforma a double la imagen
Image=im2double(Image);
% Se separan por canal en el espacio deseado
[Imagen]=space(Image,feature_space);
% Se toman los tama?os de la imagen original
[li,ai,zi]=size(Image);
aim=length(Imagen);
% Se vuelve cada dimension un vector
matvect=reshape(Imagen,li*ai,aim/ai);
%Se crea la figura 
GMM_Model =fitgmdist(matvect,K);
%Se aplica GMM
[idx]=cluster(GMM_Model,matvect);
%Se vuelve a conformar la imagen
idx=reshape(idx,[li,ai]);

end


