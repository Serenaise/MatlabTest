function H = makeHaar(n)
H = zeros(n);
%first half
%first col
H(:,1)=1/sqrt(n);
%second col
H(1:(n/2),2)=1/sqrt(n);
H((n/2)+1:n,2)=-1/sqrt(n);
%columns 3 through n
if (n/2) > 2
    zz=log2(n)-1;
    indx=ones([1 zz]);
        for u=1:zz 
           indx(1,u)=2^u;
        end  
    flipindx=fliplr(indx);
    sz2=size(indx); 
    num_vals=sz2(2); %number of nonzero values
    ww=1;
    w=flipindx(ww);
    c=3;
    for i=indx %columns
        m=1;
        mm=n/(i*2); %delta
           for j=1:i
               H(m:m-1+mm,c)=1/sqrt(w);
               m=m+mm;
               H(m:m-1+mm,c)=-1/sqrt(w);
               m=m+mm;
               c=c+1;
           end
           ww=ww+1;
           if ww<=num_vals
                w=flipindx(ww);
           end
    end
end
end
