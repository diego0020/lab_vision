# Berkeley Segmentation Data Set and Benchmarks 500 (BSDS500)

## Source

This lab uses resources from the 
[Berkley Computer Vision Group](http://www.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html)
Please look at this page.

## Download data

The data for this lab can be downloaded from the following mirrors in the university

- Guainia, http: http://guainia.uniandes.edu.co/BSR_full.tgz
- Guitaca, ssh: ``scp vision@guitaca.uniandes.edu.co:/home/vision/BSR_full.tgz .``

The original source can be found in the Berkley group page.

**Note**: Don't add any of these files to your repository, they are too large.

## Data description

The folder will contain the following direcotries

- bench: Code for running benchmarks and comparing algorithms
- BSD500: 
  -   Data: Images and manual segmentations (ground truth)
  -   ucm2: Precalculated results of the *Ultrametric Contour Map* segmentation algorithm,
-   Documentation: Paper describing the UCM algorithm
-   Grouping: The UCM algorithm implementation

## Ground truth data

The ground truth data is saved as matlab data, it contains manual segmentation from different people. For example,
to look at the ground truth for image ``train/22090`` we can use the following code

```matlab
load('BSDS500/data/groundTruth/train/22090.mat')
% Load segmentation from first human
segm=groundTruth{1}.Segmentation;
image(segm)
colormap colorcube

% create a new figure
figure
% Boundaries from first human
bound=groundTruth{1}.Boundaries;
image(bound)
colormap flag
```

Look at the ground truth data for the different human participants, and different images.

## Benchmark

**Warning:** The mex files required are not available for windows

The file ``bench/test_benchs.m`` contains several examples of how to use the benchmark functions for different types of *results* images. Look at it and run the examples.

Look at the files the define the function ``boundaryBench`` and read the description of inputs.

# Homework

## Implement a segmentation method

Implement your own segmentation method using what you have learned in class. It should be a matlab function with the following signature

```matlab
function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering method, number of clusters)
```
Where

- feature_space : 'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy', 'textons', 'textons+xy'
- clustering_method = k-means, gmm or hierarchical.

Use only the ``train`` and ``eval`` datasets to calibrate your function. See http://www.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html#bsds500 for more information.

## Test your function

Run a contour benchmark on two cases of your function, and compare it to the UCM algorithm. Use the ``test`` data set of the BSDS500. The final plot should contain at least three lines (two instances of your function and the UCM algorithm).
See http://www.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html#bench for an example otuput.

## Report

Write a small report describing your method, the testing methodology and the results. Use te LaTeX template from the second lab. Upload to your repository the report and the code for your segmentation function.
