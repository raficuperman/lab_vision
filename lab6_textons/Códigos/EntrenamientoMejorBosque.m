%Entrenamiento del mejor bosque. En este caso fue el bosque usando 21
%imágenes de entrenamiento, con 25 árboles y con 50 textones (clusters)

clear all
close all
clc
numTrain=21;
load(sprintf('histograma_train_%gDato.mat',numTrain));
load(sprintf('etiquetas_train_%gDato.mat',numTrain));
arboles=25;
tic
for i=1:length(arboles)
       Bosque=TreeBagger(arboles, histograma_train{10}, etiquetas_train);
end

tiempoEntrenamiento=toc