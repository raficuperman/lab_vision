clear all
close all
clc
addpath('BSDS500/data/images/test')
D=dir('BSDS500/data/images/test/*.jpg');

tic
clusters_kmeans=[2 3 5 8 10 15 20];
for i=1:length(D)
   for j=1:length(clusters_kmeans)
      Seg_kmeans_lab2{i,j} = segment_by_clustering(D(i).name, 'lab', 'kmeans', clusters_kmeans(j));
   end
   i
end
toc
%save('Seg_kmeans_lab.mat', 'Seg_kmeans_lab')
%save('clusters_kmeans.mat', 'clusters_kmeans')
beep
pause(1), beep
pause(1), beep