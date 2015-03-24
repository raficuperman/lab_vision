%Test
clear all
close all
clc
load('histograma_train_1Dato.mat');
load('histograma_test_interseccion.mat');
load('etiquetas_train_1Dato.mat');
load('etiquetas_test.mat');
load('D.mat');
tic 
    for j=1:length(histograma_test)
       for k=1:25
            similaridad(j,k) = Interseccion(histograma_train{9}(k,:), histograma_test(j,:)); 
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

    for j=1:length(similaridad)
        [~, etiquetas(j,1)]=max(similaridad(j,:));
    end
    error=sum(etiquetas~=etiquetas_test)/length(etiquetas_test);

toc