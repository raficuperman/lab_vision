%Predicción de imagenes de validación o train en bosques. Genera vectores
%con las etiquetas predichas por el modelo para las imagenes de train o
%validacion
clear all
close all
clc

numTrain=21;
load(sprintf('Bosque_%gDato.mat',numTrain));
load(sprintf('histograma_train_%gDato.mat',numTrain));
load(sprintf('etiquetas_train_%gDato.mat',numTrain));
tic
[numArboles, numDimensiones]=size(Bosque);
for i=1:numArboles
   for j=1:numDimensiones
       for k=1:length(histograma_train{1})
           prediccion{i,j}(k,1)=Bosque{i,j}.predict(histograma_train{j}(k,:));
       end
   end
   i
end
tiempoTrain=toc
save(sprintf('prediccionBosqueTrain_%gDato.mat',numTrain), 'prediccion')