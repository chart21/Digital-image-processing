# Various digital image processing algorithms implemented with Matlab
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](LICENSE)

This project proposes algorithms for different image processing problems, such as Contrast Enhancement, Image Segmentation, Object Detection, and Noise Reduction.

## Contrast Enhancement

I propose an algorithm that enhances the contrast of an image similar to the “Auto-Contrast enhancement” feature by Adobe Photoshop 2015. The algorithm increases the contrast dynamically based on each pixel’s value. The algorithm increases pixel values of relatively lighter parts of the
image and decreases pixel values of relatively lower parts.

### Original and enhanced image

<p align="center"><img src="Contrast Enhancement/results/original vs enhanced.jpg"\></p>

### Enhanced image and AutoContrast result of Photoshop

<p align="center"><img src="Contrast Enhancement/results/enhanced vs photoshop 2015.jpg"\></p>


## Object Detection

I use color thresholding, morphological filtering and propose custom ship detection algorithms to recognize ships in an image. To achieve segmentation, color thresholding is used on ocean color to binarize all non-ocean parts of the image. Ship detection algorithms are used to differentiate port, docks, and side-boats from ships. Afterward, dilation and erosion lead to a clear segmentation without small unwanted objects in the segment.

### Original image

<p align="center"><img src="Object Detection/Original Image.jpg"\></p>

### Proposed algorithm - flowchart

<p align="center"><img src="Object Detection/Segmentation algorithm flowchart.png"\></p>

### Results

<p float="left">

  <img src="Object Detection/final result.jpg" width="300" /> 
  <img src="Object Detection/result outline.jpg" width="300" />

 
</p>

## Image Segmentation

I use color thresholding and morphological filtering methods to segment a human standing under a tree in an image. To achieve segmentation, color thresholding is used for different colors of the body such as clothes, face, and hair. Afterward, dilation and erosion lead to a clear segmentation without small unwanted objects in the segment.


### Original images

<p float="left">

  <img src="Image Segmentation with morphological filtering/results/Original Image 2.jpg" width="200" /> 
  <img src="Image Segmentation with morphological filtering/results/Original Image 1.jpg" width="200" />

 
</p>

### Segmented images

<p float="left">

  <img src="Image Segmentation with morphological filtering/results/Image2 after final segmentation.jpg" width="210" /> 
  <img src="Image Segmentation with morphological filtering/results/Image after final segmentation.jpg" width="210" />

 
</p>


## Reducing Gaussian Noise 

In the frequency domain, noise can be separated from image content. As wavelets can transform an image to the frequency domain, they may detect image noise. I test different wavelet methods are tested to detect and then reduce Gaussian noise in an image.

### Results

<p align="center"><img src="Reducing guassian noise with wavelets/results - reducing gaussian noise.jpg"\></p>

(a), (d), (g) Gaussian-noised images

(b), (e), (h) Processed images with Bayes’ algorithm

(c), (f), (i) Processed images with Steins’ algorithm

## Getting Started
Each project contains a short paper explaining the proposed algorithm. Simply run the **.m** file using MATLAB.

