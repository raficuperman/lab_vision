clear all
close all 
clc
global conf
%conf.numTrain = 50 ;
%conf.numTest = 50 ;
%conf.numClasses=5;
entrenamiento=[10 20 30 50 70 90];
for i=1:length(entrenamiento)
    tic
    conf.numTrain = entrenamiento(i);
    conf.numTest = 20;
    conf.numClasses = 30;
    phow_imagenet_tiny();
    tiempo=toc
    print ('-dpng', sprintf('Resultados_%gclases_%gtrain_%gtest.jpg',conf.numClasses,conf.numTrain, conf.numTest))
    save(sprintf('tiempo_%gclases_%gtrain_%gtest.mat',conf.numClasses,conf.numTrain, conf.numTest), 'tiempo')
    close all
    delete('data/baseline-hists.mat')
    delete('data/baseline-result.mat')
    delete('data/baseline-vocab.mat')
    delete('data/baseline-result.ps')
    delete('data/baseline-model.mat')
    clc
end
