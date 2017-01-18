function res=train_net(net,test_data)
% EXERCISE5   Part 5 of the VGG CNN practical

setup;

imdb=test_data;

for i=1:1:size(imdb.images.data,3)

im=imdb.images.data(:,:,i);
im_ = single(im) ; % note: 255 range
im_ = imresize(im_, [32 32]) ;
im_ = im_ - net.imageMean ;

% run the CNN
res = vl_simplenn(net, im_) ; 

% show the classification result
scores = squeeze(gather(res(end).x)) ;
[bestScore(i), best(i)] = max(scores) ;  %Mi label final es "Best" (creooo) y lo almaceno

% figure(1) ; clf ; imagesc(im) ; axis image ;
% title(sprintf('%s (%d), score %.3f',...
% net.classes.description{best}, best, bestScore)) ;
end

res=best;


save('results.mat','res');
