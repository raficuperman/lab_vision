%Calcula los centroides de los clusters
addpath('lab6_textons/lib')
addpath('train')
clear all
close all
clc

% create filter bank
[fb] = fbCreate;
im=[];
for i=1:25
    if i<10
        D{i}=dir((sprintf('train/T0%g_*.jpg',i)));
    else
        D{i}=dir((sprintf('train/T%g_*.jpg',i)));
    end
    im1=double((imread(D{i}(1).name)))/255;
    im1=imcrop(im1,[200 200 100 100]);
    im=[im im1];
end

% numero de textones en diccionario
numclusters=[5 10 15 20 25 30 35 40 45 50];
for i=1:length(numclusters)
% diccionario de textones
[~,textons{i}] = computeTextons(fbRun(fb,im),numclusters(i));
numclusters(i)
end



