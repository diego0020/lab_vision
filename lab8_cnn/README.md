# Lab 8: Convolutional Neural Networks

Based on [VGG Convolutional Neural Networks Practical](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html)

This lab makes use of [vl-feat](http://www.vlfeat.org/matlab/matlab.html) and [MatConvNet](http://www.vlfeat.org/matconvnet/functions/).

## 0. Setup

The data and code for this lab can be downloaded from

http://guainia.uniandes.edu.co/practical-cnn-2015a.tar.gz

or from the practical site indicated above.

## 1. Creating CNN

Read throug [Part 1](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part1) of the practical.

Understand the different types of layers and what they do

- Convolution filters
- non-linear gating
- pooling
- normalisation

Specially try to understand the dimension of their inputs and outputs.

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

The file 

http://guainia.uniandes.edu.co/textonsdb.mat

also available in sicua, contains a database based on the textures from [lab6](https://github.com/diego0020/lab_vision/tree/master/lab6_textons). In this case we took 25 random *128x128* patches from each image in the train set in order to create a set of 18750 training images.  

Based on the fonts classification CNN, [Part 4](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part-4-learning-a-character-cnn) of the practical, design a network appropriate for classifying this new dataset. **There is no need to throughly train the network.** 

You will need to **upload to sicua**:

- A matlab source file containing the description of the network (similar to ``initializeCharacterCNN.m``). At the star of each layer include a comment indicating the size of the input.
- A brief (one or two paragraph) description of your network, and the intuition behind each layer. Why are you proposing this architecture?
- A function for sampling the images with jitter during training.
- A function for training your network
- A function for testing your network. This function should have the following signature
  
  ```matlab
  function res=train_net(net ,test_data)
  ```
  where ``net`` is your trained network, ``testdata`` is a *128x128xK* matrix containing the test data, and res is a vector of length *K* that contains the numerical labels of the predicted classes.
  
We will train and test your functions. Each one will be given a maxium of 4 hours of machine time to train. After the time has passed we will kill the process, so be sure your training function saves intermediate results at each step. If your network is too complex it will not be succesfully trained in the allowed time. Tha machine that we will use has the following specifications:

- 62G of ram
- 24 logical cores, contained in 2 Intel(R) Xeon(R) E5-2620  @ 2.00GHz
- Video:
  - 1 NVIDIA Tesla K20c
  - 3 NVIDIA Quadro K5000
- Matlab 2014b
- Fedora Core 21

We will use the gpu accelerated version of MatConvNet

## Note

If you think you can apply these techniques to your project, you should do the full practical.
