# Segmentation practice

## Data


The data for this lab can be downloaded from the course server using http or ssh protocols

- `scp vision@<server>:/datos1/vision/images/images.tar.gz .`
- http://157.253.63.7/images.tar.gz

For using ssh in windows you may use [putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) 
or [filezilla](http://portableapps.com/apps/internet/filezilla_portable)  


## Implement a segmentation method

Implement your own segmentation method using what you have learned in class. It should be a matlab function with the following signature

```matlab
function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering method, number of clusters)
```
Where

- feature_space : 'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy'
- clustering_method = k-means, gmm, hierarchical or watershed (code seen in class).

The output of the function should be an image (or matrix) where each pixel has a cluster label. In other words, pixels that belong to the same cluster should have the same integer label.

## Test your function

To test the output of your function use something like

```matlab
image(segm)
colormap colorcube
```

You should see an image similar to the following, where each color represents a different cluster.

![Example of segmentation](segmented.png)

Try different parameters of your function, and see which ones work best. **Next week** we will perform a formal test of this function.

## Notes

- If you run into memory problems try downsampling the image
- *xy* stands for the spatial _x_ and _y_ coordinates
- You may need to scale the different channels to make them comparable, or to make some of them more important in the clustering process. For example _coords = ( α\*r, α\*g, α\*b, β\*x, β\*y)_

## End

Upload your function to the repository
