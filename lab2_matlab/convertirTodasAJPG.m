%Se debe estar primero en la carpeta donde se encuentran las imagenes para
%correr este c�digo y tener guardada la funci�n convertToJPG ah� mismo
%adem�s
imagenes=dir('*.tiff');
cantidadImagenes=length(imagenes);
for i=1:cantidadImagenes
    convertToJPG(imagenes(i).name);
end

