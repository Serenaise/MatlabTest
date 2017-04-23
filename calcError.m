function error = calcError(A,B,h)
%This function will calculate the error between A and AA
AA=h*B*transpose(h);
error=norm(A-AA)/norm(A);
end