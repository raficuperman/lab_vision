%Generar precision-recall para kmeans
addpath ('bench/benchmarks')
clear all;close all;clc;


imgDir = 'BSDS500/data/images/test';
gtDir = 'BSDS500/data/groundTruth/test';
pbDir = 'Segmentacion_hierarchical_lab';
outDir = 'ResultadosHierarchical';
mkdir(outDir);

nthresh = 7; % note: the code changes this to the actual number of segmentations
tic;
boundaryBench(imgDir, gtDir, pbDir, outDir, nthresh);
toc;