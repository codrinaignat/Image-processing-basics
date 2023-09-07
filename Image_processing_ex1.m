I = imread('pout.tif');
imshow(I);
I2 = histeq(I);
figure
imshow(I2)
imwrite (I2, 'pout2.png');
imfinfo ( 'pout2.png');