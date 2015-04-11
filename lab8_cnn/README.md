# Lab 8: Convolutional Neural Networks

Based on [VGG Convolutional Neural Networks Practical](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html)

## 0. Setup

The data and code for this lab can be downloaded from


## 1. Creating CNN

Read throug [Part 1](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part1) of the practical.

Understand the different types of layers and what they do

- Convolution filters
- non-linear gating
- pooling
- normalisation

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

Based on the fonts classification from [Part 4](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html#part-4-learning-a-character-cnn) of the practical, design a CNN that could be used in the textures database from [lab 6](https://github.com/diego0020/lab_vision/tree/master/lab6_textons). **There is no need to train the network.** Be sure to also create an adequate ``load_batch_with_jitter`` function. 
Submit your network description and auxiliary functions using sicua.

## 5. Bonus

We will train and test your functions. Each one will be given a maxium of 10 hours of machine time to train. The 4 networks that achieve the better performance will win a bonus grade.

## Note

If you think you can apply these techniques to your project, you should do the full practical.
