# Lab 8: Convolutional Neural Networks

Based on [VGG Convolutional Neural Networks Practical](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html)

This lab makes use of [vl-feat](http://www.vlfeat.org/matlab/matlab.html) and [MatConvNet](http://www.vlfeat.org/matconvnet/functions/).

## 0. Setup

The data and code for this lab can be downloaded from [the course server](http://157.253.63.7/practical-cnn-2015a.tar.gz)
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
- Test it on a random image

## 4. Homework

The file [textonsdb](http://157.253.63.7/textonsdb.tgz),
also available in sicua, contains a database based on the textures from [lab6](https://github.com/diego0020/lab_vision/tree/master/lab6_textons). In this case we took 25 random *128x128* patches from each image in the train set in order to create a set of 18750 training images.  

Based on the fonts classification CNN ([Part 4](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part-4-learning-a-character-cnn) of the practical), design a network appropriate for classifying this new dataset. 

You will need to **upload to git-hub**:

- A matlab source file containing the description of the network (similar to ``initializeCharacterCNN.m``). At the start of each layer include a comment indicating the size of the input.
- A function for sampling the images with jitter during training.
- A function for training your network.
- A function for testing your network. This function should have the following signature
  
  ```matlab
  function res=train_net(net ,test_data)
  ```
  where ``net`` is your trained network, ``testdata`` is a *128x128xK* matrix containing the test data, and ``res`` is a vector of length *K* that contains the numerical labels of the predicted classes.

- A markdown file with:
  - A brief (one or two paragraph) description of your network, and the intuition behind each layer. Why are you proposing this architecture? 
  - The results of your own tests on the network, indicate the time it took to train, and the results you got on the training and validation sets

We will also train and test your network on one of our computers. You will be assigned a maximum of 1 hour of machine time to train. After this time we will kill the process, so be sure your training function saves intermediate results at each step. If your network is too complex it will not be succesfully trained in the allowed time. 

If everything runs smoothly, and the description of your network is sound, you will get a five.

## Bonus

The 4 networks that achieve the best performance will receive 5 extra points for the lab grade. The final grade of the lab will be the sum of the grades of each lab, plus bonus points, all divided by the number of labs.

## Due Date:
Tuesday 14 of April, 2015 at 11:00 a.m.

## Note

If you think you can apply CNN to your final project, you should do the full practical.

## Additional Resources

- http://neuralnetworksanddeeplearning.com/
- http://benanne.github.io/2015/03/17/plankton.html
- https://www.udacity.com/course/deep-learning--ud730
  - https://www.udacity.com/course/viewer#!/c-ud730/l-6377263405/m-6406301756
- https://developer.nvidia.com/deep-learning-courses
- http://danielnouri.org/notes/2014/12/17/using-convolutional-neural-nets-to-detect-facial-keypoints-tutorial/
