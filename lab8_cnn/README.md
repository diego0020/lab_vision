# Lab 8: Convolutional Neural Networks

Based on [VGG Convolutional Neural Networks Practical](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html)

This lab makes use of [vl-feat](http://www.vlfeat.org/matlab/matlab.html) and [MatConvNet](http://www.vlfeat.org/matconvnet/functions/).

## 0. Setup

The data and code for this lab can be downloaded from [guainia](http://guainia.uniandes.edu.co/practical-cnn-2015a.tar.gz)
or from the practical site indicated above.

## 1. Creating CNN

Read through [Part 1](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part1) of the practical.

Understand the different types of layers and what they do

- Convolution filters
- non-linear gating
- pooling
- normalisation

Specifically, try to understand the dimensions of their inputs and outputs. How are they connected? How the data flows accross the network?

## 2. Training CNN

Go through [Part 4](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part-4-learning-a-character-cnn) of the practical.

What is *training with Jitter*?
What are its advantages?
Why it performs so much better?

## 3. Classifying with CNN

Go through [Part 5](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part-5-using-pretrained-models) of the practical. 

- Visualize the model and see the different layers. 
- Test it on the *peppers* image
- Test it on some of the *ImageNET* images from the last lab
- Test it on a random images

## 4. Homework

The file [textonsdb](http://guainia.uniandes.edu.co/textonsdb.mat),
also available in sicua, contains a database based on the textures from [lab6](https://github.com/diego0020/lab_vision/tree/master/lab6_textons). In this case we took 25 random *128x128* patches from each image in the train set in order to create a set of 18750 training images.  

Based on the fonts classification CNN ([Part 4](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part-4-learning-a-character-cnn) of the practical), design a network appropriate for classifying this new dataset. You are NOT required to fully train the network; however make sure it works by running a few training iterations. 

You will need to **upload to Sicua**:

- A matlab source file containing the description of the network (similar to ``initializeCharacterCNN.m``). At the start of each layer include a comment indicating the size of the input.
- A brief (one or two paragraph) description of your network, and the intuition behind each layer. Why are you proposing this architecture?
- A function for sampling the images with jitter during training.
- A function for training your network.
- A function for testing your network. This function should have the following signature
  
  ```matlab
  function res=train_net(net ,test_data)
  ```
  where ``net`` is your trained network, ``testdata`` is a *128x128xK* matrix containing the test data, and ``res`` is a vector of length *K* that contains the numerical labels of the predicted classes.
  
We will train and test your network. You will be assigned a maximum of 4 hours of machine time to train. After this time we will kill the process, so be sure your training function saves intermediate results at each step. If your network is too complex it will not be succesfully trained in the allowed time. Tha machine that we will use has the following specifications:

- 62G of ram
- 24 logical cores, contained in 2 Intel(R) Xeon(R) E5-2620  @ 2.00GHz
- 4 Video Cards:
  - 1 NVIDIA Tesla K20c
  - 3 NVIDIA Quadro K5000
- Matlab 2014b
- Fedora Core 21

You can choose to use GPU accelerated functions or just CPU. If everythin runs smoothly, and the justification of your network is sound, you will get a five.

## Bonus

The 4 networks that achieve the best performance will receive 4 extra points, which can be added to any of your lab grades, or distributed among several grades. 

## Due Date:
Tuesday 21 of April, 2015 at 11:00 a.m.

## Note

If you think you can apply these techniques to your project, you should do the full practical.

## Additional Bibliography

http://neuralnetworksanddeeplearning.com/
http://benanne.github.io/2015/03/17/plankton.html
