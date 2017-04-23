function displayCompressedImage(B_nonzero_vals, B_pos_vals, m)
h=makeHaar2(m);
BB=zeros([m^2,1]); %initializing BB to a col vector of zeros
l=1;%nonzero val index
g=B_nonzero_vals(l); %each nonzero val
sz2=size(B_pos_vals); 
num_vals=sz2(2); %number of nonzero values
for j=B_pos_vals %j represents columns
    BB(j)=g;
    l=l+1;
    if l<=num_vals
        g=B_nonzero_vals(l);
    end
end
BBB=vec2mat(BB,m); %turning BB into an mxm matrix
BBB=transpose(BBB);

% constructing the compressed image
AA=h*BBB*transpose(h);
figure
imshow(AA)


end