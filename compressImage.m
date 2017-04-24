%yal''s is sum bitchez
function [B_nonzero_vals, B_pos_vals]=compressImage(A,m,e)
%input: image matrix and size
%output: array of nonzero values and position array
h=makeHaar2(m); % h is an orthoogonal haar matrix of size mxm
B=transpose(h)*A*h; %image matrix in haar coordinates
C=B;
% e will be the desired error
%MiN=min(abs(B(:)));
%mAx=max(abs(B(:)));
elementsB=reshape(B,[m^2,1]);
elementsB=elementsB(elementsB~=0);
elementsB=abs(elementsB);
elementsB=unique(elementsB);
[sizeB,~]=size(elementsB);
indexB=1;
error=0;
fff=elementsB(indexB);
%while(error<e && indexB<=m^2)
for indx=1:100

            for i=1:m
               for j=1:m
                    if abs(C(i,j))<=fff
                        C(i,j)=0;
                        indexB = indexB + 1;
                        if indx<=sizeB
                            fff=elementsB(indx);
                        end
                    end
               end
            end
            error=calcError(A,C,h);
            %if err2<e
                %error=err2;
                %B=C;
            %end
end
disp('error')
disp(error)
%Here we want to do error stuff.


% compressing the image to send it:
% we are compressing matrix B into two arrays
% we are sending the two arrays and the value of m
B_nonzero_vals=[]; %values of non zero numbers in B
B_pos_vals=[]; %the position of the nonzero values (reading by the columns)
% note: position 1=(1,1). position m=(m,1). position 2m+1=(1,3)
B_vec=B(:);
for j=1:m^2 %j represents columns
        if B_vec(j) ~= 0
            B_nonzero_vals=[B_nonzero_vals, B_vec(j)];
            B_pos_vals = [B_pos_vals, j]; 
        end
end
disp('size of info being sent: ')
xx=size(B_pos_vals);
2*xx(2)+1
disp('size of image matrix ')
m^2

% Now we will send the person recieving the image B_nonzero_vals,
% B_pos_vals, and m

end