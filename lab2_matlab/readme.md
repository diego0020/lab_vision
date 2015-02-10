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
 imread Read image from graphics file.
    A = imread(FILENAME,FMT) reads a grayscale or color image from the file
    specified by the string FILENAME. If the file is not in the current
    directory, or in a directory on the MATLAB path, specify the full 
    pathname.
    
    The text string FMT specifies the format of the file by its standard
    file extension. For example, specify 'gif' for Graphics Interchange 
    Format files. To see a list of supported formats, with their file 
    extensions, use the IMFORMATS function. If imread cannot find a file 
    named FILENAME, it looks for a file named FILENAME.FMT.
 
    The return value A is an array containing the image data. If the file 
    contains a grayscale image, A is an M-by-N array. If the file contains
    a truecolor image, A is an M-by-N-by-3 array. For TIFF files containing
    color images that use the CMYK color space, A is an M-by-N-by-4 array. 
    See TIFF in the Format-Specific Information section for more
    information.
    
    The class of A depends on the bits-per-sample of the image data,
    rounded to the next byte boundary. For example, imread returns 24-bit
    color data as an array of uint8 data because the sample size for each
    color component is 8 bits. See the Remarks section for a discussion of  
    bitdepths, and see the Format-Specific Information section for more  
    detail about supported bitdepths and sample sizes for a particular
    format.
     
    [X,MAP] = imread(FILENAME,FMT) reads the indexed image in FILENAME into
    X and its associated colormap into MAP. Colormap values in the image 
    file are automatically rescaled into the range [0,1]. 
  
    [...] = imread(FILENAME) attempts to infer the format of the file
    from its content.
  
    [...] = imread(URL,...) reads the image from an Internet URL.  
     
    Remarks
     
    Bitdepth is the number of bits used to represent each image pixel.  
    Bitdepth is calculated by multiplying the bits-per-sample with the 
    samples-per-pixel. Thus, a format that uses 8-bits for each color 
    component (or sample) and three samples per pixel has a bitdepth of 24.
    Sometimes the sample size associated with a bitdepth can be ambiguous: 
    does a 48-bit bitdepth represent six 8-bit samples or three 16-bit 
    samples? The following format-specific sections provide sample size 
    information to avoid this ambiguity.
     
    Format-Specific Information (Listed Alphabetically by Format)
    
    BMP  --  Windows Bitmap
 
    Supported  Compression     Output   
    Bitdepths  None    RLE     Class    Notes
    ---------------------------------------------------------
     1-bit      x        -     logical  
     4-bit      x        x     uint8          
     8-bit      x        x     uint8
    16-bit      x        -     uint8    1 sample/pixel
    24-bit      x        -     uint8    3 samples/pixel
    32-bit      x        -     uint8    3 samples/pixel (1 byte padding)
        
    CUR  -- Cursor File
   
    Supported    Compression      Output
    Bitdepths   None Compressed   Class  
    --------------------------------------------------
    1-bit        x      -         logical
    4-bit        x      -         uint8          
    8-bit        x      -         uint8
    
    Special syntaxes:
    
    [...] = imread(...,IDX) reads in one image from a multi-image icon or 
    cursor file. IDX is an integer value that specifies the order that the
    image appears in the file. For example, if IDX is 3, imread reads the 
    third image in the file. If you omit this argument, imread reads the
    first image in the file. 
  
    [A,MAP,ALPHA] = imread(...) returns the AND mask for the resource, 
    which can be used to determine transparency information.  For cursor 
    files, this mask may contain the only useful data.    
      
    GIF  --  Graphics Interchange Format
    
    Supported     Output Class  
    ---------------------------
    1-bit         logical
    2-to-8 bit    uint8   
    
    Special syntaxes: 
    
    [...] = imread(...,IDX) reads in one or more frames from a multiframe 
    (i.e., animated) GIF file. IDX must be an integer scalar or vector of 
    integer values.  For example, if IDX is 3, imread reads the third image
    in the file.  If IDX is 1:5, only the first five frames are returned.
 
    [...] = imread(...,'Frames',IDX) is the same as the syntax above except
    that IDX can be 'all'.  In this case, all of the frames are read and 
    returned in the order that they appear in the file.
 
    Note: Because of the way GIF files are structured, all of the frames
    must be read when a particular frame is requested. Consequently, it is 
    much faster to specify a vector of frames or 'all' for IDX than to call
    imread in a loop when reading multiple frames from the same GIF file. 
    
    HDF  --  Hierarchical Data Format
      
    Supported   Raster image   Raster image     Output
    Bitdepths   with colormap  without colormap Class    Notes
    ------------------------------------------------------------
     8-bit        x               x             uint8
    24-bit        -               x             uint8   3 samples/pixel
    
    Special Syntaxes:
    
    [...] = imread(...,REF) reads in one image from a multi-image HDF file.
    REF is an integer value that specifies the reference number used to 
    identify the image. For example, if REF is 12, imread reads the image 
    whose reference number is 12. (Note that in an HDF file the reference 
    numbers do not necessarily correspond with the order of the images in
    the file. You can use IMFINFO to match up image order with reference 
    number.) If you omit this argument, imread reads the first image in 
    the file.
      
    ICO  -- Icon File 
    
    See CUR.
    
    JPEG  --  Joint Photographic Experts Group
    
    Note: imread can read any baseline JPEG image as well as JPEG images 
    with some commonly used extensions. 
    
    Supported    Compression      Output
    Bitdepths   Lossy Lossless    Class      Notes
    --------------------------------------------------------
     8-bit        x      x        uint8     Grayscale or RGB
    12-bit        x      x        uint16    Grayscale  
    16-bit        -      x        uint16    Grayscale
    36-bit        x      x        uint16    RGB(Three 12-bit samples/pixel)
 
    JPEG 2000 - Joint Photographic Experts Group 2000
 
    Supported      Compression      Output
    Bitdepths     Lossy Lossless    Class   
    (per sample)
    ----------------------------------------------------------
     1-bit          x      x        logical
     2- to 8-bit    x      x        uint8, int8
     9- to 16-bit   x      x        uint16, int16
 
    Note: Indexed JPEG 2000 images are not supported. Only JP2 compatible
    color spaces are supported for JP2/JPX files.   By default, all image
    channels are returned in the order they are stored in the file.
 
    Special Syntaxes
 
    [...] = imread(..., 'Param1', value1, 'Param2', value2, ...) uses
    parameter-value pairs to control the read operation.  
 
        Parameter name   Value
        --------------   -----
        'ReductionLevel' A non-negative integer specifying the reduction in
                         the resolution of the image. For a reduction 
                         level 'L', the image resolution is reduced by a 
                         factor of 2^L. The default value is 0 implying 
                         no reduction. The reduction level is limited by 
                         the total number of decomposition levels as  
                         provided by 'WaveletDecompositionLevels' field  
                         in the structure returned from IMFINFO function.   
 
        'PixelRegion'    {ROWS, COLS}.  imread returns the sub-image
                         specified by the boundaries in ROWS and COLS.
                         ROWS and COLS must both be two-element vectors
                         that denote the 1-based indices [START STOP]. If
                         'ReductionLevel' is greater than 0, then ROWS and
                         COLS are coordinates in the reduced-sized image.   
 
        'V79Compatible'  A logical value. If true, the image returned is 
                         transformed to gray-scale or RGB as consistent with
                         previous versions of imread (MATLAB 7.9 [R2009b] 
                         and earlier).  Use this option to transform YCC
                         images into RGB.  The default is false.
 
    PBM  --  Portable Bitmap
    
    Supported  Raw     ASCII (Plain)  Output
    Bitdepths  Binary  Encoded        Class
    ----------------------------------------
    1-bit        x        x          logical
       
    PCX  --  Windows Paintbrush
   
    Supported     Output    
    Bitdepths     Class       Notes
    ----------------------------------------------
     1-bit        logical     Grayscale only
     8-bit        uint8       Grayscale or indexed
    24-bit        uint8       RGB (8-bit samples)
     
    PGM  --  Portable Graymap
         
    Supported        Raw      ASCII (Plain)  Output        
    Bitdepths        Binary   Encoded        Class
    ------------------------------------------------
    up to 16-bit      x            -         uint8
    Arbitrary         -            x
     
    PNG  --  Portable Network Graphics
    
    Supported     Output    
    Bitdepths     Class      Notes
    -------------------------------------------
     1-bit        logical    Grayscale only
     2-bit        uint8      Grayscale only
     4-bit        uint8      Grayscale only
     8-bit        uint8      Grayscale or Indexed
    16-bit        uint16     Grayscale or Indexed
    24-bit        uint8      RGB (Three 8-bit samples/pixel)
    48-bit        uint16     RGB (Three 16-bit samples/pixel)
          
    Special Syntaxes:
    
    [...] = imread(...,'BackgroundColor',BG) composites any transparent 
    pixels in the input image against the color specified in BG.  If BG is
    'none', then no compositing is performed. Otherwise, if the input image
    is indexed, BG should be an integer in the range [1,P] where P is the
    colormap length. If the input image is grayscale, BG should be a value
    in the range [0,1].  If the input image is RGB, BG should be a 
    three-element vector whose values are in the range [0,1]. The string
    'BackgroundColor' may be abbreviated.  
  
    If the ALPHA output argument is used (see below), then BG defaults to 
    'none' if not specified by the user. Otherwise, if the PNG file 
    ontains a background color chunk, that color is used as the default  
    value for BG. If ALPHA is not used and the file does not contain a 
    background color chunk, then the default value for BG is 1 for indexed  
    images; 0 for grayscale images; and [0 0 0] for RGB images.  
 
    [A,MAP,ALPHA] = imread(...) returns the alpha channel if one is
    present; otherwise ALPHA is []. If 'BackgroundColor' is specified by
    the user then ALPHA is []. Note that MAP may be empty if the file
    contains a grayscale or truecolor image.    
      
    PPM  --  Portable Pixmap 
    
    Supported        Raw      ASCII (Plain)  Output        
    Bitdepths        Binary   Encoded        Class
    ------------------------------------------------
    up to 16-bit      x            -         uint8
    Arbitrary         -            x     
    
    RAS  --  Sun Raster 
    
    Supported    Output    
    Bitdepths    Class     Notes
    ----------------------------------------------------
     1-bit       logical   Bitmap  
     8-bit       uint8     Indexed
    24-bit       uint8     RGB (8-bit samples)
    32-bit       uint8     RGB with Alpha (8-bit samples)
     
    TIFF  --  Tagged Image File Format
    
    NOTE:  Images with a YCbCr photometric interpretation are converted to
    the RGB colorspace.  
    
    Special Syntaxes:
    
    A = imread(...) returns color data that uses the RGB, CIELAB, ICCLAB,
    or CMYK color spaces.  If the color image uses the CMYK color space, A 
    is an M-by-N-by-4 array.
 
    [...] = imread(..., 'Param1', value1, 'Param2', value2, ...) uses
    parameter-value pairs to control the read operation.  There are three
    different parameters you can use:
 
        Parameter name   Value
        --------------   -----
        'Index'          A positive integer specifying which image to read in
                         a multi-image TIFF file.  For example, if 'Index' is
                         3, imread reads the third image in the file.
 
        'Info'           A structure array; the output of IMFINFO.  When
                         reading images from a multi-image TIFF file, passing
                         the output of IMFINFO as the 'Info' parameter helps
                         imread locate the images in the file more quickly.
 
        'PixelRegion'    {ROWS, COLS}.  imread returns the sub-image
                         specified by the boundaries in ROWS and COLS.  ROWS
                         and COLS must be either two- or three-element
                         vectors.  If two elements are provided, they denote
                         the 1-based indices [START STOP].  If three elements
                         are provided, the indices [START INCREMENT STOP]
                         allow image downsampling.
    
    XWD  --  X Window Dump
    
    Supported                                  Output    
    Bitdepths  ZPixmaps  XYBitmaps  XYPixmaps  Class
    --------------------------------------------------
    1-bit        x          -         x        logical
    8-bit        x          -         -        uint8
 
    Please read the file libtiffcopyright.txt for more information.
 
    Example:
 
        imdata = imread('ngc6543a.jpg');
 
    See also imfinfo, imwrite, imformats, fread, image, double, uint8.

    Reference page in Help browser
       doc imread

2.  Read the ``5.1.12`` image
    
    What is the dimension of the output?

    >   Matriz de 256 x 256

3.  Read the ``4.2.03`` image
    What is the dimension of the output?

    >  512 x  512 x 3

## Displaying Images

The following commands can be used for displaying images

-   [image](http://www.mathworks.com/help/matlab/ref/image.html)
-   [imshow](http://www.mathworks.com/help/images/ref/imshow.html)

1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
3.  What are the differences?

    > image muestra la imagen con coordenadas, como un plot con coordenadas. En cambio imshow muestra la imágen normal con valores de RGB por coordenada.   

## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg
3.  Write a matlab function that takes the path of an image and converts it to jpg

## Matlab and the shell
x=imread('4.2.12.tiff')
imwrite(x,prueba.jpg)

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


matlab -nodisplay -nosplash -r "imwrite(imread('boat.512.tiff'),'prueba.png'); exit"


2.  Save this script in the matlab lab folder of your git repository

  


## Filters

### Adding noise

The [imnoise](http://www.mathworks.com/help/images/ref/imnoise.html) command can be used to add noise to images.
We can do this to simulate difficult capture conditions, and evaluate the algorithms over difficult situations.

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)
3.  Try saving noisy images as jpg, what happens?

    > Answer

### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html)
    and apply it with [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) 
-   To apply a median filter use the function [medfilt2](http://www.mathworks.com/help/images/ref/medfilt2.html)

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > Answer

For more on noise removal read http://www.mathworks.com/help/images/noise-removal.html

### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html).

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > Answer

### Sharpen

The [imsharpen](http://www.mathworks.com/help/images/ref/imsharpen.html) function lets us sharpen an image. 

1.  Sharp the ``5.1.12`` image. What do you notice?

    > Answer

2.  Sharp a blurred image. What do you notice?

    > Answer

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Answer

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
    -   lab
    -   hsv (use [rgb2hsv](http://www.mathworks.com/help/matlab/ref/rgb2hsv.html))

6.  Save all the mosaics in your github repository

## Pyramids

The [impyramid](http://www.mathworks.com/help/images/ref/impyramid.html) function creates gaussian pyramids from an image.

1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image
3.  At what level does the people in the picture dissappear?

    >   Answer
    
4.  At what level does the numbers in the clock disappear?

    >   Answer

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

    > Answer
    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?

    > Answer

See [here](http://www.mathworks.com/help/images/examples/registering-an-image-using-normalized-cross-correlation.html)
another example.

## End

Don't forget to commit and push your answers and images to github
