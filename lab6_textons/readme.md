# Lab 6 - Textons and classifiers

In this lab you will create code to represent images using textons and train and test a classifier. 
Try to create good quality code so that you can reuse it in the following labs.

## Database

The database for this lab comes from the [ponce group](http://www-cvr.ai.uiuc.edu/ponce_grp/data/)

You can download it from the following mirrors in the university

    -   http:
    -   ssh:

    
## Representation

To *lib* foder contains functions that can be used to represent images as textons. 
The ``example.m`` file shows how to use them. 

For each of the following functions, used in the example, describe what they do, what are their inputs, and what are their outputs

    -   fbCreate
    -   fbRun
    -   computeTextons
    -   assignTextons

    >> Answer

## Classification

After images are represented as a dictionary of textons, train and test a classifier using the above database. Try two different kinds of classifiers:

    -   Nearest neighbour: Use intersection of histograms or Chi-Square metrics (see [opencv-histograms](http://docs.opencv.org/modules/imgproc/doc/histograms.html#comparehist) 
        for more information.
    -   Random forest: Use the matlab [tree bagger](http://www.mathworks.com/help/stats/treebagger.html) function. See an example at [kawahara.ca](http://kawahara.ca/matlab-treebagger-example/)

Train both classifiers and with images in the *train* directory and test them once with images in the *test* directory. From the test results calculate the confusion matrix. 

## Report

The report for this laboratory should include

    -   Description of the method and filters used for representing the images
    -   Small (one paragraph) description of the database
    -   Small (one paragraph for each one) description of the classifiers and the distance metrics
    -   Results
    -   Discussion of the results
        -   Which classifier works best?
        -   Which categories cause the most confusion?
        -   What are the limitations of the method?
        -   What are the limitations of the database?
        -   How could the method be improved?

The functions created during this lab will be used again, so try your best to make them reusable.         
        