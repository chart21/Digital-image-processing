clear all;
myFolder =  'BMP images';
k=6; %%loading the right image
filePattern  = fullfile(myFolder, '*.BMP');
images                  = dir(filePattern);
baseFileName = images(k).name;
fullFileName = fullfile(myFolder, baseFileName);
tt=70;
O = imread(fullFileName); %%original image
A = imread(fullFileName); %%to be processed image
A = double(A);
mu = mean(mean(A));
A = A - mu; %% mean adjustment
x = 1.2; %%slope of linear transition
x2 = 1.15; %% pixel value dependent multiplier of Edge pixels
threshold = 200; %%threshold of edge pixels

A = A * x; %%Linear transformation

maxVal = (threshold - mu)*x;
%%Slope adjustment for edge pixel values (> threshold)
A(A/x + mu > threshold) = maxVal + A(A/x + mu > threshold) - maxVal * x2;

%%Slope adjustment for edge pixel values (< threshold)
A(A/x + mu < 255 - threshold) = A(A/x + mu < 255 - threshold) * x2;

A = A + mu; %%reverting mean adjustment
A = uint8(A); %%casting back to get rid of too big and too small values


B = A;


%%Plotting section
%%Plotting section
%%Plotting section




res=256;    
res2=res/2;
funcx=linspace(1,res,res);
funcy=linspace(1,res,res)-mu;
funcy=funcy*x;
funcy(funcy/x + mu > threshold) = maxVal + funcy(funcy/x + mu > threshold) - maxVal * x2;
funcy(funcy/x + mu < 255 - threshold) = funcy(funcy/x + mu < 255 - threshold) * x2;

funcy=funcy+mu;
funcy(funcy<=1)=1;
funcy(funcy>res)=res;


subplot(2,2,1), imshow(O);
title('a) Original Image');
subplot(2,2,2), imshow(A);
title('b) Enhanced Image');
subplot(2,2,3), histogram(A);
title('c) Histogram of Enhanced Image');
xlabel('Pixel Value');
ylabel('Number of Pixels');
subplot(2,2,4), plot(funcx,funcy);
title('d) Linear transition');
ylabel('Enhanced Pixel Value');
xlabel('Original Pixel Value');


T = imread('photoshop4.BMP');






subplot(1,2,1)
histogram(T);
title('a) Histogramm of Photoshop 2015 Image');
xlabel('Pixel Value');
ylabel('Number of Pixels');
subplot(1,2,2)
histogram(A)
title('b) Histogram of Enhanced Image');
xlabel('Pixel Value');
ylabel('Number of Pixels');



subplot(2,2,1), imshow(A);
title('a) Enhanced Image');
subplot(2,2,2), imshow(T);
title('b) Photoshop 2015 Image');
subplot(2,2,3), histogram(A);
title('c) Histogram of Enhanced Image');
xlabel('Pixel Value');
ylabel('Number of Pixels');
subplot(2,2,4), histogram(T);
title('d) Histogram of Photoshop 2015 Image');
xlabel('Pixel Value');
ylabel('Number of Pixels');



  

