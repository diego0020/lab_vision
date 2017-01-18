function my_segmentation = segment_by_clustering(I,FS,CM,NC)

% Inputs:
% I : Imagen de entrada en espacio de color RGB
% FS : Feature space
% CM : Clustering method
% NC : Number of clusters

% Outputs:
% my_segmentation

temp = 0;

if(strcmp(FS,'lab'))
    I = rgb2lab(I);
elseif(strcmp(FS,'hsv'))
    I = rgb2hsv(I);
elseif(strcmp(FS,'rgb+xy'))
    temp = 1;
elseif(strcmp(FS,'lab+xy'))
    I = rgb2lab(I);
    temp = 1;
elseif(strcmp(FS,'hsv+xy'))
    I = rgb2hsv(I);
    temp = 1;
end

if(temp == 0)
    DI = [reshape(I(:,:,1),[1 numel(I)]),reshape(I(:,:,2),[1 numel(I)]),reshape(I(:,:,3),[1 numel(I)])];
else
    x = repmat((1:size(I,1))',[size(I,2),1]);
    for i=1:numel(I)
        y(i,1) = temp;
        if(mod(temp,size(I,1))==0)
            temp = temp+1;
        end
    end
    
    DI = [reshape(I(:,:,1),[1 numel(I)]),reshape(I(:,:,2),[1 numel(I)]),reshape(I(:,:,3),[1 numel(I)]),x,y];
end
            
if(strcmp(CM,'kmeans'))
    
end

end
