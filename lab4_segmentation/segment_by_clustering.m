function [my_segmentation] = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
%segment_by_clustering Función para segmentar una imagen
%   rgb_image es la imagen a segmentar
%   feature_space es el espacio de representación. Puede ser ('rgb' por defecto):
%       'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy' 
%   clustering_method es el método de clustering. Puede ser ('kmeans' por defecto):
%       'kmeans', 'gmm', 'hierarchical', 'watersheds'
%   number_of_clusters es el número de clusters. Debe ser un número mayor o
%       igual a 1. (2 por defecto)

%% Inicialización
close all
clc
addpath('images')
if nargin < 2
    feature_space='rgb';
end
if nargin < 3
    clustering_method='kmeans';
end
if nargin < 4
    number_of_clusters=2;
end
if (number_of_clusters<1)
   error('Número de clusters inválido'); 
end
I=imread(rgb_image);

%%  Reducción de tamaño de imagen para jerárquico
if strcmp(clustering_method,'hierarchical')==1
    I=imresize(I,0.5);
end
%% Tamaño de la imagen
[M,N,~]=size(I);
figure, imshow(I)
title('Imagen original')
%%  Conversión de colores

switch feature_space
    case 'lab'
        IReshape=reshape(I(:),[],3);
        IReshape=double(IReshape);
        [L,a,b] = RGB2Lab(IReshape(:,1),IReshape(:,2),IReshape(:,3));
        IReshape=255.*[L a b];
    case 'hsv'
        I=rgb2hsv(I);
        IReshape=reshape(I(:),[],3);
        IReshape=255.*double(IReshape);
    case 'rgb+xy'
        IReshape=reshape(I(:),[],3);
        IReshape=double(IReshape);
        temp=0;
        for i=1:N
           for j=1:M
              temp=temp+1;
              IReshape(temp,4)=i;
              IReshape(temp,5)=j;
           end
        end
    case 'lab+xy'
        IReshape=reshape(I(:),[],3);
        IReshape=double(IReshape);
        [L,a,b] = RGB2Lab(IReshape(:,1),IReshape(:,2),IReshape(:,3));
        IReshape=255.*[L a b];
        temp=0;
        for i=1:N
           for j=1:M
              temp=temp+1;
              IReshape(temp,4)=i;
              IReshape(temp,5)=j;
           end
        end
    case 'hsv+xy'
        I=rgb2hsv(I);
        IReshape=reshape(I(:),[],3);
        IReshape=255.*double(IReshape);
        temp=0;
        for i=1:N
           for j=1:M
              temp=temp+1;
              IReshape(temp,4)=i;
              IReshape(temp,5)=j;
           end
        end
    case 'rgb'
        IReshape=reshape(I(:),[],3);
        IReshape=double(IReshape);
    otherwise
        error('Se introdujo un espacio de representación inválido');
end

%% Clustering
switch clustering_method
    case 'gmm'
        clusters=gmdistribution.fit(IReshape, number_of_clusters);
        clusters=cluster(clusters, IReshape);
        clusters=reshape(clusters,M,N);
        figure,imshow(clusters,[])
        colormap colorcube
        my_segmentation=clusters;
    case 'hierarchical'
        Z = linkage(IReshape,'ward','euclidean','savememory','on');
        clusters = cluster(Z,'maxclust',number_of_clusters);
        clusters=reshape(clusters(:),M,N);
        figure,imshow(clusters,[])
        colormap colorcube
        my_segmentation=clusters;
    case 'watersheds'
        I=rgb2gray(I);
        hy= fspecial('sobel');
        hx= hy';
        Iy= imfilter(double(I), hy, 'replicate');
        Ix = imfilter(double(I), hx, 'replicate');
        grad = sqrt(Ix.^2 + Iy.^2);
        marker = imextendedmin(grad, number_of_clusters);
        new_grad= imimposemin(grad, marker);
        ws= watershed(new_grad);
        figure,imshow(ws==0)
        my_segmentation=new_grad;
        
    case 'kmeans'
        clusters=kmeans(IReshape, number_of_clusters);
        clusters=reshape(clusters,M,N);
        figure,imshow(clusters,[])
        colormap colorcube
        my_segmentation=clusters;
    otherwise
        error('Se introdujo un método de clustering inválido');
end
        title({['Clustering por ',clustering_method,...
            ' bajo espacio de representación ',feature_space],...
            ['con ', num2str(number_of_clusters), ' clusters']})
end

