function [  ] = convertToJPG( Direccion )
%ConvertToJPG Convierte la imagen determinada por la dirección ingresada a
%formato jpg. 
%Ejemplo: convertToJPG( 'C:\Users\r.cuperman675\Downloads\misc\7.1.01.tiff' )

[~,name,~] = fileparts(Direccion);
I=imread(Direccion);
imwrite(I,strcat(name,'.jpg'));

end

