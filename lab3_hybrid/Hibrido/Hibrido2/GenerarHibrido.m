close all
clear all
clc

addpath(genpath('data.tar')) % Agrega la carpeta
I1=imread('Imagen3.bmp'); % Imagen 1
[M1, N1, ~]=size(I1);
I2=imread('Imagen4.bmp'); % Imagen 2
[M2, N2, ~]=size(I2);
if M1>M2
   I1=imresize(I1, [M2, N2]);
else
    I2=imresize(I2, [M1, N1]);
end
corte1=17; % Parámetro imagen 1
corte2=17; % Parámetro imagen 2
tamano=31; % Tamaño filtro
filtro1=fspecial('gaussian',tamano, corte1); % Filtro 1
filtro2=fspecial('gaussian',tamano, corte2); % Filtro 2
I1filt=imfilter(I1,filtro1); % Imagen 1 filtrada
I2filt=I2-imfilter(I2,filtro2); % Imagen 2 filtrada
%imshow(I1filt);
%figure, imshow(I2filt);

%Imágen híbrida
H=I1filt+I2filt;

%Pirámide
H1 = impyramid(H, 'reduce');
H2 = impyramid(H1, 'reduce');
H3 = impyramid(H2, 'reduce');
H4 = impyramid(H3, 'reduce');

%Visualización
figure, imshow(H)
figure, imshow(H1)
figure, imshow(H2)
figure, imshow(H3)
figure, imshow(H4)

imwrite(H, 'Hibrida.jpg');
imwrite(H1, 'Piramide1.jpg');
imwrite(H2, 'Piramide2.jpg');
imwrite(H3, 'Piramide3.jpg');
imwrite(H4, 'Piramide4.jpg');