clc, clear all, close all
%% Initialization
%Loading important files
load('TextureDico_Train.mat');
TXT_Trained = Assign_THist(TXT,50);
load('TextureDico_Test.mat');
TXT_Test = Assign_THist(TXT,50);
%Label Structure creation
Labels = {'bark1','bark2','bark3','wool1','wool2','wool3',...
    'water','granite','marble','floor1','floor2','pebbles',...
    'wall','brick1','brick2','glass1','glass2','carpet1',...
    'carpet2','upholstery','wallpaper','fur','knit','corduory',...
    'plaid'};

%% Features extraction
Lg = length(TXT_Trained);
%Texture Histograms
Hist = TXT_Trained(1).Hist;
Hdata = zeros(Lg,length(Hist));
%For train
for x = 1:Lg
    Hdata(x,:) = TXT_Trained(x).Hist;
end
%For Test
H2 = TXT_Test(1).Hist;
H2data = zeros(length(TXT_Trained,length(H2)));
for x = 1:length(TXT_Trained)
    H2data(x,:) = TXT_Test(x).Test;
end

%% Checking the values
for x = 1:length(H2data)
    Predicted_Chi{x} = Find_Nearest_Neighborh(Hdata,H2data(:,x),'Chi-square',...
        Labels);
    Predicted_Inter{x} = Find_Nearest_Neighborh(Hdata,H2data(:,x),'Intersection',...
        Labels);
end