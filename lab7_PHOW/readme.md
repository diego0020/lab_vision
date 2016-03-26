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

##Due date
April 7, 2016; 8:00 a.m.

## Bonus

Apply the method illustrated in the script mentioned above to a new data-set. You will be given an additional set of test images without labels. You should predict the label for each image and upload your estimation to sicua. You can enter 10 possible labels for each image.

- http://157.253.63.7/imagenet_small_bonus.tgz 
- ssh: ``vision@157.253.63.7:datos1/vision/images/imagenet_small_bonus.tgz``

You should upload a ``text`` file where each line contains the name of the image, a colomn, and the name of the possible labels separated by commas . The names of the labels should match those in the training data-set. For example two lines could look like this

 ```
YzkzYTlmMmY2ODY2MDFkOGJkYTI4ZmQwZjlhYjUzMDAwYzliYThiOQ==.JPEG:harvester,malinois,drumstick,quilt,consomme,Siberian_husky,Band_Aid,otterhound,cicada,espress
OWQ5OGRlYTE5MTEwNDA2MzQ4MWVmZTVmZjA4MWJhNDAyOTJlOTdhOQ==.JPEG:valley,centipede,stinkhorn,lacewing,web_site,perfume,ringlet,Model_T,steel_arch_bridge,white_wolf
 ```

Notice each filename should appear only once. You may enter less than 10 cathegories, but if you enter more we will only consider the first ten.

After uploading the labels to sicual, we will compare it to the ground truth for the test dataset and calculate the percentage of correct guesses. Notice that we will only consider your last submission. This bonus is **individual**.

The *five* submission with more correct labels will win 5 additional points for the lab! The final grade of the lab is calculated as the sum of all labs, plus any bonuses, all divided by the total number of labs.

Notice we will need to reproduce your results by running your code again (you can upload the code after the contest ends):
- Make sure to set the seed for the random generator
- Don't use any external data

You may improve the classifier using the techniques seen in class.

##Bonus date
April 21, 2016; 8:00 a.m.

