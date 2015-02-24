function [] = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%% Inicialización
close all
clc
addpath('images')
I=imread(rgb_image);
figure, imshow(I)
title('Imagen original')
[M,N,~]=size(I);

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
    otherwise %rgb
        IReshape=reshape(I(:),[],3);
        IReshape=double(IReshape);
end

%% Clustering
switch clustering_method
    case 'gmm'
        clusters=gmdistribution.fit(IReshape, number_of_clusters);
        clusters=cluster(clusters, IReshape);
        clusters=reshape(clusters,M,N);
        figure,imshow(clusters,[])
        colormap colorcube
        title('Clustering por gmm')

    case 'hierarchical'

    case 'watershed'
        
    otherwise %kmeans
        clusters=kmeans(IReshape, number_of_clusters);
        clusters=reshape(clusters,M,N);
        figure,imshow(clusters,[])
        colormap colorcube
        title('Clustering por kmeans')

end
end

