# Hybrid Images
## Information about the place
The images were taken in diferents times in a same place: a Campito de San Jose's Chapel (hereafer called Chapel). The chapel was built in 1922 and later, in 1998, it was restaurated and converted in library. The first chapel's blueprints was known in 1903 and the bulding was acquired by the Universidad de los Andes in 1962. Nowdays, the chapel is the U building and works as Arts and Desing's library. 
For more information about the chapel history go to [this link](https://campusinfo.uniandes.edu.co/images/stories/campus/Historia/Bloques/bloque%20u%20-%20capilla.pdf).
The chapel is locate intro the Universidad de los Andes Campus in the east of Bogota, on the hillside of Guadalupe. The cartesian coordinates of the chapel are latitude 4.601518 N and longitude 74.064162 W.
<div class="video-container">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d819.4706569373759!2d-74.06471217084585!3d4.60170233657302!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNMKwMzYnMDYuMSJOIDc0wrAwMyc1MS4wIlc!5e1!3m2!1ses-419!2s!4v1456885017487" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>
## Originals Images
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/ViejaCapillaOrg.jpg" height="200" align="right">
The Old Chapel's photo belongs to Oficina de Administración Documental (OAD) of Univerisdad de los Andes, it was taken at 1969 by Gemán Téllez. The original photo can be at this [link](https://www.facebook.com/155723537956531/photos/a.240801929448691.1073741833.155723537956531/240801939448690/?type=3&theater).
The photo show was modificated (watermark) to protect the author rigths.
For more information go to [OAD's facebook page](https://www.facebook.com/Oficina-de-Administración-Documental-155723537956531/) or [OAD's page](oad.uniandes.edu.co).

The features of the old picture (as focal length and expotition time) do not know. The photo was obtained to the [OAD's facebook page](https://www.facebook.com/Oficina-de-Administración-Documental-155723537956531/)

<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/NuevaCapillaOrg.jpg" height="200" align="left">
The New Chapel's photo was taken by me, at 10:16 hrs (UTC-05:00), the day February 24th, 2016. The photo was taken with a cellphone's camera with the next features:
- Dimention: 2988 × 5312 px
- Color Space: RGB
- Color Profile: sRGB IEC61966-2.1
- Focal length: 4.8
- F number: 2.2
- Exposition time: 1/1.156 seg

## Processed images
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/ViejaCapilla.jpg" height="200" align="left">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/NuevaCapilla.jpg" height="200" align="right">
The images was processed with the tool GIMP&reg; to crop and fix the perspective. 

The images' color did not modificate.

The original images did not have the same perspective and therefor the size of windows, door, corners, stairs and others details were not similar. The perspective correction was used to relate the main facade of the chapel on the two images.

The perspective correction can be do with MATLAB&reg; with a 3x3 matrix to make a geometric transformation, but is easier in GIMP&reg; because the tool calculate the 3x3 matrix based on the move of points on the images.

## Final hybrid image
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="320" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="240" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="160" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="120" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="80" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="60" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="40" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="30" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="20" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="15" align="top">
<img src="https://github.com/CarlosAAcostaH/lab_vision/blob/master/lab3_hybrid/HibridaCapilla.jpg" width="10" align="top">

## Commented Code
The code was write in m-language and run in MacOs Matlab R2015b. The processed images was saved in a directory `fotos`, placed in the same path to the code. The old photo was called `NuevaCapilla.jpg` and the new photo was called `ViejaCapilla.jpg`. The code save a hybrid image created as a jpg image (`HibridaCapilla.jpg`) in the directory `fotos`.
```matlab
clear all; % Clear all variables
close all; % Close all open figures
I1=imread('./fotos/NuevaCapilla.jpg'); % Create I1 as a 2016 chapel photo after modificated with GIMP(R)
I2=imread('./fotos/ViejaCapilla.jpg'); % Create I2 as a 1969 chapel photo after modificated with GIMP(R)
a=40; % Set an a parameter of the filter to apply to I1
b=40; % Set a b parameter of the filter to apply to I2
F1=fspecial('gaussian',floor(2*a+1)*[1 1],a*0.5); % Create a low-pass filter F1 that will be apply to I1
F2=fspecial('gaussian',floor(2*b+1)*[1 1],b*0.5); % Create a low-pass filter F1 that will be apply to I2
G1=imfilter(I1,F1); % Apply the filter F1 to I1 and save as G1
G2=imfilter(I2,F2); % Apply the filter F2 to I2 and save as G2
imshow(G1+(I2-G2)); % Show the hybrid image
imwrite(G1+(I2-G2),'./fotos/HibridaCapilla.jpg') % Save the hybrid image created in a jpg file
```
