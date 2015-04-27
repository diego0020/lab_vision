# Optical Flow in Open CV

## Setup

The files for this lab can be downloaded from 

http://guainia.uniandes.edu.co/cv_lab.zip

The compressed folder contains a [winpython](http://winpython.sourceforge.net/) python distribution (sorry, only for windows) with the OpenCV library installed; and the [opencv python2 samples](https://github.com/Itseez/opencv/tree/master/samples).

We will use the [Spyder IDE](https://pythonhosted.org/spyder/), which provides an interface very similar to matlab.
Uncompress the folder, and launch the *Spyder* executable, located at *cv_lab\WinPython-64bit-2.7.9.4\Spyder.exe*. 

<img src="http://wiki.spyderlib.googlecode.com/hg/Screenshots/spyder-windows.png" alt="Spyder IDE">

If you are not familiar with python syntax, at the bottom of this documents you will find links to several *Python for matlab users* documents.

## Samples

During the first stage of the lab we will look at some of the OpenCV Optical Flow Samples

### Dense optical flow

Open the *opt_flow.py* in spyder, and click *Run* (or press F5). By default the program will take input from the web-cam and show you the optical flow. Try moving the camera, or moving objects in front of the camera. Press *1* to toggle the HSV visualization of the optical flow. To exit press the *escape* key. 

In order to run the example with another video, click on *Run->Options* (or press F6). In front of *Command Line options* 
write

``..\data\768x576.avi``

To try it with synthetic data write

``synth:class=chess:bg=../data/lena.jpg:noise=0.1:size=640x480``

Now let's analyze the code



### Lucas-Kanade

## Your turn

## References

### Python for Matlab users

- http://wiki.scipy.org/Tentative_NumPy_Tutorial
- http://www.pyzo.org/python_vs_matlab.html
- http://wiki.scipy.org/NumPy_for_Matlab_Users
- http://bastibe.de/2013-01-20-a-python-primer-for-matlab-users.html
- http://mathesaurus.sourceforge.net/matlab-numpy.html

### OpenCV

- http://opencv.org
- http://docs.opencv.org/modules/refman.html
- http://docs.opencv.org/doc/tutorials/tutorials.html
- https://github.com/Itseez/opencv
- http://opencv-python-tutroals.readthedocs.org/en/latest/py_tutorials/py_video/py_lucas_kanade/py_lucas_kanade.html

### Other image libraries in python

- https://python-pillow.github.io/
- http://scikit-image.org/

