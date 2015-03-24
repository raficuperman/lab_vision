%Test
clear all
close all
clc
load('MejorBosque.mat')
load('histograma_test_RandomForest.mat');
load('etiquetas_test.mat');

tic
etiquetas=Bosque.predict(histograma_test);
toc

CorregirFormatoPredicciones
M=confusionmat(prediccionArbol,etiquetas_test);
error=sum(prediccionArbol~=etiquetas_test)/length(etiquetas_test)