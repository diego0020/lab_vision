# Lab 6 - Textons and classifiers

In this lab you will create code to represent images using textons and afterwards train and test a classifier. 
Try to create good quality code so that you can reuse it in the following labs.

## Database

The database for this lab comes from the [ponce group](http://www-cvr.ai.uiuc.edu/ponce_grp/data/)

You can download it from the following mirrors in the university

-   http: http://157.253.63.7/textures.tar.gz
-   ssh: ``vision@157.253.63.7:/home/vision/images/textures.tar.gz``

    
## Representation

To *lib* foder contains functions that can be used to represent images as textons, and
the ``example.m`` file illustrates how to use them. 

For each of the following functions, used in the example, find what they do, what are their inputs, and what are their outputs.

    -   fbCreate
    -   fbRun
    -   computeTextons
    -   assignTextons

Use ``computeTextons`` to create a set of descriptors appropriate for the database. Remember that at this stage you may only use images in the *train* folder.
    
## Classification

After images are represented as a dictionary of textons, train and test a classifier using the database. Notice that the images in the mirrors are already divided in train and test sets. This was done by randomly picking 10 images from each category to test. Try two different kinds of classifiers:

-   **Nearest neighbour:** Use intersection of histograms or Chi-Square metrics (see [opencv-histograms](http://docs.opencv.org/modules/imgproc/doc/histograms.html#comparehist) 
    for more information).
-   **Random forest:** Use the matlab [tree bagger](http://www.mathworks.com/help/stats/treebagger.html) function. See an example at [kawahara.ca](http://kawahara.ca/matlab-treebagger-example/)

Train both classifiers with images in the *train* directory and test them once with images in the *test* directory. Calculate the confussion matrix for training and test datasets. 

## Report

The report for this laboratory should include

-   Small (one paragraph) description of the database
-   Description of the method and filters used for representing the images
    -   How did you create the dictionary?
    -   How many textons are you using? Why?
    -   What filters discriminate the most?
-   Description of the classifiers and the distance metrics
    -   What parameters are you using ? Why?
    -   What adjustments did you apply to the data?
-   Results
-   Discussion of the results
    -   Which classifier works best?
    -   How much time it takes to train and apply both kinds of classifiers?
    -   Which categories cause the most confusion?
    -   What are the limitations of the method?
    -   What are the limitations of the database?
    -   How could the method be improved?

The functions created during this lab will be used again, so try your best to make them reusable.         

**Due date:** March 31, 2015; 8:00 a.m.
