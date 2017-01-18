Test='D:\Docs\Documents\UNIVERSIDAD\ULTIMO\Vision_en_Computador\LabTextones\test';
Imagenes_Test=dir(fullfile(Test,'*.jpg'));
load('ResultadosRandom.mat')
Anotaciones=[];
for i=1:length(Imagenes_Test)
    
     Nombre=Imagenes_Test(i).name(2:3);
     Anotaciones(i)=str2num(Nombre);    
end 

Anotaciones=Anotaciones';

[C order]= confusionmat(Anotaciones,predictedClass)
