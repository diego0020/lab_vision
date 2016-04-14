# Optical Flow in Open CV

## Setup

The files for this lab can be downloaded from 

http://157.253.63.7/win_python_vision_3.zip

The compressed folder contains a [winpython](http://winpython.sourceforge.net/) python distribution (sorry, only for windows) with the OpenCV library installed; and the [opencv python samples](https://github.com/Itseez/opencv/tree/master/samples).

If you are working on mac you can use [anaconda python](https://www.continuum.io/downloads). For linux just install via the package manager.

We will use the [Spyder IDE](https://pythonhosted.org/spyder/), which provides an interface very similar to matlab.
Uncompress the folder, and launch the *Spyder* executable.

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

At the top of the file we have

```python
from __future__ import print_function

import numpy as np
import cv2
import video
```

These lines are importing libraries into the current script. 
- *numpy* is the python numerical library. It lets us work with matrices and perform vectorized operations as in matlab. 
- *cv2* is OpenCV
- *video* is another example, located in the samples directory. It has a function that helps getting data into OpenCV.
 
Afterwards we have 3 functions: ``draw_flow``, ``draw_hsv`` and ``warp_flow``. From their name it is very clear what they do. Later we have this fragment

```python
if __name__ == '__main__':
  import sys
  print(__doc__)
  #Read command line arguments
  try:
      fn = sys.argv[1]
  except:
      #If there are no arguments, default to 0 (input from webcam)
      fn = 0
  
  # Use the create_capture function in the video module to get a video source
  cam = video.create_capture(fn)
  # Read the first frame
  ret, prev = cam.read()
  # Create a grayscale image from the frame
  prevgray = cv2.cvtColor(prev, cv2.COLOR_BGR2GRAY)
  
  # Set some variables
  show_hsv = False
  show_glitch = False
  
  # Keep a copy of the frame to apply glitching
  cur_glitch = prev.copy()
```

The ``if __name__ == "__main__"`` is a standard python construct. Python scripts can be run as programs or they can be imported into other scripts as we did with the ``video`` module above. The *if* guarantees that the code fragment will only be executed if the script is run as a program. The comments added above explain what the other lines do. After this fragment we got the main loop of the program. 

```python
    while True:
        # read the next frame
        ret, img = cam.read()
        # crate grayscale image
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        # Calculate the optica flow: more information below
        flow = cv2.calcOpticalFlowFarneback(prevgray, gray, None, 0.5, 3, 15, 3, 5, 1.2, 0)
        # Save this frame to use in the next iteration
        prevgray = gray

        #Show the standard flow image
        cv2.imshow('flow', draw_flow(gray, flow))
        if show_hsv:
            #show the hsv image
            cv2.imshow('flow HSV', draw_hsv(flow))
        if show_glitch:
            #Show glitch
            cur_glitch = warp_flow(cur_glitch, flow)
            cv2.imshow('glitch', cur_glitch)

        # Process keyboard events
        ch = 0xFF & cv2.waitKey(5)
        
        # If escape was pressed leave the loop
        if ch == 27:
            break
        #if '1' was pressed toggle the hsv visualization
        if ch == ord('1'):
            show_hsv = not show_hsv
            print('HSV flow visualization is', ['off', 'on'][show_hsv])
        # if '2' was pressed toggle the glitch image
        if ch == ord('2'):
            show_glitch = not show_glitch
            if show_glitch:
                cur_glitch = img.copy()
            print('glitch is', ['off', 'on'][show_glitch])
    
    # After leaving the loop, close all windows
    cv2.destroyAllWindows()
```

The most important line here is 

```python
flow = cv2.calcOpticalFlowFarneback(prevgray, gray, None, 0.5, 3, 15, 3, 5, 1.2, 0)
```

To understand what it does we need to look at its [documentation](http://docs.opencv.org/modules/video/doc/motion_analysis_and_object_tracking.html?highlight=calcopticalflowfarneback#cv2.calcOpticalFlowFarneback)

As you can see in the link the parameters are

- prevgray: image from the past frame
- gray: image from the next frame
- ``None``: Object to save the result, ``None`` here indicates we will not use this parameter, we will get the result as the function return value
- 0.5 : Pyramid scale
- 3 : Pyramid levels
- 15 : window size
- 3 : iterations
- 5 : poly_n
- 1.2 : poly_sigma
- 0 : No flags

This function does all  the heavy lifting in the program. It is highly optimized and is able to run in realtime. 

What applications of these can you think of ? 
Try playing with the example, changing the parameters and the input.

### Lucas-Kanade

There are also two example of the Lucas-Kanade algorithm

- ``lk_track.py``
- ``lk_homography.py``

We will only analyze the first one, but you are encouraged to look at the other one on your own. Thse examples are run in exactly the same way as the previous one, and they take the same parameters. Go on and try to run them with the 3 types of video sources.

The structure of the file looks different because now the application is encapsulated in the class *App*. Inside the class we can find two methods.

- ``__init__`` : Class constructor
- ``run`` : runs the application, contains the main loop.

Lets take a closer look at the loop inside the ``run`` method

```python
# read next frame
ret, frame = self.cam.read()

# create a gray image
frame_gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

# keep a copy of the frame to use as base of the visualization
vis = frame.copy()

# Check if we are currently tracking any points
if len(self.tracks) > 0:
    
    # Assign the image from last iteration to img0, and the current image to img1
    img0, img1 = self.prev_gray, frame_gray
    
    # Create a Nx1x2 array with the last known coordinates of each tracked point
    # each element of self.tracks is actually a vector containing at most ten positions for each point
    # "for tr in self.tracks" iterates over the tracked points, at each iteration tr takes the value
    # of the current point
    # tr[-1] takes the last point in this array
    # reshape does the same as its matlab equivalent. The -1 means: automatically calculate the size 
    # of this dimension.
    p0 = np.float32([tr[-1] for tr in self.tracks]).reshape(-1, 1, 2)
    
    # Perform the LK motion estimation. The operation is done twice, in the first case
    # motion is calculated in img1 taking img0 as reference
    # in the second case img1 is used as reference.
    # This is called "back-tracking" and is used to verify the stability of the points
    p1, st, err = cv2.calcOpticalFlowPyrLK(img0, img1, p0, None, **lk_params)
    p0r, st, err = cv2.calcOpticalFlowPyrLK(img1, img0, p1, None, **lk_params)
    
    # Calculate the distance between p0 and p0r.
    # p0r holds the results of back-tracking. If the point is "good", then the distance between 
    # p0 and p0r should be small
    d = abs(p0-p0r).reshape(-1, 2).max(-1)
    
    # good will be a vector of size N containing True for good points, and False otherwise
    good = d < 1
    
    # Create a list to hold the new set of tracked points
    new_tracks = []
    
    # Iterate at the same time trough 
    # - the currently tracked points (tr), 
    # - the vectors returned by the LK algorithm ( (x,y) )
    # - and the vector indicating which points are good (good_flag)
    for tr, (x, y), good_flag in zip(self.tracks, p1.reshape(-1, 2), good):
        # Ignore points which are not good
        if not good_flag:
            continue
        
        # Add the current coordinates to the end of the tr list, which contains previous positions 
        # of each tracked point
        tr.append((x, y))
        
        # If the list grows larger than self.track_len; delete the oldest coordinates
        if len(tr) > self.track_len:
            del tr[0]
        
        # Add this "good" point to the list new_tracks, notice bad points are discarded
        new_tracks.append(tr)
        
        # Draw a circle on "vis" showing the new location of the point
        cv2.circle(vis, (x, y), 2, (0, 255, 0), -1)
    
    # save new_tracks as the attribute self.tracks    
    self.tracks = new_tracks
    
    # Draw lines showing the past positions (trajectories) of the tracked points
    cv2.polylines(vis, [np.int32(tr) for tr in self.tracks], False, (0, 255, 0))
    
    # Write a message at the corner showing how many points we are currently tracking
    draw_str(vis, (20, 20), 'track count: %d' % len(self.tracks))

# Each "self.detect_interval" frames we refresh the list of tracked points with new points
if self.frame_idx % self.detect_interval == 0:
    # Create an all zero matrix to hold a mask
    mask = np.zeros_like(frame_gray)
    # make all values of the mask 255
    mask[:] = 255
    # Add a black (0) circle around each of the currently tracked points
    # so that we don't search again there for additional points
    for x, y in [np.int32(tr[-1]) for tr in self.tracks]:
        cv2.circle(mask, (x, y), 5, 0, -1)
    
    # Find some new good feature points to track
    p = cv2.goodFeaturesToTrack(frame_gray, mask = mask, **feature_params)
    
    # If any points are found, add them to the self.track list
    if p is not None:
        for x, y in np.float32(p).reshape(-1, 2):
            # Each element of self.tracks is a list containing known positions for each point. 
            # In this case they will be lists with just one element, the position of the points
            # right now [(x,y)]
            self.tracks.append([(x, y)])

# Increase frame counter
self.frame_idx += 1
# save frame for next iteration
self.prev_gray = frame_gray

# Show viz, with all the trajectories and circles drawn on top
cv2.imshow('lk_track', vis)

# Handle events
ch = 0xFF & cv2.waitKey(1)
# If escape was pressed, leave the loop
if ch == 27:
    break
```

As you can see the most important functions in the script are

- [calcOpticalFlowPyrLK](http://docs.opencv.org/modules/video/doc/motion_analysis_and_object_tracking.html?highlight=calcopticalflowfarneback#calcopticalflowpyrlk)
- [goodFeaturesToTrack](http://docs.opencv.org/modules/imgproc/doc/feature_detection.html?highlight=goodfeaturestotrack#cv.GoodFeaturesToTrack)

Look at the manual entries for both of them and try to understand what they do.

## Your turn

The previous examples calculated the optical flow and showed it to you. In this case your mission is to use the optical flow to detect events. For example the camera or subjects moving suddenly. 

Modify the ``lk_track.py`` example, such that when the camera or the subject moves fast to the left, the visualization is changed. 

You need to 

- Detect the event (sudden increase in lateral flow)
- React to the event (you can be creative here)
- Block other eventes for a couple of a seconds

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

