clc, clear all, close all
%Check if VLFEAT is in place in the containing folder
if(exist('VLFEATROOT','dir')==0)
    str = 'https://www.dropbox.com/s/9kaqrjcjva7cwgx/VLFEAT.zip?dl=1';
    A = websave('VLFEAT.zip',str);
    unzip(A);
end
%Check for Installation of VLFEAT library script is installed
if(exist('InstallVLFEAT.m','file')==0)
    st = 'https://www.dropbox.com/s/zoheikhkc5dt914/InstallVLFEAT.txt?dl=1';
    websave('InstallVLFEAT.m',st);
end
%Check for Modified phow_caltech101 from Andrea Vedaldi to this application
if(exist('phow_101Torres.m','file')==0)
    sF = 'https://www.dropbox.com/s/yz30oj79xjepxfl/phow_101Torres.txt?dl=1';
    websave('phow_101Torres.m',sF);
end
T = 'Tests';
mkdir(T);
%Tests
numClasses = [10 30];
numIms = [10 30];
spatial = [2;8];

%%

for x = 1:length(numClasses)
    for y = 1:length(numIms)
        for z = 1:length(spatial)
            phow_101Torres(numClasses(x),numIms(y),spatial(z),'Tests');
        end
    end
end

zip('Tests.zip',T)
