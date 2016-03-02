# Hybrid images Report

## Exercise

### Choosen images

The choosen images were *submarine.bmp* and *fish.bmp* as they look like to have been previously aligned.

### Filtering

[imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) was applied to *submarine.bmp* as a low pass filter since this image was more constant than the other one used.

For creating the high-pass filtered image was used *fish.bmp* (this image contained more linear geometric features). On it was applied a low pass filter,and then it was subtracted from the original image by using the given mathematical expression: *Y = X - f(X)*. As this image could contain negative values, this was stretched using *imadjust* Matlab function in order to be able to understand it on the screen. For both low and high filtering was used a gaussian filter with size 20 and sigma 6. 

The [fft](http://www.mathworks.com/help/matlab/ref/fft2.html) and [dct](http://www.mathworks.com/help/images/ref/dct2.html) transforms where applied on

- The original images
- The filter
- The filtered images

in order to observ their frequency and energy variability.

### Summing the images

The hybrid image was composed by adding the two filtered images using the given formula *H = f1(X1) + (X2 - f2(X2) )*

- The full matlab script *MyHybridImageScript.m* used to generate the image was upload to the repository in the *data* folder.
- the final image *HybridImage.bmp* was also uploaded to the repository in the same folder.

### Visualization

In order to simulate how the image will look from different distances a pyramid was built using the *vis_hybrid_image.m* customized matlab function available in [proj1.zip](http://cs.brown.edu/courses/cs143/proj1/proj1.zip):

- first Creating such a visualization for the hybrid image built.
- and then, uploading it to the repository as *PyramidImage.bmp* imagefile in *data* folder.

## Homework

A hybrid image based on own images was created. The best attempt was made in order to be original. The images was cropped and aligned to get a good effect using *gimp* linux software. Finally, the following files were uploaded to the folder repository *MyPhotos*:

- The original used images *IMG_20141225_004002.jpg* (a young relative) and *IMG_20141225_003853.jpg* (his grandma).
- The processed images (bmp converted, cropped and aligned) *GrandmaFace.bmp* and *YoungRelativeFace.bmp* showing only their faces.
- *GrandmaFace.bmp* was used to be high-pass filtered as she is an old woman with some wrinkles and a fairly constant background. *YoungRelativeFace.bmp* was used to be low-pass filtered as his face looks more constant and the background less.
- The final hybrid image *TransGenerationHybridImage.bmp* on which the oldwome can be seen from a very close distance while the young one from far away.
- The pyramid image file *PyramidFacesImage.bmp* showing the efect.
- The customied matlab function *MyHybridImageScriptForFaces.m* used to process the images parameterized in oreder to be able to run it several times. The final version of invocation was:
      *MyHybridImageScriptForFaces(29,7,'YoungRelativeFace.bmp',29,4,'GrandmaFace.bmp',0.8,1);*
