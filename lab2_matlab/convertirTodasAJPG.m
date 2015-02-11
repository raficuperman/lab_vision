%Se debe estar primero en la carpeta donde se encuentran las imagenes para
%correr este código y tener guardada la función convertToJPG ahí mismo
%además
imagenes=dir('*.tiff');
cantidadImagenes=length(imagenes);
for i=1:cantidadImagenes
    convertToJPG(imagenes(i).name);
end

