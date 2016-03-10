function my_segmentation = segment_by_clustering(I, feature_space,...
    method, nClusters,isDisplayed)
%% Probe that I is a rgb image
if ((size(I,3)~=3)||(numel(size(I))~=3))
    error (['The 1º input argument (I) must be a rgb image \nthe size'...
        ' must be mxnx3%s'],'');
elseif ~isa(I,'uint8')
    error (['The 1º input argument (I) must be a rgb image \nI must'...
        ' be a uint8, not a %s'], class(I))
end
%% Assign a value to nCluster
if nargin<4
    nClusters=3;
end
%% Probe that nClusters is a numeric
if ~isa(nClusters,'numeric')
    error(['The 4º input argument (nClusters) must be a numeric \n'...
        'nClusters must be a numeric, not a %s'], class(nClusters))
end
%% If it is not a watershed clustering, change the data type of I to double
if ~strcmp(method,'watershed')
    fsHandle=1;
    if strcmp (feature_space,'lab')
        I=rgb2lab(I);
        fsHandle=2;
    elseif strcmp (feature_space,'hsv')
        I=rgb2hsv(I);
        fsHandle=3;
    elseif strcmp (feature_space,'rgb+xy')
        I=double(I);
        fsHandle=4;
    elseif strcmp (feature_space,'lab+xy')
        I=rgb2lab(I);
        fsHandle=5;
    elseif strcmp (feature_space,'hsv+xy')
        I=rgb2hsv(I);
    elseif ~strcmp (feature_space,'rgb')
        warning ('The feature space is wrong, it will be rgb by defect');
        I=double(I);
    else
        I=double(I);
    end
%% Normalize and divide the the 3 channels of color
    if (fsHandle==1||fsHandle==4)
        ch1=I(:,:,1)/255;
        ch2=I(:,:,2)/255;
        ch3=I(:,:,3)/255;
    elseif (fsHandle==2||fsHandle==5)
        ch1=I(:,:,1)/100;
        ch2=I(:,:,2);
        ch3=I(:,:,3);
        ch2=(ch2-min(ch2(:)))/(max(ch2(:))-min(ch2(:)));
        ch3=(ch3-min(ch3(:)))/(max(ch3(:))-min(ch3(:)));
    else
        ch1=I(:,:,1);
        ch2=I(:,:,2);
        ch3=I(:,:,3);
    end
%% Create a feature space (fSpace)
    if fsHandle<4
        fSpace = [ch1(:) ch2(:) ch3(:)];
    else
        [x,y] = meshgrid(0:(size(I,2)-1),0:(size(I,1)-1));
        r=1;
        fSpace = [ch1(:) ch2(:) ch3(:) r*x(:)/(max(x(:))) r*y(:)/(max(y(:)))];
    end
%% If it is a watershed clustering convert I to gray-scale image    
else
    I=rgb2gray(I);
end
%% GMM clustering
if strcmp(method,'gmm')
    options = statset('MaxIter',10000);
    gmfit = fitgmdist(fSpace,nClusters,'CovarianceType','full',...
            'SharedCovariance',false,'Options',options);
    idx = cluster(gmfit,fSpace);
%% Watershed clustering
elseif strcmp(method,'watershed')
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(I), hy, 'replicate');
    Ix = imfilter(double(I), hx, 'replicate');
    grad = sqrt(Ix.^2 + Iy.^2); % Gradient of I
    h=0;
    while 1 % Search h to have a correct nCluster
        marker=imextendedmin(I,h);
        L=bwlabeln(marker);
        if max(L(:))<=nClusters
            break
        end
        h=h+1;
    end
    new_grad=imimposemin(grad,marker);
    ws=watershed(new_grad);
    idx=ws(:);
%% KMEANS
else
    if ~strcmp(method,'kmeans')
        warning ('The method is wrong, it will be kmeans by defect');
    end
    idx = kmeans(fSpace,nClusters,'MaxIter',10000);
end
%% Reshape the output
my_segmentation=reshape(idx,[size(I,1) size(I,2)]);
%% Show the clustering
if nargin<5
    isDisplayed=false;
end
if ~isa(isDisplayed,'logical')
    error(['The 5º input argument (isDisplayed) must be a boolean \n'...
    'isDisplayed must be a logical, not a %s'], class(isDisplayed))
end
if isDisplayed
    imshow(label2rgb(my_segmentation,'jet','w','shuffle'));
end
end