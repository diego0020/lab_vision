function my_segmentation = segment_by_clustering(I, feature_space,...
    method, nClusters)
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
    end
    
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

    if fsHandle<4
        fSpace = [ch1(:) ch2(:) ch3(:)];
    else
        [x,y] = meshgrid(0:(size(I,2)-1),0:(size(I,1)-1));
        r=5;
        fSpace = [ch1(:) ch2(:) ch3(:) r*x(:)/(max(x(:))) r*y(:)/(max(y(:)))];
    end
else
    I=rgb2gray(I);
end

if strcmp(method,'gmm')
    options = statset('MaxIter',10000);
    gmfit = fitgmdist(fSpace,nClusters,'Options',options);
    idx = cluster(gmfit,fSpace);
elseif strcmp(method,'watershed')
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(I), hy, 'replicate');
    Ix = imfilter(double(I), hx, 'replicate');
    grad = sqrt(Ix.^2 + Iy.^2);
    h=0;
    while 1
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
else
    if ~strcmp(method,'kmeans')
        warning ('The method is wrong, it will be kmeans by defect');
    end
    idx = kmeans(fSpace,nClusters,'MaxIter',10000);
end
my_segmentation=reshape(idx,[size(I,1) size(I,2)]);

imshow(label2rgb(my_segmentation,'jet','w','shuffle'));

end