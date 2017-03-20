function OutStruct = Assign_THist(Struct,k)
%Function ASSIGN TEXTON MAP & HISTOGRAM     OUTSTRUCT = ASSIGN_TMAP(STRUCT,
%                                                       FBANK,K,assign)
%                                           Function that Assigns to each
%                                           and every single image of the
%                                           images contained in structure
%                                           STRUCT the texton map obtained
%                                           with the Texton Dictionary.
%                                           Struct. The ingresed Structure
%                                           must contain fields: 'name',
%                                           'image', 'map', 'textons'.
%                                           Otherwise an error will be
%                                           K. K used to implement K-Means
%                                           in the construction of the
%                                           Dictionary. Default K = 50.

%% Check for input variables
%Check for K.
if(nargin<2)
    k = 50;
end

%% Running the body of the function
addpath('lib');
%Check for the length of the structure
Lg = length(Struct);
try
    for x = 1:Lg        
        %Recovering the Texton Map 
        Tmap = Struct(x).map;
        %Assigning the Histogram
        Struct(x).Hist = histc(Tmap(:),1:k)/numel(Tmap);
    end
catch
    er = strcat('Input arguments not correct, perhaps the Structure does',...
        {' '},'have the required field "map"');
    error(char(er))
end
OutStruct = Struct;
end