clear all
close all
I = imread("Boat.jpg");
Originial = I;
E = edge(rgb2gray(I),'sobel');
figure(), imshow(I);

I = imrotate(I,14.5,'bilinear','crop');
OriginalRotated = I;
%figure(), imshow(I);

[BW,maskedRGBImage] = eliminateWater(I);
Te = BW;

%figure(), imshow(BW);
%only consider ocean area
for l = 1:size(I,1)
    BW(l,1:120) = 0;
    BW(l,size(I,2)-120:size(I,2)) = 0;
end

for c = 1:size(I,2)
    BW(800:size(I,1),c) = 0;
    BW(size(I,1)-150:size(I,1),c) = 0;
end 

    

E = edge(BW,'sobel');
%figure(), imshow(E);

%figure(), imshow(BW);

for l = 1:size(I,1)
    count = 0;
    for c = 1:size(I,2)
        if(BW(l,c)==1)
            count = count+1;
        end
    end
    if(count > size(I,2)/3)
        for c = 1:size(I,2)
            BW(l,c) = 0;
            if(l<size(I,1)-3)
            BW(l+1,c) = 0;
            BW(l+2,c) = 0;
            BW(l+3,c) = 0;
            end
        end
    end
end

%figure(), imshow(BW);


for c = 1:size(I,2)
    count = 0;
    for l = 1:size(I,1)
        if(BW(l,c)==1)
            count = count+1;
        end
    end
    if(count > size(I,1)/3)
        for l = 4:size(I,1)-4
            BW(l,c) = 0;
            if(c<size(I,2)-3)
                if(c>4)
            BW(l,c+1) = 0;
            BW(l,c+2) = 0;
            BW(l,c+3) = 0;
            BW(l,c-1) = 0;
            BW(l,c-2) = 0;
            BW(l,c-3) = 0;
                end
            end
        end
    end
end

   TE2 = BW; 

%figure(), imshow(BW);


se = strel('rectangle',[10,1]);
S = imdilate(BW,se);
S = imclose(S,se);
figure(), imshow(S);

MorphologicalFiltering1 = imerode(BW,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

BW3 = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);

%figure(), imshow(MorphologicalFiltering1);

S = imdilate(MorphologicalFiltering1,se);
%figure(), imshow(S);

I = MorphologicalFiltering1;

[~,threshold] = edge(I,'sobel');
fudgeFactor = 0.5;
BWs = edge(I,'sobel',threshold * fudgeFactor);
%figure(), imshow(BWs);

se90 = strel('line',3,90);
se0 = strel('line',3,0);
BWsdil = imdilate(BWs,[se90 se0]);
%figure()
%imshow(BWsdil)
%title('Dilated Gradient Mask');

BWdfill = imfill(BWsdil,'holes');
%figure()
%imshow(BWdfill)
%title('Binary Image with Filled Holes');

BWnobord = imclearborder(BWdfill,4);
%figure()
%imshow(BWnobord)
%title('Cleared Border Image');

seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
%figure()
%imshow(BWfinal)
%title('Segmented Image'); %1st iteration

BWnobord = imclearborder(BWfinal,4);
%figure()
%imshow(BWnobord)
%title('Cleared Border Image');

seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
%figure()
%imshow(BWfinal)
%title('Segmented Image'); %2nd iteration

BWnobord = imclearborder(BWfinal,8);
%figure()
%imshow(BWnobord)
%title('Cleared Border Image'); %3rd iteration

se = strel('rectangle',[10,1]); %3.1
BWdfill = imdilate(BWnobord,se); 

%Test
I = BWdfill;
BW = BWdfill;

for c = 1:size(I,2)
    start = 0;
    count = 0;
   
    for l = 1:size(I,1)
        if(BW(l,c)==1)
            if(start == 0)
                start = l;  
            end
            count = count+1;
            if(count > 30)
                if(l-start < 100)
                    BW(start:l,c) = 1;
                    start = 0;
                    count = 0;
                end
            end
        end
    end
end

count1 = 0;
iteration = 0;
for c = 1:size(I,2)
    count2 = 0;
    %iteration = 0;
    for l = 1:size(I,1)
        if(BW(l,c) == 1)
            count2 = count2+1;
            
        end
        
    end
    iteration = iteration+1;
    
    if(count2 < count1*0.7 && iteration < 8)
        for l = 1:size(I,1)
            BW(l,c) = 0;
        end
    else
        count1 = count2;
        iteration = 0;
    end
end

BWdfill = BW;

BWfinal =  BWdfill;
figure()
imshow(BWfinal)
title('Final dilation');


BWoutline = bwperim(BWfinal);
figure()
imshow(BWoutline);
BWrotate = imrotate(BWoutline,-14.5,'bilinear','crop');


figure(),imshow(BWrotate);
Segout = Originial; 
Segout(BWrotate) = 5000; 
figure()
imshow(Segout)
title('Outlined Original Image');
%imshow(labeloverlay(Originial,imrotate(BWfinal,-14.5,'bilinear','crop')))
%title('Outlined Original Image');