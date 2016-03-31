% addpath('../textones/lib/');
% clear all;close all;clc;
% 
% %% Representation
% [fb] = fbCreate;
% fim = cell(size(fb));
% trainDir = 'train';
% testDir = 'test';
% iids = dir(fullfile(trainDir,'*.jpg'));
% px_Batch = 3072;
% 
% % inicialize fim
% for i=1:numel(fim),
%     fim{i}=zeros(px_Batch,numel(iids));
% end
% 
% % Run filters on all img and save a batch of each one 
% for i=1:numel(iids),
%     nPx=numel(imread(fullfile(trainDir,iids(i).name)));
%     fbResp=fbRun(fb,double(imread(fullfile(trainDir,iids(i).name)))/255);
%     randPx=randi(nPx,[px_Batch 1]); %random vector
%     for j=1:numel(fim),
%         fim{j}(:,i)=fbResp{j}(randPx);
%     end
% end
% 
% % Get a dictionary
% k=50;
% [~,textons] = computeTextons(fim,k);
% 
% % Get a textons histogram and class label for each train img
% features=zeros(numel(iids),k);
% classLabels=(sort(repmat(1:25,1,30)))';
% 
% for i = 1:numel(iids),
%     nPx = numel(imread(fullfile(trainDir,iids(i).name)));
%     fbResp = fbRun(fb,double(imread(fullfile(trainDir,iids(i).name)))/255);
%     tmap = assignTextons(fbResp,textons');
%     [tHist,~] = histcounts(tmap,((0:k)+0.5));
%     features(i,:)=tHist/nPx;
% end
% 
% % Create a RF
% nTrees=20;
% B= TreeBagger(nTrees,features,classLabels, 'Method', 'classification');
% 
% %% Training Clasification
% trainDir = 'train';
% iids = dir(fullfile(trainDir,'*.jpg'));
% predTrainNear=zeros(numel(iids),1);
% predTrainTree=zeros(numel(iids),1);
% gt=sort(repmat(1:25,1,30));
% confTrainNear=zeros(25);
% confTrainTree=zeros(25);
% 
% for i = 1:numel(iids),
%     nPx = numel(imread(fullfile(trainDir,iids(i).name)));
%     fbResp = fbRun(fb,double(imread(fullfile(trainDir,iids(i).name)))/255);
%     tmap = assignTextons(fbResp,textons');
%     [tHist,~] = histcounts(tmap,((0:k)+0.5));
%     
%     d=Inf;
%     h1=tHist/nPx;
%     for j=1:(size(features,1)),
%         h2=features(j,:);
%         dj=sum(((h1-h2).^2)./h2);
%         if dj<d
%             predTrainNear(i)=classLabels(j);
%             d=dj;
%         end
%     end
%     confTrainNear(gt(i),predTrainNear(i))=confTrainNear(gt(i),predTrainNear(i))+1;
%     
%     predTrainTree(i)=str2double(B.predict(tHist/nPx));
%     confTrainTree(gt(i),predTrainTree(i))=confTrainTree(gt(i),predTrainTree(i))+1;
% end
% 
% %% Test Clasification 
% iids = dir(fullfile(testDir,'*.jpg'));
% predTestNear=zeros(numel(iids),1);
% predTestTree=zeros(numel(iids),1);
% gt=sort(repmat(1:25,1,10));
% confTestNear=zeros(25);
% confTestTree=zeros(25);
% 
% for i = 1:numel(iids),
%     nPx = numel(imread(fullfile(testDir,iids(i).name)));
%     fbResp = fbRun(fb,double(imread(fullfile(testDir,iids(i).name)))/255);
%     tmap = assignTextons(fbResp,textons');
%     [tHist,~] = histcounts(tmap,((0:k)+0.5));
%     
%     d=Inf;
%     h1=tHist/nPx;
%     for j=1:(size(features,1)),
%         h2=features(j,:);
%         dj=sum(((h1-h2).^2)./h2);
%         if dj<d
%             predTestNear(i)=classLabels(j);
%             d=dj;
%         end
%     end
%     confTestNear(gt(i),predTestNear(i))=confTestNear(gt(i),predTestNear(i))+1;
%     
%     predTestTree(i)=str2double(B.predict(tHist/nPx));
%     confTestTree(gt(i),predTestTree(i))=confTestTree(gt(i),predTestTree(i))+1;
% end

% %% Read labels
% fileID=fopen('names.txt','r');
% names=textscan(fileID,'%s%s%[^\n\r]','Delimiter','\t');
% names=[names{2}];

%% Results
ax(1,1)=subplot (2,2,1);
image(confTrainNear,'CDataMapping','scaled')
ax(1,2)=subplot (2,2,2);
image(confTrainTree,'CDataMapping','scaled')
ax(2,1)=subplot (2,2,3);
image(confTestNear,'CDataMapping','scaled')
ax(2,2)=subplot (2,2,4);
image(confTestTree,'CDataMapping','scaled')
set(ax,'yTickLabel',names,'yTick',1:25);
set(ax,'xTickLabel',names,'xTick',1:25,'xTickLabelRotation',90);