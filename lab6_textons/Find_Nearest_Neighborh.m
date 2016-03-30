function Label = Find_Nearest_Neighborh(Histdata,Histo,Method,Labels)
%Function FIND_NEARESt_NEIGHBORH   LABEL = FIND_NEAREST_NEIGHBORH(HISTDATA,
%                                  HISTO,METHOD,LABELS)
%                                  
%                                  Function that finds the nearest
%                                  HISTOGRAM neighborh to the one ingressed
%                                  as an input. This is done by having a
%                                  set of descriptors which are then
%                                  checked according to method and the one
%                                  with the lowest distance to the input
%                                  should be the Nearest Neighborh.
%                                  HISTDATA. Set of descriptors to be used
%                                  in the comparisson. 
%                                  HISTO. Histogram to check for it's
%                                  nearest neighborh in Histodata.
%                                  METHOD. Method to be used when comparing
%                                  histograms, it can either be
%                                  'Chi-square' or 'Intersection'. By
%                                  default it is 'Chi-Square'.
%                                  LABELS. Labels containing the names of
%                                  each segment of data for the
%                                  descriptors, answer will depend on
%                                  Labels' names.

%% Check for input parameters
Methods = {'Chi-square','Intersection'};
%Check for label input
if(nargin<4)
    Labels = 1:length(Histdata);
end
%Check for method input
if(nargin<3)
    Method = 'Chi-square';
end
%Check for input histogram
if(nargin<2)
    er = strcat('You must set a Histogram to compare with');
end
%Check if method ingressed exists
for x = 1:length(Methods)
    VecP(x) = strcmpi(Method,Methods{x});
end
%Error Message
Pos = find(VecP>0);
if(isempty(Pos)==1)
    er = strcat('Input name for Kernel type does not exist, Kernel types'...
        ,{' '},'should be either:',{' '},char(39),'Chi-square',char(39),',',...
        {' '},'or',{' '},char(39),'Intersection',char(39),'.');
    error(char(er));
end

%% Check according to methods
[nR,~] = size(Histdata);
%Check for number of classes and the bins taken by each
nbins = nR/numel(Labels);
%Vector containing the separation data
Vec = 0:nbins:nR;
D = 0*(1:nR);
%Check method implementation
if(strcmpi(Method,'Chi-Square')==1)
    for x = 1:nR
        H1 = ((Histdata(x,:)-Histo).^2)/Histdata(x,:);
        D(x) = sum(H1);
    end
end
if(strcmpi(Method,'Intersection')==1)
    for x = 1:nR
        D(x) = sum(min(Histdata(x,:),Histo));
    end
end
%Rescuing label name from possible labels.
lemin = min(D);
index = find(D==lemin);
for x = 2:length(Vec)
    if(index>=Vec(x-1)&&index<Vec(x))
        Label = Labels(x-1);
    end
end
end
    
    

