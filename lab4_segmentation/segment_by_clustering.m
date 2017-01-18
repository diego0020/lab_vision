function labels = segment_by_clustering(im,space,method,k)

%This function generates an RGB image segmentation in k clusters
%Space: color space used for segmentation. Posible entries: 'rgb' 'lab' 'hsv' 'rgb+xy' 'lab+xy' 'hsv+xy'
%Method: method used for segmentation. Possible entries: 'kmeans' 'gmm'
%'watershed' 'hierarchical'


%color spaces
scale_factor=2;
if strcmp(method,'hierarchical')
im=imresize(im,1/scale_factor);
end

im=im2double(im);
[n,m,z]=size(im);

%rgb
imrgb=im./(max(im(:)));
%lab
cform = makecform('srgb2lab');
imlab = applycform(im,cform);
imlab=imlab-(min(imlab(:))).*ones(size(imlab));
imlab=imlab./(max(imlab(:)));
%hsv
imhsv=rgb2hsv(im);
imhsv=imhsv./((max(imlab(:))));
%xy feature
[y,x]=meshgrid(1:m,1:n);
xm=reshape(x,n*m,1);xm=0.4*xm./max(xm(:));
ym=reshape(y,n*m,1);ym=0.4*ym./max(ym(:));

%Chose de color space
if strcmp(space,'rgb')
    imn=reshape(imrgb,n*m,3);
    my=[imn];
elseif strcmp(space,'rgb+xy')
    imn=reshape(imrgb,n*m,3);
    my=[imn xm ym];
elseif strcmp(space,'lab')
    imn=reshape(imlab,n*m,3);
    my=[imn];
elseif strcmp(space,'lab+xy')
    imn=reshape(imlab,n*m,3);
    my=[imn xm ym];
elseif strcmp(space,'hsv')
    imn=reshape(imhsv,n*m,3);
    my=[imn];
elseif strcmp(space,'hsv+xy')
    imn=reshape(imhsv,n*m,3);
    my=[imn xm ym];
else 
    error('Invalid space input')
end

%Chose the method
if strcmp(method,'kmeans')
    
    [idx]=kmeans(my,k);
    labels=reshape(idx,n,m);
    
elseif strcmp(method,'gmm')
    
    obj = fitgmdist(my,k);
    idx = cluster(obj,my);
    labels=reshape(idx,n,m);
    
elseif strcmp(method,'watershed')
    
    im_gray = rgb2gray(im(:,:,1:3));

  %gradient’s magnitude
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(im2double(im_gray), hy, 'replicate');
    Ix = imfilter(im2double(im_gray), hx, 'replicate');
    grad = sqrt(Ix.^2 + Iy.^2);

    %Markers for extended minima
    marker = imextendedmin(grad, k);
    %Impose minima
    new_grad = imimposemin(grad, marker);
    %Watershe calculation
    labels = watershed(new_grad);
    
elseif strcmp(method,'hierarchical')
    
    idx=clusterdata(my,'distance','euclidean','linkage','ward',...
        'savememory','on','maxclust',k);
    
    labels=reshape(idx,n,m);
    labels=imresize(labels,scale_factor);
else
    error('Invalid method input')
end

imshow(labels,[]);title('Segmented Image')
end