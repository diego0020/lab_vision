function segmentation(ImagesDir,numCluster)

addpath(genpath(cd));
Images = dir(fullfile(cd,ImagesDir,'*.jpg'));
mkdir(fullfile(cd,'BSDS500','data','images'),'Seg');
addpath(genpath(cd));
oldDir = cd(fullfile(cd,'BSDS500','data','images','Seg'));

for i=1:length(Images)
    
    CellTemp = cell(1,length(numCluster));
    
    for j=1:length(numCluster)
        Temp = segment_by_clustering(imread(Images(i).name),'rgb','kmeans',numCluster(j));
        CellTemp{1,j} = Temp;
    end
    name = strcat(Images(i).name(1:end-3),'mat');
    save(name,'CellTemp');
    
    clear CellTemp;
end

end
