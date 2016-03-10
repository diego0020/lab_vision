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
%      won't matter.
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
    %Adjust to the colorchannels of the image
    Aux  = im2uint8(rgb2gray(Im(:,:,1:3)));
    figure(1),
    imshow(Aux,[]);
    %Imposition of the markers
    R = imfreehand(gca,'Closed',0);G = imfreehand(gca,'Closed',0);    
    %Retrieveing the positions
    P1 = round(R.getPosition);
    P2 = round(G.getPosition);
    %Creating masks for dilation
    s1 = [1,1];s2 = s1';
    bw = im2bw(zeros(size(Aux)));
    %Assigning the coordinates to a BW-image
    for x = 1:length(P1)
        bw(P1(x,2),P1(x,1)) = 1;
    end
    for x = 1:length(P2)
        bw(P2(x,2),P2(x,1)) = 1;        
    end
    %Dilation of the mask
    bw = imdilate(bw,s1);bw = imdilate(bw,s2);
    %Obtaining the gradient of the Image to be submitted to watersheds
    str = strel('disk',1);
    dil = imdilate(Aux,str);
    ero = imerode(Aux,str);        
    grad = dil-ero;
    %Minimum imposition
    grad_rec = imimposemin(grad,bw);
    %Application of watersheds transform
    ws_mk = watershed(grad_rec);    
    ws_mk = label2rgb(ws_mk);
    Out = ws_mk;
    close all
else
    %Error message to be displayed if the clustering methods does not exist
    %in the parameters.
    msg2 = strcat('Clustering method must be either K-Means,GMM or'...
        ,{' '},'Watersed');
    error(char(msg2))
end
end