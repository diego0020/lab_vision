% --------------------------------------------------------------------
function [im, labels] = getBatchWithJitter(imdb, batch)
% --------------------------------------------------------------------
im = imdb.images.data(:,:,batch) ;
labels = imdb.images.label(1,batch) ;

n = numel(batch) ;
train = find(imdb.images.set == 1) ;

sel = randperm(numel(train), n) ;
im1 = imdb.images.data(:,:,sel) ;

sel = randperm(numel(train), n) ;
im2 = imdb.images.data(:,:,sel) ;

ctx = [im1 im2] ;
ctx(:,17:48,:) = min(ctx(:,17:48,:), im) ;

dx = randi(11) - 6 ;
im = ctx(:,(17:48)+dx,:) ;
sx = (17:48) + dx ;

dy = randi(5) - 2 ;
sy = max(1, min(32, (1:32) + dy)) ;

im = ctx(sy,sx,:) ;

% Visualize the batch:
% figure(100) ; clf ;

im = 256 * reshape(im, 32, 32, 1, []) ;
