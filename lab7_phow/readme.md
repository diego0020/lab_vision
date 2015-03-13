# PHOW Classification

## Setup

For this lab you will use the [vl_feat](http://www.vlfeat.org/index.html) library. We provide a download for the libray including the example dataset at the following locations

  - http: guainia
  - ssh: guitaca

After downloading and uncompressing the folde, open matlab and change and run the following command

```matlab
run('VLFEATROOT/toolbox/vl_setup')
```

For more information see [vl_feat matlab toolbox installation](http://www.vlfeat.org/install-matlab.html).

## Example

During this lab you will use dense-sift descriptors for image recognition in the caltech 101 database (see [vl_feat appliactions](http://www.vlfeat.org/applications/apps.html) ). The procedure is illustrated in the [phow_caltech101](http://www.vlfeat.org/applications/caltech-101-code.html) script. 

Analyze the script and understand very well what it does. Run it using checkpoints to further see how it works. Notice the flow is very similar to the one used with textons in the previous lab. After the script is done take a close look at the results and interpret them. Finally, use the trained model to classify new images.

## Homework

You will apply the method illustrated in the script mentioned above to a new data-set. You will be given train images with ground truth and test images. You should upload your estimation of the labels for the test images to sicua. In other words, you will *not* have access to the ground truth data for test images. Also you should upload the source code for training your model and generating the labels to github. Finally you should write a report explaining how you applied your method to this dataset (more details below).  

After uploading the labels to sicual, we will compare it to the ground truth for the test dataset and give you the performance results. Notice that you will only be able to submit results once.

Some tips:

- Notice the database can have more than one object per image, you need to indicate all the objects you find in each image
- Leave a subset of the training data for *validation* or use boot-strap techniques.
- Adjust the scale, grid density, number of words and other parameters to this new dataset.
- Feel free to add additional improvements to the algorithm
- Make your code reusable so that you can use it again in other labs and on the final project

## Report

In addition to the labels for the test data and the source code you should upload a report (using the LaTeX style) containing the following points

- Description of the database
- Description of the recognition method (focus on the adjustments you made to adapt it to the database)
- Training and test results
- Discussion of the results
- Limitations of the method
- Possible improvements

**Due date:**  March 27, 2015; 6:00 p.m.
