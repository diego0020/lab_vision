
addpath('lib')

tic 
Direccion='D:\Docs\Documents\UNIVERSIDAD\ULTIMO\Vision_en_Computador\LabTextones\train';
Imagenes=dir(fullfile(Direccion,'*.jpg'));

load('Diccionario2.mat')
tmap=cell(0);
Histogramas=cell(0);
[fb] = fbCreate;
k=50;
%  Histograma de mapa de textones para imagenes de train 
for i=1:numel(Imagenes),

    im2=double(imread(fullfile(Direccion,Imagenes(i).name)))/255;
    tmap{i} = assignTextons(fbRun(fb,im2),textons');
    Histogramas {i}=histc(tmap{i}(:),1:k)/numel(tmap{i});
  disp(i)

end

%RANDOM FOREST
%Fuente Codigo: http://kawahara.ca/matlab-treebagger-example/

rng default
 
%Creacion datos de entrenamiento 
trainData=[];
a=1;
 for i=1:30:length(Histogramas)-29
     
     for j=0:29
    Hist = [Histogramas{j+i}' a];
    trainData=[trainData;Hist];
     end 
     a=a+1;
 end 
 
features = trainData(:,(1:50));
classLabels = trainData(:,51);
 
% Numero de Arboles
nTrees = 20;
 
%Train the TreeBagger (Decision Forest).
B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification');

%Etapa de Test
Test='D:\Docs\Documents\UNIVERSIDAD\ULTIMO\Vision_en_Computador\LabTextones\test';
Imagenes_Test=dir(fullfile(Test,'*.jpg'));

tmap_Test=cell(0);
Histogramas_Test=cell(0);
% Histograma de mapa de textones para imagenes de test
for i=1:numel(Imagenes_Test),

    im2=double(imread(fullfile(Test,Imagenes_Test(i).name)))/255;
    tmap_Test{i} = assignTextons(fbRun(fb,im2),textons');
    Histogramas_Test {i}=histc(tmap_Test{i}(:),1:k)/numel(tmap_Test{i});
  disp(i)
end

%Datos de test 
newData=[];
a=1;
 for i=1:10:length(Histogramas_Test)-9
     
     for j=0:9
    Hist_Test = [Histogramas_Test{j+i}'];
    newData=[newData;Hist_Test];
     end 
     a=a+1;
 end 

% %Predicciones de los nuevos datos 
predChar1 = B.predict(newData);
%  
% % Conversion de char a numero de las predicciones 
predictedClass = str2double(predChar1)

toc 
