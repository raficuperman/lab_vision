# Introduction to Images in Matlab

## Setup

1.  Start the virtual machine
2.  Clone the original lab vision repository

    ```bash
    git clone https://github.com/diego0020/lab_vision.git lab_vision_orig
    ```
3.  Clone your fork from the repository

    ```bash
    git clone https://github.com/<USER>/lab_vision.git lab_vision
    ```
4.  Copy the folder lab2_matlab to your repository

    ```bash
    cp -rf lab_vision_orig/lab2_matlab lab_vision
    ```
5.  Delete the original repository from your machine

    ```bash
    rm -rf lab_vision_orig
    ```
6.  Commit changes to your repository

    ```bash
    cd lab_vision
    git status
    git add *
    git commit -m "added matlab lab"
    ```
7.  Push changes

    ```bash
    git push
    ```    
8.  Download and uncompress the sipi_images misc folder in your home folder

    ```bash
    cd ~
    scp -r vision@guitaca.uniandes.edu.co:/home/vision/sipi_images/misc.tar.gz .
    # alternative
    # wget http://sipi.usc.edu/database/misc.tar.gz
    tar -xzf misc.tar.gz
    ```    
9.  Open matlab

    ```bash
    /usr/local/MATLAB/R2014b/bin/matlab
    ```

Note: On windows you can use [github for windows](https://windows.github.com/) or [git-scm](http://git-scm.com/)

**IMPORTANT**
This file contains questions, you should write your answers here and don't forget to **commit** and **push** to
your github account.

## Working directory

The following commands can be used inside matlab, just like in bash

    -   pwd
    -   ls
    -   cd

For more file system see http://www.mathworks.com/help/matlab/file-operations.html

Note the current directory is also shown at the top of the graphical interface

1.  Change to the *misc* directory, which contains the uncompressed sipi_images
2.  List the contents of the directory

## Reading Images

The [imread](http://www.mathworks.com/help/matlab/ref/imread.html) command is used in matlab to read images. 

1.  Look at the manual page for the command
2.  Read the ``5.1.12`` image
    
    What is the dimension of the output?

    >   256x256

3.  Read the ``4.2.03`` image
    What is the dimension of the output?

    >   512x512x3

## Displaying Images

The following commands can be used for displaying images

-   [image](http://www.mathworks.com/help/matlab/ref/image.html)
-   [imshow](http://www.mathworks.com/help/images/ref/imshow.html)

1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
3.  What are the differences?

    >   El comando imshow muestra la imagen tal cual, mientras que el comando image muestra la imagen con los ejes verticales y horizontales a la izquierda y abajo de la imagen respectivamente, mostrando así una aproximación visual a la posición de cada píxel. Imshow muestra la imagen como imagen, mientras que image considera a la imagen como una matrix y la muestra como imagen (por eso los ejes). Al maximizar la ventana la imagen mostrada en imshow mantiene la forma y la proporción; mientras que con image la imagen se distorsiona perdiendo la proporción.

## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg
3.  Write a matlab function that takes the path of an image and converts it to jpg
    > La función creada se llama ConvertToJPG

## Matlab and the shell

### Shell from Matlab

It is possible to excecute bash commands from matlab by using the [system](http://www.mathworks.com/help/matlab/ref/system.html) command
or by using a [bang](http://www.mathworks.com/help/matlab/matlab_env/run-external-commands-scripts-and-programs.html)

1.  Look at the manual pages
2.  Try it (for example ``!ps``)

### Matlab from the shell

It is also possible to invoke matlab in a non interactive mode to run a script from the terminal. If the matlab
binary is on the system PATH you can do something like this

```bash
matlab -nodisplay -nosplash -r "write_jpg('boat.512.tiff'); exit"
# or
matlab -nodisplay -nosplash script.m"
```
If the command or script doesn't end in ``exit`` the matlab shell will stay open, and will block the bash script.

### Exercise

1.  Create a script for converting all tiff images to jpeg
    -   You may create a bash script that calls matlab
    -   Or a matlab script that calls bash 
    -   Or both
2.  Save this script in the matlab lab folder of your git repository
    > El script creado se llama convertirTodasAJPG.m

## Filters

### Adding noise

The [imnoise](http://www.mathworks.com/help/images/ref/imnoise.html) command can be used to add noise to images.
We can do this to simulate difficult capture conditions, and evaluate the algorithms over difficult situations.

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)
3.  Try saving noisy images as jpg, what happens?

    > La imagen se guarda en ese formato, pero al acercar la imagen y ver en detalle, se observa que se pierde resolución en la .jpg en comparación a la .tiff, ya que al acercar la .jpg se pixela bastante la imagen, pareciendo que tuviera más ruido que el que realmente tiene.

### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html)
    and apply it with [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) 
-   To apply a median filter use the function [medfilt2](http://www.mathworks.com/help/images/ref/medfilt2.html)

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > El filtro mediana es mejor para remover ruido tipo sal y pimienta.

For more on noise removal read http://www.mathworks.com/help/images/noise-removal.html

### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html).

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > Como el filtro promedio le asigna el mismo peso a todos los píxeles de la ventana en el cálculo del nuevo valor central, a medida que la ventana de este filtro es mayor, la imagen se ve más borrosa (mayor blur) que con un filtro de menor tamaño. Los filtros gaussianos le asignan un mayor peso al píxel central y peso menor a los píxeles más alejados del centro de la ventana; por lo tanto si sólo se modifica el tamaño de la ventana sin modificar el sigma de esta, dos filtros gaussianos de diferentes tamaños causarán casi el mismo efecto sobre la imagen, ya que los píxeles más alejados del centro no actuarán casi sobre el filtrado (como si no hicieran parte de la ventana). Para ver el cambio entre dos tamaños de ventanas para filtros gaussianos es necesario tener en cuenta también el sigma de estos. 

### Sharpen

The [imsharpen](http://www.mathworks.com/help/images/ref/imsharpen.html) function lets us sharpen an image. 

1.  Sharp the ``5.1.12`` image. What do you notice?

    > Al hacerle imsharpen a la imagen esta se ve más nítida, como si los bordes fueran un poco más claros que la versión anterior. Se reduce el "blur" de la imagen

2.  Sharp a blurred image. What do you notice?

    > Como era de esperar, al hacerle imsharpen a la imagen borrosa, esta vuelve a recuperar un poco sus contornos, haciendo que sea un poco menos borrosa.

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Aunque los dos detectan de manera satisfactoria los bordes de una imagen, los bordes encontrados con sobel parecen ser más claros que los encontrados con prewitt. La imagen generada con sobel tiene bordes más marcados, ya que la ventana que se utiliza le da un mayor peso (en magnitud) a los píxeles de arriba y abajo del píxel central que a los que se encuentran de manera diagonal a ese píxel. En el caso de prewitt los píxeles diagonales y los de arriba y abajo al píxel central tienen el mismo peso (en magnitud).  (Lo anterior es para detección de bordes horizontales; para verticales es lo mismo pero con los píxeles de derecha e izquierda del píxel central).

More sophisticated methods for finding edges can be found in the following pages
    -   http://www.mathworks.com/discovery/edge-detection.html
    -   http://www.mathworks.com/help/images/ref/edge.html

### More

For more filtering operations look at http://www.mathworks.com/help/images/linear-filtering.html

## Color Spaces

As seen on the section on reading image, color images are represented by matrices with 4 dimensios.
The [color](http://www.mathworks.com/help/images/color.html) matlab module contains functions for moving between
color spaces.

1.  Load the ``4.2.03.tiff`` image (Mandril).
2.  Split it into the three color channels
    
    ```matlab
    img=imread('4.2.03.tiff');
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    ```
3.  Look at the three channels simultaneusly

    ```matlab
    figure;
    subplot(2,2,1), subimage(img);
    subplot(2,2,2), subimage(r);
    subplot(2,2,3), subimage(g);
    subplot(2,2,4), subimage(b);
    ```
    
4.  Save the mosaic as a png file
    
    ```matlab
    print ('-dpng','rgb_mosaic.png');
    ```
5.  Transform the image to the following color spaces and repeat the exercise
    -   ycbcr
    -   lab (usé el código RGB2Lab que encontré en internet, ya que mi Matlab no tiene esa función. Subí este código a GitHub)
    -   hsv (use [rgb2hsv](http://www.mathworks.com/help/matlab/ref/rgb2hsv.html))

6.  Save all the mosaics in your github repository

## Pyramids

The [impyramid](http://www.mathworks.com/help/images/ref/impyramid.html) function creates gaussian pyramids from an image.

1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image
3.  At what level does the people in the picture dissappear?

    >   En el segundo nivel (siendo el primer nivel la imagen original) ya cuesta bastante diferenciar las personas en la fotografía.
    
4.  At what level does the numbers in the clock disappear?

    >   En el tercer nivel (siendo el primer nivel la imagen original) los números del reloj ya no se alcanzan a ver.

## Template Matching

The [norm2corrx](http://www.mathworks.com/help/images/ref/normxcorr2.htm) can be used to look for patterns in an image.

1.  Download the ``sequences.tar.gz`` file (from guitaca or sipi) and decompress it
2.  Go to the sequences directory
3.  Read the ``motion04.512.tiff`` image
4.  Use the ``imcrop`` comand to crop the train at the right side of the figure
    
    ```matlab
    [train,square] = imcrop(image);
    ```
5.  Now use [normxcorr2](http://www.mathworks.com/help/images/ref/normxcorr2.htm) to locate the train back in the image

    ```matlab
    c=normxcorr2(train,image);
    % c is correlation from -1 to 1
    [sx,sy] = size(image);
    d=floor(size(train)/2);
    dx=d(1);
    dy=d(2);
    %Remove borders from c2 to make it the same size as image
    c2=c(dx+1:sx+dx,dy+1:sy+dy);
    %lets accentuate it more
    c3=c2.^3;
    %convert it into an image from 0 to 1
    cr=0.5+0.5*c3;
    %leave the original image as the luminance channel
    y=mat2gray(image);
    %empty cb channel
    cb=0.5*ones(size(image));
    %join the three channels
    ycbcr=cat(3,y,cb,cr);
    rgb=ycbcr2rgb(ycbcr);
    imshow(rgb);
    ```
6.  Explain what the above code does

    > Lo primero que hace el código es calcular la cross-correlación normalizada entre el tren (que fue recortado antes) y la imagen original. De esta manera se obtiene un mapa donde el valor más altos corresponde al sitio de mayor correspondencia entre las dos imágenes. Luego encuentra el tamaño de la imagen original y el tamaño del recorte del tren (lo divide entre dos y redondea el resultado hacia abajo). Como la imagen (o mapa) de cross-correlación generada es de mayor tamaño a la imagen original, el comando c2=c(dx+1:sx+dx,dy+1:sy+dy) recorta este mapa para que sea del mismo tamaño que la imagen original. Después se acentúa este mapa, de tal modo que se evidencie aún más el sitio de mayor correspondencia entre las dos imagenes. El mapa de cross-correlación es entre -1 y 1, por lo cual se convierten los valores para que queden entre 0 y 1 (este es el canal cr). Se toma luego la imagen original en escala de grises (este es el canal Y) y se crea una matriz del tamaño de la imagen original con todos los elementos de valor 0,5 (este es el canal cb). Se juntan estos tres canales, con lo que se obtiene una imagen en codificación YCbCr. Se convierte esta imagen a RGB y se visualiza, con lo que se puede encontrar el tren recortado en la imagen. 
    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?

    > Las limitaciones del método de template matching se basan en que la cross-correlación necesita que el recorte tenga una correspondencia perfecta (o casi) con la parte de la imagen que se desea. Por tal modo, se necesita tener un recorte de lo que se desea encontrar con anterioridad. Además, el objeto a buscar debe ser del mismo tamaño (o muy cercano) tanto en el recorte como en la imagen original, junto con su orientación y color. Es sumamente sensible al ruido, ya que si hay ruido en la imagen pero no en el recorte (o viceversa), la correspondencia no puede ser la deseada.

See [here](http://www.mathworks.com/help/images/examples/registering-an-image-using-normalized-cross-correlation.html)
another example.

## End

Don't forget to commit and push your answers and images to github
