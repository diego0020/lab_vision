function my_segmentation = segment_by_clustering(rgb_image,feature_space,clustering_method,clusters)

im = imread(rgb_image);
addpath(genpath('/home/milongo/Documents/Vision'));
tmp = zeros(size(im,1),size(im,2),5);
tmps = zeros(size(im,1),size(im,2),2);

for i=1:size(im,1)
    for j=1:size(im,2)
        tmps(i,j,1) = i;
        tmps(i,j,2) = j;
    end
end

nrows = size(im,1);
ncols = size(im,2);
if strcmp(feature_space,'rgb')
   ft_space = reshape(im,nrows*ncols,3);
elseif strcmp(feature_space,'hsv')
    hsv_im = rgb2hsv(im);
    ft_space = reshape(hsv_im,nrows*ncols,3);
elseif strcmp(feature_space,'lab')
    lab_im = rgb2lab(im);
    ft_space = reshape(lab_im,nrows*ncols,3);
elseif strcmp(feature_space,'rgb+xy')
    tmp(:,:,1:3) = im(:,:,1:3);
    tmp(:,:,4:5) = tmps(:,:,1:2);
    ft_space = reshape(tmp,nrows*ncols,5);
elseif strcmp(feature_space,'hsv+xy')
    tmp_hsv = rgb2hsv(im);
    tmp(:,:,1:3) = tmp_hsv(:,:,1:3);
    tmp(:,:,4:5) = tmps(:,:,1:2);
    ft_space = reshape(tmp,nrows*ncols,5);
elseif strcmp(feature_space,'lab+xy')
    tmp_lab = rgb2lab(im);
    tmp(:,:,1:3) = tmp_lab(:,:,1:3);
    tmp(:,:,4:5) = tmps(:,:,1:2);
    ft_space = reshape(tmp,nrows*ncols,5);
end

ft_space = double(ft_space);

if strcmp(clustering_method,'kmeans')
    [cluster_idx, cluster_center] = kmeans(ft_space,clusters);
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    imshow(label2rgb(pixel_labels),[]), title('image labeled by cluster index');
elseif strcmp(clustering_method,'gaussian')
    gm = fitgmdist(ft_space,clusters);
    idx = cluster(gm,ft_space);
    idx_labels = reshape(idx,nrows,ncols);
    imshow(label2rgb(idx_labels),[]);
elseif strcmp(clustering_method,'hierarchical');
    im = imresize(im,0.1);
    T = clusterdata(ft_space,'maxclust',clusters,'linkage','ward','savememory','on');
    h_labels = reshape(T,nrows,ncols);
    imshow(label2rgb(h_labels),[]); 
end
end
