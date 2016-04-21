function train(varargin)
setup ;


% -------------------------------------------------------------------------
% Initialize a CNN architecture
% -------------------------------------------------------------------------

net = initializeCharacterCNN() ;

% -------------------------------------------------------------------------
% Train and evaluate the CNN
% -------------------------------------------------------------------------

trainOpts.batchSize = 150 ;
trainOpts.numEpochs = 5 ;
trainOpts.continue = true ;
trainOpts.learningRate = 0.001 ;
trainOpts.expDir = 'data/textures-jit-experimen-t-1' ;
trainOpts = vl_argparse(trainOpts, varargin);

%Training set
imdb=load('textonsdb2.mat');
t_idx=find(imdb.images.set == 1); %indices de las imagenes pertenecientes al set de train
imdb.images.data=imdb.images.data(:,:,t_idx);
imdb.images.set=imdb.images.set(t_idx);
imdb.images.label=imdb.images.label(t_idx);

% Take the average image out
imageMean = mean(imdb.images.data(:)) ;
imdb.images.data = single(imresize(imdb.images.data - imageMean,[32 32])) ;


% Initlialize a new network
net = initializeCharacterCNN() ;

% Call training function in MatConvNet
[net,info] = cnn_train(net, imdb, @getBatchWithJitter, trainOpts) ;

% Move the CNN back to CPU if it was trained on GPU


% Save the result for later use
net.layers(end) = [] ;
net.imageMean = imageMean ;
save('data/textures-experiment/texturescnn-jit-1.mat', '-struct', 'net') ;

% --------------------------------------------------------------------
function [im, labels] = getBatch(imdb, batch)
% --------------------------------------------------------------------
im = imdb.images.data(:,:,batch) ;
im = 256 * reshape(im, 32, 32, 1, []) ;
labels = imdb.images.label(1,batch) ;

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
% vl_imarraysc(im) ;

im = 256 * reshape(im, 32, 32, 1, []) ;
