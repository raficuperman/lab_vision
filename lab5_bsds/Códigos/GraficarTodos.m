%Graficar juntos
clear all
close all
addpath ('bench/benchmarks')
h=open('isoF.fig');
hold on
plot_eval('ResultadosHierarchical','r')
hold on
plot_eval('ResultadosKMeans','b')
hold on
plot_eval('BSDS500/ucm2/test_eval','k');
legend('Humano (F=0.79)','Curvas','Hierarchical+lab (F=0.55)','KMeans+lab (F=0.51)','UCM (F=0.76)','Location','SouthWest')