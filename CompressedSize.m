function[Size] = CompressedSize(A)
    Size = 0;
    [m,n] = size(A);
    t = n*m;
    for x = 1:1:t
       if (A(x) ~= 0)
          Size = Size + 2;
       end
    end
    Size = Size + 1;
end