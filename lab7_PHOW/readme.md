# PHOW Classification

## Setup

For this lab you will use the [vl_feat](http://www.vlfeat.org/index.html) library. We provide a download for the libray including the example dataset from

http://157.253.63.7/vlfeat-0.9.20.zip

After downloading and uncompressing the folder, open matlab and run the following command

```matlab
run('VLFEATROOT/toolbox/vl_setup')
```

For more information see [vl_feat matlab toolbox installation](http://www.vlfeat.org/install-matlab.html).

## Example

During this lab you will use dense-sift descriptors for image recognition in the caltech 101 database (see [vl_feat appliactions](http://www.vlfeat.org/applications/apps.html) ). The procedure is illustrated in the [phow_caltech101](http://www.vlfeat.org/applications/caltech-101-code.html) script. 

Analyze the script and understand very well what it does. Run it using checkpoints to further see how it works. Notice the flow is very similar to the one used with textons in the previous lab. After the script is done take a close look at the results and interpret them. Finally, use the trained model to classify new images.

## Exercise

Use the techniques illustrated in the example to train and test a classifier in a subset of the [image-net](http://www.image-net.org) database. 

- http://157.253.63.7/imagenet_small.tgz 
- ssh: ``vision@157.253.63.7:datos1/vision/images/imagenet_small.tgz``

Notice this is a large file (~11GB), so it would be best to download it using ``wget`` or using ``rsync`` with the ``-P``switch. You may also experience problems extracting the data with graphical tools. 

Adapt the script from the example to work on this new dataset. What performance do you get? How does it compare to the results from caltech-101? Can you guess what causes the differences?

Using all the 996 categories will require significant amount of memory, and you possibly won't be able to try the full problem at the lab. 

Also, experiment with the script to try to find out the following

- How does the problem changes when the number of categories increases?
- How does the problem changes when the size of the training set changes?
- How does the problem changes when the spatial paritioning changes (``conf.numSpatialX``)?

Answer all questions from the following points of view

- Performance of the classifier (in test and training)
- Computational resources needed

Don't just say *"it improves"*; explain how much it improves. Is it linear? Is it significant? Where are the computing resources being used? What are the practical implications? What are the costs and the benefits? 

## Report

In addition to the source code used in the above exercise, you should upload a report (using the LaTeX style) containing the following points

- Description of the database
- Description of the recognition method (focus on the adjustments you made to adapt it to the database)
- Training and test results
- Discussion of the results
- Discussion on the effecs of
  - number of categories 
  - size of training set
  - number of spatial partitions
- Limitations of the method
- Possible improvements


## Bonus

You will apply the method illustrated in the script mentioned above to a new data-set. You will be given an additional set of test images without labels. You should upload your estimation of the labels for the test images to sicua. 
http://guainia.uniandes.edu.co/imagenet_test_tiny.tar

You should upload a ``csv`` file where each line contains the name of the image, a comma, and the name of the label. The names of the labels should match those in the training data-set. For example one line could look like this

 ```csv
 fu5dZ5X3py25685ydvJZ9tMtY08=,hot_pot
 ```

After uploading the labels to sicual, we will compare it to the ground truth for the test dataset and give you the confussion matrix. Notice that you will only be able to submit results once.

The *three* submission with more correct labels will win a surprise bonus!

Notice we will need to reproduce your results by running your code again (you can upload the code after the contest ends):
- Make sure to set the seed for the random generator
- Don't use any external data

You may improve the classifier using the techniques seen in class.


##Due date
April 5, 2016; 8:00 a.m.

