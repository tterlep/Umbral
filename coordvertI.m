function [i,j] = coordvertI(g,size_n)

% g = j + size_n*(i-1);

j = mod(g,size_n);
if j ==0
    j = size_n;
end

i = 1+ (g-j)/size_n;