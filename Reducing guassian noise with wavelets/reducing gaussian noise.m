clear all; 
close all; 

%applying noise to the images
I = imread('TestPictures/couple.BMP');
In= imnoise(I,'gaussian',0,0.01);
Inn= imnoise(I,'gaussian',0,0.02);
J= imread('TestPictures/face.BMP');
Jn= imnoise(J,'gaussian',0,0.01);
Jnn= imnoise(J,'gaussian',0,0.02);
K= imread('TestPictures/boat.BMP');
Kn=imnoise(K,'gaussian',0,0.01);
Knn=imnoise(K,'gaussian',0,0.02);

imwrite(In,'ResultPictures/couple_noised1.bmp','bmp');
imwrite(Inn,'ResultPictures/couple_noised2.bmp','bmp');
imwrite(Jn,'ResultPictures/face_noised1.bmp','bmp');
imwrite(Jnn,'ResultPictures/face_noised2.bmp','bmp');
imwrite(Kn,'ResultPictures/boat_noised1.bmp','bmp');
imwrite(Knn,'ResultPictures/boat_noised2.bmp','bmp');

figure(1)
subplot(3,3,1);
imshow(I);
xlabel('a)');
subplot(3,3,2);
imshow(In);
xlabel('b)');
subplot(3,3,3);
imshow(Inn);
xlabel('c)');
subplot(3,3,4);
imshow(J);
xlabel('d)');
subplot(3,3,5);
imshow(Jn);
xlabel('e)');
subplot(3,3,6);
imshow(Jnn);
xlabel('f)');
subplot(3,3,7);
imshow(K);
xlabel('g)');
subplot(3,3,8);
imshow(Kn);
xlabel('h)');
subplot(3,3,9);
imshow(Knn);
xlabel('i)');

%Performing both algorithms with noise variance of 0.01

In11=wdenoise2(In,'DenoisingMethod','Bayes');
In12=wdenoise2(In,'DenoisingMethod','SURE');
Jn11=wdenoise2(Jn,'DenoisingMethod','Bayes');
Jn12=wdenoise2(Jn,'DenoisingMethod','SURE');
Kn11=wdenoise2(Kn,'DenoisingMethod','Bayes');
Kn12=wdenoise2(Kn,'DenoisingMethod','SURE');

imwrite(ind2rgb(im2uint8(mat2gray(In11)), colormap('gray')),'ResultPictures/couple_noised1_res1.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(In12)), colormap('gray')),'ResultPictures/couple_noised1_res2.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Jn11)), colormap('gray')),'ResultPictures/face_noised1_res1.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Jn12)), colormap('gray')),'ResultPictures/face_noised1_res2.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Kn11)), colormap('gray')),'ResultPictures/boat_noised1_res1.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Kn12)), colormap('gray')),'ResultPictures/boat_noised1_res2.bmp','bmp');


figure(2)
colormap('gray');
subplot(3,3,1);
imagesc(In);
xlabel('a)');
subplot(3,3,2);
imagesc(In11);
xlabel('b)');
subplot(3,3,3);
imagesc(In12);
xlabel('c)');
subplot(3,3,4);
imagesc(Jn);
xlabel('d)');
subplot(3,3,5);
imagesc(Jn11);
xlabel('e)');
subplot(3,3,6);
imagesc(Jn12);
xlabel('f)');
subplot(3,3,7);
imagesc(Kn);
xlabel('g)');
subplot(3,3,8);
imagesc(Kn11);
xlabel('h)');
subplot(3,3,9);
imagesc(Kn12);
xlabel('i)');

%Performing both algorithms with noise variance of 0.02

In21=wdenoise2(Inn,'DenoisingMethod','Bayes');
In22=wdenoise2(Inn,'DenoisingMethod','SURE');
Jn21=wdenoise2(Jnn,'DenoisingMethod','Bayes');
Jn22=wdenoise2(Jnn,'DenoisingMethod','SURE');
Kn21=wdenoise2(Knn,'DenoisingMethod','Bayes');
Kn22=wdenoise2(Knn,'DenoisingMethod','SURE');

imwrite(ind2rgb(im2uint8(mat2gray(In21)), colormap('gray')),'ResultPictures/couple_noised2_res1.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(In22)), colormap('gray')),'ResultPictures/couple_noised2_res2.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Jn21)), colormap('gray')),'ResultPictures/face_noised2_res1.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Kn21)), colormap('gray')),'ResultPictures/boat_noised2_res1.bmp','bmp');
imwrite(ind2rgb(im2uint8(mat2gray(Kn22)), colormap('gray')),'ResultPictures/boat_noised2_res2.bmp','bmp');

figure(3)
colormap('gray');
subplot(3,3,1);
imagesc(Inn);
xlabel('a)');
subplot(3,3,2);
imagesc(In21);
xlabel('b)');
subplot(3,3,3);
imagesc(In22);
xlabel('c)');
subplot(3,3,4);
imagesc(Jnn);
xlabel('c)');
subplot(3,3,5);
imagesc(Jn21);
xlabel('e)');
subplot(3,3,6);
imagesc(Jn22);
xlabel('f)');
subplot(3,3,7);
imagesc(Knn);
xlabel('g)');
subplot(3,3,8);
imagesc(Kn21);
xlabel('h)');
subplot(3,3,9);
imagesc(Kn22);
xlabel('i)');
