addpath(genpath(fullfile(cd,'BSR')));
str_imDir = fullfile(cd,'BSR/BSDS500/data/images/test/');
dirIms = dir(str_imDir);
tic
for i=3:length(dir(str_imDir))-1
    disp(i-2)
    tic
    cells_kmeans = cell(1,5);
    cells_gmm = cell(1,5);
    str_Im = dirIms(i).name;
    im = imread(str_Im);
    cells_kmeans{1,1} = segment_by_clustering(str_Im,'lab+xy','kmeans',2);
    cells_kmeans{1,2} = segment_by_clustering(str_Im,'lab+xy','kmeans',4);
    cells_kmeans{1,3} = segment_by_clustering(str_Im,'lab+xy','kmeans',5);
    cells_kmeans{1,4} = segment_by_clustering(str_Im,'lab+xy','kmeans',6); 
    cells_kmeans{1,5} = segment_by_clustering(str_Im,'lab+xy','kmeans',8);
    [tok,~] = strtok(str_Im,'.');
    str_save = strcat(tok,'.mat');
    save(str_save,'cells_kmeans');
    movefile(str_save,'BSR/BSDS500/data/segs_kmeans');
    cells_gmm{1,1} = segment_by_clustering(str_Im,'lab+xy','gmm',2);
    cells_gmm{1,2} = segment_by_clustering(str_Im,'lab+xy','gmm',4);
    cells_gmm{1,3} = segment_by_clustering(str_Im,'lab+xy','gmm',5);
    cells_gmm{1,4} = segment_by_clustering(str_Im,'lab+xy','gmm',6); 
    cells_gmm{1,5} = segment_by_clustering(str_Im,'lab+xy','gmm',8);
    parsave(str_save,cells_gmm);
    movefile(str_save,'BSR/BSDS500/data/segs_gmm');
    toc
end
toc