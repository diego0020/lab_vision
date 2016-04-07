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
numClasses = [10,20,30];
numIms = [10,20,30];
spatial = [2 4;8 16;32 64];
Names = {'Test1','Test2','Test3'};
figNams = {'10Class10Im','20Class20Im','30Class30Im'};

for x = 1:length(Names)
    phow_101Torres(Names{x},numIms(x),spatial(x,:),numClasses(x),...
        figNams{x});
    movefile(Names{x},T)
end

zip('Tests.zip',T)


