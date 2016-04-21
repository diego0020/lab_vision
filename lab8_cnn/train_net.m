function res=train_net(net,test_data)

setup ;

for i=1:size(test_data,3)
net = load('CNNFierroReyes\Fierro_Reyes_CNN.mat') ;

im = test_data(:,:,i) ;
im_ = im2single(im) ; 
im_ = 256 * (im_ - net.imageMean) ;
im_ = imresize(im_, [128 128]) ;

res = vl_simplenn(net, im_) ;

scores = squeeze(gather(res(end).x));
[bestScore, best] = max(scores);

categ(i)=best
end 

res=categ;