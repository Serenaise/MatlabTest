%Matrix Methods Project
clear all; close all;

disp('earth')
e=1;
[A,m]=makeImageMatrix('earth.jpeg');
H=makeHaar(m);
[Btwid]=compressImage(A,m,e,H);
ATwid = H*Btwid*transpose(H);
imshow(ATwid);
%displayCompressedImage(B_nonzero_vals,B_pos_vals,m);

e=0.003;
disp('model')
[A,m]=makeImageMatrix('model.jpeg');
H=makeHaar(m);
[Btwid]=compressImage(A,m,e,H);
ATwid = H*Btwid*transpose(H);
imshow(ATwid)
%displayCompressedImage(B_nonzero_vals,B_pos_vals,m);
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
    A=imread(str);
    A=rgb2gray(A);
    A=im2double(A);
    
    % Make the image a 2^n by 2^n square centered in the middle of the
    % orignal image.
    [w,h]=size(A);
    p=2^floor(log2(min(w,h)));
    dw=(w-p)/2;
    dh=(h-p)/2;
    A=A(1+floor(dw):w-ceil(dw),1+floor(dh):h-ceil(dh));
    m=p;
end
