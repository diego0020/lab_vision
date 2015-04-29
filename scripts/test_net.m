function total_score=test_net(folder)
%run('/home/imagine/cnn/practical/setup.m');
test_db=load('home/imagine/cnn/scripts/test_textons');
cd('/home/imagine/cnn/hws');
cd(folder)
cd textons-experiment
epochs=dir('net-epoch-*.mat');
net_t=load(epochs(end).name);
net=net_t.net;
if strcmp(net.layers{end}.type, 'softmaxloss')
    net.layers(end)=[];
end

total_score=0;
for i=1:length(test_db.patches)
label=test_db.labels(1);
p0=test_db.patches{i};
p1=reshape(p0,128,128,1,[]);
res=vl_simplenn(net,p1);
resl=squeeze(res(end).x);
score=zeros(size(p0,3),1);
pred=score;
for j=1:size(resl,2)
    [score(j),pred(j)]=max(resl(:,j));
end    
round_score=sum(pred==label);
total_score=total_score+ round_score;
end