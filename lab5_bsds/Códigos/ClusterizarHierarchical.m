clear all
close all
clc
addpath('BSDS500/data/images/test')
D=dir('BSDS500/data/images/test/*.jpg');

tic
clusters_hierarchical=[2 3 5 8 10 15 20];
for i=1:length(D)
    I=imread(D(i).name);
    %I=imresize(I,0.5);
    [M,N,~]=size(I);
    IReshape=reshape(I(:),[],3);
    IReshape=double(IReshape);
    [L,a,b] = RGB2Lab(IReshape(:,1),IReshape(:,2),IReshape(:,3));
    IReshape=255.*[L a b];
    Z = linkage(IReshape,'ward','euclidean','savememory','on');
   for j=1:length(clusters_hierarchical)
        clusters = cluster(Z,'maxclust',clusters_hierarchical(j));
        Seg_hierarchical_lab2{i,j}=reshape(clusters(:),M,N);
   end
   i
end
toc
beep
pause(1), beep
pause(1), beep