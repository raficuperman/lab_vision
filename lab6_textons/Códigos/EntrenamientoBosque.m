%Entrenamiento con bosque de decision variando el n�mero de �rboles
clear all
close all
clc
numTrain=1; %N�mero de im�genes de entrenamiento
load(sprintf('histograma_train_%gDato.mat',numTrain));
load(sprintf('etiquetas_train_%gDato.mat',numTrain));
arboles=[1 5 10 15 20 25 30];
tic
for i=1:length(arboles)
   for j=1:length(histograma_train)
       Bosque{i,j}=TreeBagger(arboles(i), histograma_train{j}, etiquetas_train);
   end
   i
end
%Crea una matriz de celdas. En la celda (i,j) est� el bosque con i �rboles
%para la representacion con j dimensiones

tiempoEntrenamiento=toc
save(sprintf('Bosque_%gDato.mat',numTrain), 'Bosque')