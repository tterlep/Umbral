function mopt_inv = meanopt(x1,x2,meanC)
%this function returns 1/mean of specified type for two numbers. 

%1 = arithmatic mean
%2 = geometric mean
%3 = harmonic mean

% c = 3;
mopt_inv = 0;

if meanC == 1
   mopt_inv =  1/((x1+x2)/2);
end
if meanC == 2
   mopt_inv =  1/sqrt(x1*x2);
end
if meanC == 3
    mopt_inv = 1/((2*x1*x2)/(x1+x2));
end

 