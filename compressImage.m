function [BTwid]=compressImage(A,sz,percent,Haar)
    %input: image matrix A, size m, percent of elements to zero 
    %output: array of nonzero values and position array
    if (percent > 100 || percent < 0)
        BTwid = A;
        disp('ERROR: percent argument must be between 0 and 100');
        return;
    end 
    B=transpose(Haar)*A*Haar; %image matrix in haar coordinates
    if ( percent == 0 )
       BTwid = B;
       return;
    end
    % elementsB is a column vector containing all the unique nonero elements of
    % B
    elementsB=reshape(B,[sz^2,1]);
    elementsB=elementsB(elementsB~=0);
    elementsB=abs(elementsB);
    elementsB=unique(elementsB);
    [sizeOfB,~]=size(elementsB);
    
    percent = percent / 100;
    cutOff = floor(percent*sizeOfB);
    cutOff = elementsB(cutOff);
    disp(cutOff)
    
    for i = 1:sz^2
       if ( B(i) <= cutOff )
          B(i) = 0; 
       end
    end
    BTwid=B;

end