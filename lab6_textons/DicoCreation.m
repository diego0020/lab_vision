clc, clear all, close all
%% Initiation
%Addition of the path
addpath('lib')
%Route to train directory
dTrain = fullfile(cd,'train');
%Creation of structure containing the names of the cathegories
nomCat = {'bark1','bark2','bark3','wool1','wool2','wool3',...
    'water','granite','marble','floor1','floor2','pebbles',...
    'wall','brick1','brick2','glass1','glass2','carpet1',...
    'carpet2','upholstery','wallpaper','fur','knit','corduory',...
    'plaid'};
%Cathegory-wise codes
indCat = {'T01','T02','T03','T04','T05','T06','T07','T08','T09','T10',...
'T11','T12','T13','T14','T15','T16','T17','T18','T19','T20','T21','T22',...
'T23','T24','T25'};

%Creation of Structure containing the suffixes for each image in each
%cathegory
for x = 1:30
    if x <10
        nomPerm{x} = strcat('_0',num2str(x),'.jpg');
    else
        nomPerm{x} = strcat('_',num2str(x),'.jpg');
    end
end

%Filter Bank creation
[fb] = fbCreate;
%Number of textons in the dictionary
k = 50;

%Creation of Texton Dictionary Structure
TXT=struct('name',[],'image',[],'map',[],'textons',[]);
%% Preparation before passing the for to assign textons for ten images per
%cathegory
inds = 1:10:260;
cats = 1:25;
%Aleatorization of the system
vec = randperm(30);
VEC = repmat(vec,1,10);
%For assigning the textons and creating the texton dictionary per
%cathegory, each cathegory has 10 sample images
for x = 1:250
    for y = 2:length(inds) 
        if x>=inds(y-1)&&x<inds(y)
            %Assigning the name
            TXT(x).name = char(nomCat(cats(y-1))); 
            nam = char(indCat(cats(y-1)));
            %Assigning the image cathegory to the correct image code
            imnom = strcat(nam,char(nomPerm(VEC(x))));
            im = im2double(imread(fullfile(dTrain,imnom)));
            TXT(x).image = im;                
            %Computation of textons
            [map,textons] = computeTextons(fbRun(fb,im),k);
            TXT(x).map = map;
            TXT.textons = textons;  
            disp(strcat('Succesfully created Textons dictionary for image'...
            ,{' '},imnom));
        end
    end               
end
save('TextureDico.mat','TXT');



    
    
        
    
    
