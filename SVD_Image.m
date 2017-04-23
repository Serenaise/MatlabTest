clear all;
close all;
[I,sz] = makeImageMatrix('Puppy.jpg');
[U,S,V] = svd(I);
% Should generalize this to the size of the image but I'm not sure how.
S2 = zeros(sz);
R = 10;
for r = 1:R
    S2(r,r) = S(r,r);
end
D = sqrt(S2);
C = U*D*D*transpose(V);
imshow(C);
