function [net] = trainingNet (varargin)

setup ;

trainOpts.batchSize = 100 ;
trainOpts.numEpochs = 15 ;
trainOpts.continue = true ;
trainOpts.useGpu = false ;
trainOpts.learningRate = 0.001 ;
trainOpts.expDir = 'data/textons-jit-experiment' ;
trainOpts = vl_argparse(trainOpts, varargin);

% Initlialize a new network
net = initializeTextonsCNN() ;

% Take the average image out
imdb = load('data/textonsdb.mat') ;
imdb.images.data = single(imdb.images.data) ;
imageMean = mean(imdb.images.data(:)) ;
imdb.images.data = imdb.images.data - imageMean ;

% Convert to a GPU array if needed
if trainOpts.useGpu
  imdb.images.data = gpuArray(imdb.images.data) ;
end

% Call training function in MatConvNet
tic
[net,info] = cnn_train(net, imdb, @getBatchWithJitter, trainOpts) ;
toc

% Move the CNN back to CPU if it was trained on GPU
if trainOpts.useGpu
  net = vl_simplenn_move(net, 'cpu') ;
end

% Save the result for later use
net.layers(end) = [] ;
net.imageMean = imageMean ;
save('data/textons-experiment/textonscnn-jit.mat', '-struct', 'net') ;

function setup(varargin)

run vlfeat/toolbox/vl_setup ;
run matconvnet/matlab/vl_setupnn ;
addpath matconvnet/examples ;

opts.useGpu = false ;
opts.verbose = false ;
opts = vl_argparse(opts, varargin) ;

try
  vl_nnconv(single(1),single(1),[]) ;
catch
  warning('VL_NNCONV() does not seem to be compiled. Trying to compile it now.') ;
  vl_compilenn('enableGpu', opts.useGpu, 'verbose', opts.verbose) ;
end

if opts.useGpu
  try
    vl_nnconv(gpuArray(single(1)),gpuArray(single(1)),[]) ;
  catch
    vl_compilenn('enableGpu', opts.useGpu, 'verbose', opts.verbose) ;
    warning('GPU support does not seem to be compiled in MatConvNet. Trying to compile it now') ;
  end
end


