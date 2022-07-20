%pathfinder_v1
function d = BE_pathfinder(path,imageF_l,rdir_l,rmag_l)
 %44 up, 55 down, 66 left, 77 right
  
c_i = 4;
c_j = 4;
d = 0;

for i = 1:size(path,2)
    
    if path(i) == 55
        %down
        c_i = c_i +1;
    elseif path(i) == 77
        %right
        c_j = c_j+1;
    elseif path(i) == 44
        %up
        c_i = c_i - 1;
    elseif path(i) == 66
        %left
        c_j = c_j - 1;
    else
        d = d + BE_internal(path(i),rdir_l(c_i,c_j),rmag_l(c_i,c_j))...
            *(1/imageF_l(c_i,c_j));
    end
end
