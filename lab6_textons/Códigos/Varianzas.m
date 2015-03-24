%Calcula las varianzas de las respuestas para los diferentes filtros sbre
%las imagenes. Se usa para ver cual filtro es mas representativo
for j=1:length(textons)
    [~, tamano]=size(textons{j});
    for i=1:tamano
        varianza{j}(1,i)=var(textons{j}(:,i));
        [~, filtroMasDiscriminativo{j}]=max(varianza{j});
    end
end
