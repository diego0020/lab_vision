clc
clear all
close all

%nTrain = [50,60,70,80];
nTrain = 50;
nClass = [5,50,100,200];
nWords = [300,400,500,600];
nSpatial = {2,4,8,[2,4],[2,4,8]};
C = [10,100,1000,10000];
pHowO = [0,1];

counter = 1;

for p=1:length(nClass)
    for s=1:length(nWords)
        for t=1:length(nSpatial)
            for c=1:length(C)
                for q=1:length(pHowO)
                    close all
                    temp = nSpatial{t};
                    
                    tic;
                    ac(counter)=phow_imagenet_smallValidation(nTrain,nClass(p),nWords(s),...
                        temp,C(c),pHowO(q));
                    VecTiempo(counter)=toc;
                    
                    counter = counter + 1;
                    
                    clc
                    p
                    s
                    t
                    c
                    q
                    
                    if(length(temp)==1)
                        Name = strcat('Validation_',num2str(nTrain),'_',...
                            num2str(nClass(p)),'_',num2str(nWords(s)),'_',...
                            '[',num2str(temp),']_',num2str(C(c)),'_',...
                            num2str(pHowO(q)),'_C',num2str(counter-1));
                    elseif(length(temp)==2)
                        Name = strcat('Validation_',num2str(nTrain),'_',...
                            num2str(nClass(p)),'_',num2str(nWords(s)),'_',...
                            '[',num2str(temp(1)),'_',num2str(temp(2)),']_',...
                            num2str(C(c)),'_',num2str(pHowO(q)),'_C',num2str(counter-1));
                    else
                        Name = strcat('Validation_',num2str(nTrain),'_',...
                            num2str(nClass(p)),'_',num2str(nWords(s)),'_',...
                            '[',num2str(temp(1)),'_',num2str(temp(2)),'_',...
                            num2str(temp(3)),']_',num2str(C(c)),'_',...
                            num2str(pHowO(q)),'_C',num2str(counter-1));
                    end
                    
                    mkdir(fullfile(cd,'imagenet_small'),Name);
                    
                    Datos = [dir(fullfile(cd,'imagenet_small','*.mat')) ;...
                        dir(fullfile(cd,'imagenet_small','*.ps'))];
                    
                    OldDir = cd('imagenet_small');
                    
                    for i=1:length(Datos)
                        movefile(Datos(i).name,Name);
                    end
                    
                    cd(OldDir);
                    

                end
            end
        end
    end
end

OldDir = cd('imagenet_small');
save('Performance','VecTiempo','ac');
cd(OldDir);