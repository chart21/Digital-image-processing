I = imread("a1 (2).jpg");
se = strel('disk',7,0);
[BW,maskedRGBImage] = createMaskoFace(I);
MorphologicalFiltering1 = imerode(BW,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

BW = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);

BW = imdilate(BW,se);

[BW2,maskedRGBImage2] = createMaskobody(I);


MorphologicalFiltering1 = imerode(BW2,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

BW2 = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);

figure
imshow(I);
figure
imshow(BW);
figure
imshow(BW2);


A = BW+BW2;

MorphologicalFiltering1 = imerode(A,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering2 = imerode(MorphologicalFiltering1,[1 0 1; 1 1 1; 1 0 1]);

MorphologicalFiltering3 = imerode(MorphologicalFiltering2,[1 0 1; 1 1 1; 1 0 1]);

figure
imshow(MorphologicalFiltering3);


MorphologicalFiltering4 = imdilate(MorphologicalFiltering3,se);




MorphologicalFiltering4 = MorphologicalFiltering4 + BW2;

figure
imshow(MorphologicalFiltering4);


AColor = zeros(size(I));


AColor(MorphologicalFiltering3 == 1) = I(MorphologicalFiltering3 == 1);

Test2 = uint8(MorphologicalFiltering3);
rgbUint8 = uint8(cat(3, Test2, Test2, Test2));

rgbUint8(MorphologicalFiltering3 == 1) = I(MorphologicalFiltering3 == 1);

rgbUint8 = double(rgbUint8);

T = I;
for l = 1:size(I,1)
    for c = 1:size(I,2)
        if(MorphologicalFiltering4(l,c) == 0)
            I(l,c,1) = 0;
            I(l,c,2) = 0;
            I(l,c,3) = 0;
        end
        if(c > 500)
          I(l,c,1) = 0;
          I(l,c,2) = 0;
          I(l,c,3) = 0;
        end
    end
end

figure
imshow(I);



