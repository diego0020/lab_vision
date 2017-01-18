function Fierron_Reyes_Train(varargin)
% EXERCISE4   Part 4 of the VGG CNN practical

setup ;

% -------------------------------------------------------------------------
% Part 4.1: prepare the data
% -------------------------------------------------------------------------

% Load character dataset
imdb=load('textonsdb.mat') ;
imdb.images.data=im2single(imdb.images.data);


% -------------------------------------------------------------------------
% Part 4.2: initialize a CNN architecture
% -------------------------------------------------------------------------

net =  Fierro_Reyes_Arquitectura();

% -------------------------------------------------------------------------
% Part 4.3: train and evaluate the CNN
% -------------------------------------------------------------------------

trainOpts.batchSize = 25 ;
trainOpts.numEpochs = 3;
trainOpts.continue = true ;
trainOpts.useGpu = false ;
trainOpts.learningRate = 0.01 ;
trainOpts.expDir = 'CNNFierroReyes_Final' ;
trainOpts = vl_argparse(trainOpts, varargin);

% Take the average image out

imdb.images.id= imdb.images.id(1:18750);
imdb.images.label= imdb.images.label(1:18750);
imdb.images.set= imdb.images.set(1:18750);
imdb.images.data= imdb.images.data(:,:,1:18750);
imageMean = mean(imdb.images.data(:)) ;
imdb.images.data = imdb.images.data - imageMean ;

% Convert to a GPU array if needed
if trainOpts.useGpu
  imdb.images.data = gpuArray(imdb.images.data) ;
end

% Call training function in MatConvNet
[net,info] = cnn_train(net, imdb, @getBatch, trainOpts) ;

% Move the CNN back to the CPU if it was trained on the GPU
if trainOpts.useGpu
  net = vl_simplenn_move(net, 'cpu') ;
end

% Save the result for later use
net.layers(end) = [] ;
net.imageMean = imageMean ;
save('CNNFierroReyes_Final/Fierro_Reyes_CNN.mat', '-struct', 'net') ;

% % -------------------------------------------------------------------------
% % Part 4.6: train with jitter
% % -------------------------------------------------------------------------

trainOpts.batchSize = 25 ;
trainOpts.numEpochs = 3 ;
trainOpts.continue = true ;
trainOpts.useGpu = false ;
trainOpts.learningRate = 0.01 ;
trainOpts.expDir = 'CNNFierroReyes_Final/WithJitt' ;

% % Initlialize a new network
net = Fierro_Reyes_Arquitectura() ;

% Call training function in MatConvNet
[net,info] = cnn_train(net, imdb, @getBatchWithJitter, trainOpts) ;

% Move the CNN back to CPU if it was trained on GPU
if trainOpts.useGpu
  net = vl_simplenn_move(net, 'cpu') ;
end

% % Save the result for later use
net.layers(end) = [] ;
net.imageMean = imageMean ;
save('CNNFierroReyes_Final/WithJitt/Fierro_Reyes_jit.mat', '-struct', 'net') ;


% --------------------------------------------------------------------
function [im, labels] = getBatch(imdb, batch)
% --------------------------------------------------------------------
im = imdb.images.data(:,:,batch) ;
im = 256 * reshape(im, 128, 128, 1, []) ;
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
sy = max(1, min(128, (1:128) + dy)) ;

im = ctx(sy,sx,:) ;

im = 256 * reshape(im, 128, 128, 1, []) ;

