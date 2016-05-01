# Lab 8: Convolutional Neural Networks

Based on [VGG Convolutional Neural Networks Practical](http://www.robots.ox.ac.uk/~vgg/practicals/cnn/index.html)

This lab makes use of [vl-feat](http://www.vlfeat.org/matlab/matlab.html) and [MatConvNet](http://www.vlfeat.org/matconvnet/functions/).

## 0. Setup

The data and code for this lab can be downloaded from [the course server](http://157.253.63.7/practical-cnn-2015a2.tgz)
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
  function res=test_net(test_data)
  ```

- A markdown file with:
  - A brief (one or two paragraph) description of your network, and the intuition behind each layer. Why are you proposing this architecture? 
  - The results of your own tests on the network, indicate the time it took to train, and the results you got on the training and validation sets

We will also train and test your network on one of our computers. You will be assigned a maximum of 1 hour of machine time to train. After this time we will kill the process, so be sure your training function saves intermediate results at each step. If your network is too complex it will not be succesfully trained in the allowed time. 

If everything runs smoothly, and the description of your network is sound, you will get a five.


## Due Date:
Tuesday 14 of April, 2015 at 11:00 a.m.

## Bonus

The 4 networks that achieve the best performance will receive 5 extra points for the lab grade. The final grade of the lab will be the sum of the grades of each lab, plus bonus points, all divided by the number of labs.

You should submit at least two functions, in order to normalize the contest there will be some additional specifications:

- A function for training your network. This function should have the following signature
  ```matlab
  function train_net(textonsdb, use_gpu)
  ```
  ``textonsdb`` is the structure containing the database used for training and validation. ``use_gpu`` is a boolean, if true the net should be trained using the gpu. Notice this functions does not return anything. It should save the results of training to test (more information below).
- A function for testing your network. This function should have the following signature
  ```matlab
  function res=test_net(test_data)
  ```
  ``testdata`` is a *128x128xK* matrix containing the test data, and ``res`` is a vector of length *K* that contains the numerical labels of the predicted classes.
  
Additional restrictions

- All functions should be in a single directory. They will be executed from this directory.
- Save all intermediate results in this directory. **Don't use absolute paths**. 
- The training function will be run for an hour, afterwards it will be killed with SIGKILL. Therefore the function should save intermediate results to disk.
- You may choose to do data augmentation online, or offline before starting to train the net. However time starts as soon as the ``train_net`` functions is called, and no functions can be called before. Therefore if you prefer to do data augmentation offline, you have to do it in the first part of the ``train_net`` function.
- The test function should read the last trained version of the net and use it to predict the labels for the test data.
- The ``vl_setup`` and ``vl_setupnn`` will be called before calling your function. The ``matconvnet\examples`` directory will also be in the path before calling your functions. Don't call *setup* nor any of the *vl_setup* functions.
- The library version will be the one included in the practical (downloadable from [here](http://157.253.63.7/practical-cnn-2015a2.tgz)).
- Matlab version is 2014b.
- Output of ``gpuDevice()``:

  ```matlab
    >> gpuDevice()
    
    ans = 
    
      CUDADevice with properties:
    
                          Name: 'Tesla K20c'
                         Index: 1
             ComputeCapability: '3.5'
                SupportsDouble: 1
                 DriverVersion: 6.5000
                ToolkitVersion: 6
            MaxThreadsPerBlock: 1024
              MaxShmemPerBlock: 49152
            MaxThreadBlockSize: [1024 1024 64]
                   MaxGridSize: [2.1475e+09 65535 65535]
                     SIMDWidth: 32
                   TotalMemory: 5.0327e+09
               AvailableMemory: 4.9167e+09
           MultiprocessorCount: 13
                  ClockRateKHz: 705500
                   ComputeMode: 'Default'
          GPUOverlapsTransfers: 1
        KernelExecutionTimeout: 0
              CanMapHostMemory: 1
               DeviceSupported: 1
                DeviceSelected: 1

  ```
  
- The *train_net* function will be called using a script similar to

  ```matlab
  % setup vl_feat and matconvnet
  setup;
  textonsdb = load('textonsdb2.mat');
  cd(working_dir);
  train_net(textonsdb, true);
  ```
- The *test_net* function will be called using a script similar to

  ```matlab
  % setup vl_feat and matconvnet
  setup;
  testdata = load('testdata.mat');
  cd(working_dir);
  res=test_net(testdata.images);
  score = sum(res == testdata.labels)/size(testdata.labels,1);
  display(score)
  ```


## Bonus Due Date:
Monday 9 of May, 2016 at 11:00 a.m.

## Note

If you think you can apply CNN to your final project, you should do the full practical.

## Additional Resources

- http://neuralnetworksanddeeplearning.com/
- http://benanne.github.io/2015/03/17/plankton.html
- https://www.udacity.com/course/deep-learning--ud730
  - https://www.udacity.com/course/viewer#!/c-ud730/l-6377263405/m-6406301756
- https://developer.nvidia.com/deep-learning-courses
- http://danielnouri.org/notes/2014/12/17/using-convolutional-neural-nets-to-detect-facial-keypoints-tutorial/
