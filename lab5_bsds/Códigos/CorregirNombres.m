%Corregir nombres
clear all
close all
clc
addpath('BSDS500/data/images/test')
D=dir('BSDS500/data/images/test/*.jpg');
load('Seg_hierarchical_lab');

for i=1:length(D)
   actual=Seg_hierarchical_lab(i,:);
    [~,name,~]=fileparts(D(i).name);
   save(strcat(name,'.mat'),'actual')
end

beep
pause(1), beep
pause(1), beep