I = imread("image12.jpg");
st = strel('disk',7,0);
[BW,maskedRGBImage] = createMaskFace2_1(I);
MorphologicalFiltering1 = imerode(BW,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

BW = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);
BW = imdilate(BW,st);

[BW2,maskedRGBImage2] = createMaskJacket2(I);


MorphologicalFiltering1 = imerode(BW2,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

BW2 = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);


[BW3,maskedRGBImage3] = createMaskHair(I);
MorphologicalFiltering1 = imerode(BW3,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

BW3 = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);

figure
imshow(I);
figure
imshow(BW);
figure
imshow(BW2);
figure
imshow(BW3);


A = BW;
%A = BW+BW2+BW3;
A = BW+BW3;



MorphologicalFiltering1 = imerode(A,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering3 = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);


figure
imshow(MorphologicalFiltering3);

MorphologicalFiltering4 = imdilate(MorphologicalFiltering3,st);

MorphologicalFiltering4 = MorphologicalFiltering4 + BW2;
AColor = zeros(size(I));
AColor(MorphologicalFiltering3 == 1) = I(MorphologicalFiltering3 == 1);

Test2 = uint8(MorphologicalFiltering3);
rgbUint8 = uint8(cat(3, Test2, Test2, Test2));

rgbUint8(MorphologicalFiltering3 == 1) = I(MorphologicalFiltering3 == 1);

rgbUint8 = double(rgbUint8);

figure
imshow(MorphologicalFiltering4);

T = I;
for l = 1:size(I,1)
    for c = 1:size(I,2)
        if(MorphologicalFiltering4(l,c) == 0)
            I(l,c,1) = 0;
            I(l,c,2) = 0;
            I(l,c,3) = 0;
        end
        if(l < 1200 || c > 700)
          I(l,c,1) = 0;
          I(l,c,2) = 0;
          I(l,c,3) = 0;
        end
    end
end

figure
imshow(I);



