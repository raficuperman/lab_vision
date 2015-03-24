%Histogramas de las imagenes de entrenamiento
addpath('lab6_textons/lib')
addpath('train')
clear all
close all
clc
load('D.mat');load('textons.mat');
load('fb.mat');
numTrain=21; %numero de imagenes de train por clase

tic
for i=1:length(textons)
   for j=1:length(D)
       for k=1:numTrain;
            im1=double((imread(D{j}(k).name)))/255;
            tmap=assignTextons(fbRun(fb,im1),textons{i}');
            [clusters, ~]=size(textons{i});
            histograma_train{i}(((length(D)*(k-1))+j),:)= histc(tmap(:),1:clusters)/numel(tmap);
       end
   end
   disp('Entrenamiento')
   i
end
%Se crea una variable de celdas. Cada celda corresponde al histograma con
%distinto numero de clusters y dentro de cada celda estan los histogramas
%de las 25 imagenes de train
etiquetas_train=[];
for i=1:numTrain
    for j=1:length(D)
        etiquetas_train=[etiquetas_train; j]; 
    end
end
            
save(sprintf('histograma_train_%gDato.mat',numTrain), 'histograma_train')
save(sprintf('etiquetas_train_%gDato.mat',numTrain), 'etiquetas_train')


%Histograma de las imágenes de Validacion

etiquetas_validacion=[];
for i=1:length(textons)
   for j=1:length(D)
       for k=1:length(D{j})-numTrain
            if i==1
                etiquetas_validacion=[etiquetas_validacion; j];
            end
            im1=double((imread(D{j}(k+numTrain).name)))/255;
            tmap=assignTextons(fbRun(fb,im1),textons{i}');
            [clusters, ~]=size(textons{i});
            histograma_validacion{i}((length(D{j})-numTrain)*(j-1)+k,:)= histc(tmap(:),1:clusters)/numel(tmap);
       end
   end
   disp('Validación')
   i
end
save(sprintf('histograma_validacion_%gDato.mat',numTrain), 'histograma_validacion')
save(sprintf('etiquetas_validacion_%gDato.mat',numTrain), 'etiquetas_validacion')

tiempoHistogramas=toc
save('tiempoHistogramas.mat', 'tiempoHistogramas')