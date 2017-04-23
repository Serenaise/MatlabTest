clear all;
close all;
% Puppy.jpg is an 332x300 grayscale image.
% imread reads the image into the workspace so we can work with it.
% Note that I here is a matirx containing the color values of the image
I = imread('Puppy.jpg');
% If the image was not previously grayscale make it grayscale.
% Each entry of I with have one value representing the intensity of that
% pixle.
I = rgb2gray(I);
% Many matlab matrix operations are not supported for uint8 types so we
% should make the contents of the matrix doubles.
I=I(1:300,1:300);
% Use imshow(I) if you want to see the image.
I = im2double(I);