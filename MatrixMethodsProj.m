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
