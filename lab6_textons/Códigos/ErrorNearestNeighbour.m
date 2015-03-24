%Errores de clasificación sobre imágenes de train o validación con nearest
%neighbour
clear all
close all
clc
load('histograma_train_1Dato.mat');
load('histograma_validacion_1Dato.mat');
load('etiquetas_train_1Dato.mat');
load('etiquetas_validacion_1Dato.mat');
load('D.mat');
tic 
for i=1:length(histograma_validacion)
    for j=1:length(histograma_validacion{1})
       for k=1:length(histograma_train{1}) 
            similaridad{i}(j,k) = Interseccion(histograma_train{i}(k,:), histograma_validacion{i}(j,:)); 
       end
    end
end
%Se crea una variable similaridad de celdas. Cada celda corresponde a la
%similaridad de los histogramas de entrenamiento y validación con la
%cantidad de bins correspondiente (1=5, 2=10, ... 10=50). Dentro de cada
%celda hay una matriz donde cada fila corresponde a una imagen de
%validacion y cada fila a la similaridad de esa imagen de validación
%con las imagenes de entrenamiento (25 imagenes de entrenamiento: una por
%cada clase). Para hallar la etiqueta predicha por el modelo se encuentra el valor máximo
%para cada fila.

for i=1:length(similaridad)
    for j=1:length(similaridad{i})
        [~, etiquetas{i}(j,1)]=max(similaridad{i}(j,:));
    end
    error(i,1)=sum(etiquetas{i}~=etiquetas_validacion)/length(etiquetas_validacion);
end

toc