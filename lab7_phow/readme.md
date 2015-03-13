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

You will apply the method illustrated in the script mentioned above to a new data-set. You will be given train images with ground truth and test images. You should upload your estimation of the labels for the test images to sicua. In other words, you will *not* have access to the ground truth data for test images. Also notice only your final submission will be taken into account. Also you should upload the source code for training your model and generating the labels to github. Finally you should write a report explaining how you applied your method to this dataset (more details below).  

Some tips:

- Notice the database can have more than one object per image, you need to indicate all the objects you find in each image
- Leave a subset of the training data for *validation*
- Adjust the scale, grid density, number of words and other parameters to this new dataset.



## Report
