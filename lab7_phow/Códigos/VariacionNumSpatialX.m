clear all
close all 
clc
global conf
conf.numTrain = 50 ;
conf.numTest = 50 ;
conf.numClasses=20;
particion=[[1 1];[1 2];[1 4];[2 1];[2 2];[2 4];[4 1];[4 2];[4 4]];
for i=1:length(particion)
    tic
    conf.numSpatialX = particion(i,:);
    phow_imagenet_tiny();
    tiempo=toc
    print ('-dpng', sprintf('Resultados_20clases_50train_50test_%g,%gparticion.jpg',conf.numSpatialX(1,1), conf.numSpatialX(1,2)))
    save(sprintf('Resultados_20clases_50train_50test_%g,%gparticion.mat',conf.numSpatialX(1,1), conf.numSpatialX(1,2)), 'tiempo')
    close all
    delete('data/baseline-hists.mat')
    delete('data/baseline-result.mat')
    delete('data/baseline-vocab.mat')
    delete('data/baseline-result.ps')
    delete('data/baseline-model.mat')
    clc
end
