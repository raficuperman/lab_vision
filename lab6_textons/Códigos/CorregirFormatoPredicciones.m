%Corregir formato predicciones por Random Forest (Vienen en cell, tienen
%que ser double)
for i=1:length(etiquetas)
   prediccionArbol(i,1)=str2double(etiquetas{i}); 
end