function [A,m]=makeImageMatrix(str)
A1=imread(str);
A2=rgb2gray(A1);
figure
A=im2double(A2);

[w,h]=size(A);
p=2^floor(log2(min(w,h)));
dw=(w-p)/2;
dh=(h-p)/2;
A=A(1+floor(dw):w-ceil(dw),1+floor(dh):h-ceil(dh));
imshow(A)
m=p;
end