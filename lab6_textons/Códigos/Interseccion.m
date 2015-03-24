function [ similaridad ] = Interseccion( Hist1, Hist2 )
%Interseccion: mide la similaridad de dos histogramas según el método de
%intersección
if length(Hist1)~=length(Hist2)
   error('Los dos histogramas deben tener la misma cantidad de elementos'); 
end
minimos=zeros(1,length(Hist1));
for i=1:length(Hist1)
    minimos(1,i)=min(Hist1(i),Hist2(i));
    similaridad=sum(minimos(:));
end
end

