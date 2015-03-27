clear all
close all 
clc
global conf
%conf.numTrain = 50 ;
%conf.numTest = 50 ;
%conf.numClasses=5;
clases=[5, 10, 15, 20, 30, 50, 80, 100, 150];
for i=1:length(clases)
    tic
    conf.numTrain = 20 ;
    conf.numTest = 20 ;
    conf.numClasses = clases(i);
    phow_imagenet_tiny();
    tiempo=toc
    print ('-dpng', sprintf('Resultados_%gclases_%gtrain_%gtest.jpg',clases(i),conf.numTrain, conf.numTest))
    save(sprintf('tiempo_%gclases_%gtrain_%gtest.mat',clases(i),conf.numTrain, conf.numTest), 'tiempo')
    close all
    delete('data/baseline-hists.mat')
    delete('data/baseline-result.mat')
    delete('data/baseline-vocab.mat')
    delete('data/baseline-result.ps')
    delete('data/baseline-model.mat')
    clc
end
