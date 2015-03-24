%Calcula el error de clasificación sobre unas imágenes (pueden ser de
%entrenamient o de validacion. Se hace esto a partir de las predicciones. Toca correr antes PrediccionBosques.m 
clear all
close all
clc
numTrain=21;
load(sprintf('prediccionBosqueTrain_%gDato.mat',numTrain))
load(sprintf('etiquetas_train_%gDato.mat',numTrain));
[arboles, dimensiones]=size(prediccion);
tic 
for i=1:arboles
    for j=1:dimensiones
        predicciones=[];
        for k=1:length(prediccion{i,j})
            predicciones=[predicciones;str2double(prediccion{i,j}{k})];
        end
        error(i,j)=sum(predicciones~=etiquetas_train)/length(etiquetas_train);
    end
end
toc
save(sprintf('ErrorTrainBosque_%gDato.mat',numTrain), 'error')

%Crea una matriz de celdas. En la celda (i,j) está el error de clasificación para el modelo con con i árboles
%para la representacion con j dimensiones