%Matrix Methods Project
%A is the image matrix
%m is the size of the mxm matrix
clear all; clc; close all;
%for e=0.1:0.1:1;
disp('earth')
e=0.1;
[A,m]=makeImageMatrix('earth.jpeg');
[B_nonzero_vals, B_pos_vals]=compressImage(A,m,e);
displayCompressedImage(B_nonzero_vals,B_pos_vals,m);

%end
e=0.05;
disp('model')
[A,m]=makeImageMatrix('model.jpeg');
[B_nonzero_vals, B_pos_vals]=compressImage(A,m,e);
displayCompressedImage(B_nonzero_vals,B_pos_vals,m);
%{
disp('windows')
[A,m]=makeImageMatrix('windows.jpg');
[B_nonzero_vals, B_pos_vals]=compressImage(A,m,e);
displayCompressedImage(B_nonzero_vals,B_pos_vals,m);

disp('sunset/rise')
[A,m]=makeImageMatrix('sunset.jpeg');
[B_nonzero_vals, B_pos_vals]=compressImage(A,m,e);
displayCompressedImage(B_nonzero_vals,B_pos_vals,m);

disp('building')
[A,m]=makeImageMatrix('building.jpg');
[B_nonzero_vals, B_pos_vals]=compressImage(A,m,e);
displayCompressedImage(B_nonzero_vals,B_pos_vals,m);
%}

function [A,m]=makeImageMatrix(str)
    % Read in the image and change the entries to doubles so that other MatLab
    % functions can be used on it.
    A1=imread(str);
    A2=rgb2gray(A1);
    figure
    A=im2double(A2);
    
    % Make the image a 2^n by 2^n square centered in the middle of the
    % oprignal image.
    [w,h]=size(A);
    p=2^floor(log2(min(w,h)));
    dw=(w-p)/2;
    dh=(h-p)/2;
    A=A(1+floor(dw):w-ceil(dw),1+floor(dh):h-ceil(dh));
    imshow(A)
    m=p;
end
