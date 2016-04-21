function res = train_net(net, test_data)
k = size(test_data,3) ;
test_data = single(test_data) ;
test_data = test_data-net.imageMean ;
res = zeros(k,1) ;
for i=1:k
    resp = vl_simplenn(net, test_data(:,:,i)) ;
    [~, pred] = max(squeeze(resp(end).x)) ;
    res(i) = pred ;
end
