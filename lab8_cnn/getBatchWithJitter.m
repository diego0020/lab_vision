function [im, labels] = getBatchWithJitter(imdb, batch)

im = imdb.images.data(:,:,batch) ;
labels = imdb.images.label(1,batch) ;

cim = padarray(im,[128 128],'replicate') ;
dx = randi(257) ;
dy = randi(257) ;
im = cim(dx:dx+127,dy:dy+127,:) ;

nRot = randi(4) - 2 ;
im = imrotate(im, nRot*90) ;

% Visualize the batch:
% figure(100) ; clf ;
% vl_imarraysc(im) ;

im = 256 * reshape(im, 128, 128, 1, []) ;
