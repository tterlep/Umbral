function imageF = betaImage(imageS,size_m,size_n,a,b)

imageF = zeros(size_m,size_n);

sizeS_m = size(imageS,1);
sizeS_n = size(imageS,2);

% % 
% % Gaussian
% for i = 1:size(imageS,1)
%     for j = 1:size(imageS,2)
%         imageS(i,j) = imageS(i,j)+normrnd(0,0.1);
%     end
% end
% 


% % Betaweight image (if desired) 
% % Can use alternative image processing algorithms here


imageS = betacdf(imageS,a,b);


for i = 1:min(size_m,sizeS_m)
    for j = 1:min(size_n,sizeS_n)
        imageF(i,j) = imageS(i,j);
    end
end
imageF(imageF<=0.001) = 0.001;
