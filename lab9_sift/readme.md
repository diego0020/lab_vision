# SIFT Descriptors

Based on 

- [SIFT detector and description](http://www.vlfeat.org/overview/sift.html)
- [MSER Feature Detector](http://www.vlfeat.org/overview/mser.html)
- [Covariant feature detectors](http://www.vlfeat.org/overview/covdet.html)
- [Local feature frames](http://www.vlfeat.org/overview/frame.html)

There is NO homework. However try to answer to all the quetions. Some of them will require browsing further through [vl_feat documentation](http://www.vlfeat.org/matlab/matlab.html) and other sources. 

You will also find useful code in the [demo directory](https://github.com/vlfeat/vlfeat/tree/master/toolbox/demo)

## 1. Sift Detector and Descriptor

Go through the tutorial [SIFT detector and description](http://www.vlfeat.org/overview/sift.html) . 

- What are *Frames* in vl_feat ?  What do they represent ?
- How is the location and shape of frames determined ?
- What is a SIFT descripor ?
- How is scale invariance achieved ?
- Is SIFT invariant to rotations ?
- Is SIFT invariant to illumination changes ?
- What are some possible applications of SIFT ?
- Try using the technique in your own images or videos.

## 2. Maximally Stable Extremal Regions 

Go through the [MSER Feature Detector](http://www.vlfeat.org/overview/mser.html) tutorial. 

- What are MSER ?  What is their purpose ?
- How are they compared to SIFT ?
- To what operations are MSER invariant ?
- What is the purpose of the *delta* parameter ?
- Try applying this technique to your own images or videos, compare with SIFT

## 3. Covariant feature detectors

Go through the [Covariant feature detectors](http://www.vlfeat.org/overview/covdet.html) tutorial

- What is the relation between co-variant features and SIFT ?
- Why are we interested in finding feature frames ?
- What is the purpose of *Affine adaptation* ?
- How do coordinats inside a *frame* relate to pixel coordinates ?
- Play with your own images and the differnt types of detectors and descriptors.

## 4 (Optional) Local Feature Frames

Go through the [Local feature frames](http://www.vlfeat.org/overview/frame.html) tutorial.
