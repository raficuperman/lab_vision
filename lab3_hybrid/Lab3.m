close all
clear all
clc

addpath(genpath('data.tar')) % Agrega la carpeta
I1=imread('dog.bmp'); % Imagen 1
I2=imread('cat.bmp'); % Imagen 2
corte1=8; % Par�metro imagen 1
corte2=8; % Par�metro imagen 2
filtro1=fspecial('gaussian',33, corte1); % Filtro 1
filtro2=fspecial('gaussian',33, corte2); % Filtro 2
I1filt=imfilter(I1,filtro1); % Imagen 1 filtrada
I2filt=I2-imfilter(I2,filtro2); % Imagen 2 filtrada
%imshow(I1filt);
%figure, imshow(I2filt);

% FFT de las im�genes
fft1=fft(I1);
fft2=fft(I2);
fftfilt1=fft(filtro1);
fftfilt2=fft(filtro2);
fft1filt=fft(I1filt);
fft2filt=fft(I2filt);

% DCT de las im�genes
% dct1=dct(double(I1));
% dct2=dct(double(I2));
% dctfilt1=dct(double(filtro1));
% dctfilt2=dct(double(filtro2));
% dct1filt=dct(double(I1filt));
% dct2filt=dct(double(I2filt));

%Im�gen h�brida
H=I1filt+I2filt;

%Pir�mide
H1 = impyramid(H, 'reduce');
H2 = impyramid(H1, 'reduce');
H3 = impyramid(H2, 'reduce');
H4 = impyramid(H3, 'reduce');

%Visualizaci�n
figure, imshow(H)
figure, imshow(H1)
figure, imshow(H2)
figure, imshow(H3)
figure, imshow(H4)