%%Histogramas de las imagenes de test
addpath('lab6_textons/lib')
rmpath('train')
addpath('test')
clear all
close all
clc
tic
for i=1:25
    if i<10
        DTest{i}=dir((sprintf('test/T0%g_*.jpg',i)));
    else
        DTest{i}=dir((sprintf('test/T%g_*.jpg',i)));
    end
end
load('textons.mat');
load('fb.mat');
etiquetas_test=[];

%i=9; %Para nearest Neighbour
i=10; %Para random forest
   for j=1:length(DTest)
       for k=1:length(DTest{j})
            etiquetas_test=[etiquetas_test; j];
            im1=double((imread(DTest{j}(k).name)))/255;
            tmap=assignTextons(fbRun(fb,im1),textons{i}');
            [clusters, ~]=size(textons{i});
            histograma_test((length(DTest{j}))*(j-1)+k,:)= histc(tmap(:),1:clusters)/numel(tmap);
       end
       j
   end
   toc
save('histograma_test_RandomForest.mat', 'histograma_test')
save('etiquetas_test.mat', 'etiquetas_test')