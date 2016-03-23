function [ et ] = Clust_Kmeans( Image, feature_space, K )
% Se transforma a double la imagen
Image=double(Image);
% Se separan por canal en el espacio deseado
[Imagen]=space(Image,feature_space);
% Se toman los tamaños de la imagen original y la imagen formada por los canales 
[li,ai,zi]=size(Image);
 aim=length(Imagen);
% Se vuelve cada dimension un vector
matvect=reshape(Imagen,li*ai,aim/ai);
%Se aplica Kmeans
[et] =kmeans(matvect,K);
%Se vuelve a conformar la imagen
et=reshape(et,li,ai);
      
        
   
      
        
end


