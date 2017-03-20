function Out = segment_by_clustering(rgb_image,feature_space,...
               clustering_method,number_of_clusters)
%      FUNCTION SEGMENT_BY_ClUSTERING
%      OUT = SEGMENT_BY_CLUSTERING(RGB_IMAGE,FEATURE_SPACE,...
%      CLUSTERING_METHOD,NUMBER_OF_CLUSTERS)
%      RGB_IMAGE. Rgb_image is the input image, it represents what you 
%      would want to segment.
%      FEATURE_SPACE.Feature_Space sets the space of representation for the
%      segmentation, it can either be RGB,L*AB,HSV; as well RGB+XY,L*AB+XY
%      and HSV+XY. XY means that the input will be considering X and Y 
%      distances in the image, meaning localization.
%      ClUSTERING_METHOD. Clustering method adjusts the way the clusters
%      will be selected. It can either be 'K-Means','GMM','Watershed'. If
%      watershed is selected, the number of clusters selecetd as an input
%      will need to be a value from the range [0,255].
%      NUMBER_OF_CLUSTERS. Number of Clusters adjusts the 'K' for each
%      clustering method that requires it, if no argument for 
%      Number_of_clusters is input, the default will be 3.
%      You may want to set the dynamic range of the image in imshow as [].
%      Then I highly suggest you to use colormap(colorcube) to see the
%      output.
%                                 Felipe Torres F. Universidad de los Andes

%%  Initialization
%Check for input variables
if(nargin<4)
   number_of_clusters = 3;
end         
if(nargin<3)
    clustering_method = 'k-means';
end
if(nargin<2)
    feature_space = 'rgb';
end

%Assigning the image to the right data type (optimal for k-means and GMM)
rgb_image = im2double(rgb_image);
[sr,sc,N] = size(rgb_image);
%% Check for input names of variables.
%Feature_Space
if(strcmpi(feature_space,'rgb')==1)
    Im = rgb_image;
elseif(strcmpi(feature_space,'lab')==1)
    Im = rgb2lab(rgb_image);
elseif(strcmpi(feature_space,'hsv')==1)
    Im = rgb2hsv(rgb_image);
elseif(strcmpi(feature_space,'rgb+xy')==1)
    Im = zeros([sr,sc,N+2]);
    %Assignation of the distance coordinates.
    Im(:,:,1:3) = rgb_image;
    [F,C] = meshgrid(1:sr,1:sc);
    Im(:,:,4) = C'/sc;Im(:,:,5) = F'/sr;
elseif(strcmpi(feature_space,'lab+xy')==1)
    Im = zeros([sr,sc,N+2]);
    Im(:,:,1:3) = rgb2lab(rgb_image);
    %Assignation of the distance coordinates.
    [F,C] = meshgrid(1:sr,1:sc);
    Im(:,:,4) = C'/sc;Im(:,:,5) = F'/sr;
elseif(strcmpi(feature_space,'hsv+xy')==1)
    Im = zeros([sr,sc,N+2]);
    Im(:,:,1:3) = rgb2hsv(rgb_image);
    %Assignation of the distance coordinates.
    [F,C] = meshgrid(1:sr,1:sc);
    Im(:,:,4) = C'/sc;Im(:,:,5) = F'/sr;
else        
    msg = strcat('The feature space must be either: rgb, lab, hsv,',...
        {' '},'rgb+xy, lab+xy or hsv+xy');
    error(char(msg));
end

%Clustering method
if(strcmpi(clustering_method,'K-MEANS')==1)    
    %Check for image size.
    [~,~,z] = size(Im);
    %Creation of the N-Dimensional array.
    Vk = zeros(numel(Im(:,:,1)),z);    
    for x = 1:z
        chn = Im(:,:,x);
        Vk(:,x) = chn(:);
    end 
    %Application of K-means.
    [lbl,cent] = kmeans(Vk,number_of_clusters); 
    [~,I] = size(cent);    
    %Assigning centroids to values.
    Vec = cent(lbl,round(I/2));
    %Reshaping to get the clustered Image.
    Out = reshape(Vec,[sr,sc]);
        
elseif(strcmpi(clustering_method,'GMM')==1)
    [~,~,z] = size(Im);
    %Creation of the N-Dimensional Vector.
    Vk = zeros(numel(Im(:,:,1)),z);    
    for x = 1:z
        chn = Im(:,:,x);
        Vk(:,x) = chn(:);
    end     
    %Creation of the GMM model.
    GM = fitgmdist(Vk,number_of_clusters);
    %Finding the values for each cluster.
    idx = cluster(GM,Vk);
    %Reshaping to get the clustered Image.
    Out = reshape(idx,[sr,sc]);
    
elseif(strcmpi(clustering_method,'WATERSHED')==1)
    h = number_of_clusters;
    Im2 = Im(:,:,1:3);
    Im2 = im2uint8(rgb2gray(Im2));
    str = strel('disk',1);
    dil = imdilate(Im2,str);
    ero = imerode(Im2,str);  
    grad = dil-ero;
    marker = imextendedmin(grad, h);
    new_grad = imimposemin(grad, marker);
    ws = watershed(new_grad);
    Out = (ws);
else
    %Error message to be displayed if the clustering methods does not exist
    %in the parameters.
    msg2 = strcat('Clustering method must be either K-Means,GMM or'...
        ,{' '},'Watersed');
    error(char(msg2))
end
end
