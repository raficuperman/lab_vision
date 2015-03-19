%Corregir tamaños
clear all
close all
clc
addpath('BSDS500/data/images/test')
addpath('Segmentacion_hierarchical_lab')
DImagenes=dir('BSDS500/data/images/test/*.jpg');
DSegmentaciones=dir('Segmentacion_hierarchical_lab/*.mat');

for i=1:length(DImagenes)
   I=imread(DImagenes(i).name);
   [M,N,~]=size(I);
   load(DSegmentaciones(i).name)
   for j=1:length(actual)
       tamanoOriginal{1,j}=imresize(actual{1,j},[M,N],'nearest');
   end
   [~,name,~]=fileparts(DImagenes(i).name);
   save(strcat(name,'.mat'),'tamanoOriginal')
end