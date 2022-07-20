%pathfinder_v1
function d = RE_pathfinder(path,imageF_l,rdir_l,rmag_l)
 %44 up, 55 down, 66 left, 77 right

meanC = 3; %this specifies which mean to use 1 arith, 2 geo, 3 harmon
c_i = 4;
c_j = 4;
d = 0;

for i = 1:size(path,2)
    
    if path(i) ==0
    
    
    elseif path(i) == 55
        %down
        n_i = c_i +1;
        n_j = c_j;
        d = d + RE_down(path(i+1),rdir_l(c_i,c_j),rmag_l(c_i,c_j),rdir_l(n_i,n_j),rmag_l(n_i,n_j))...
            *meanopt(imageF_l(c_i,c_j),imageF_l(n_i,n_j),meanC);
        path(i+1) = 0;
        c_i = n_i;
        c_j = n_j;
    elseif path(i) == 77
        %right
        n_i = c_i;
        n_j = c_j+1;
        d = d + RE_right(path(i+1),rdir_l(c_i,c_j),rmag_l(c_i,c_j),rdir_l(n_i,n_j),rmag_l(n_i,n_j))...
            *meanopt(imageF_l(c_i,c_j),imageF_l(n_i,n_j),meanC);
        path(i+1) = 0;
        c_i = n_i;
        c_j = n_j;
        
    elseif path(i) == 44
        %up
        n_i = c_i - 1;
        n_j = c_j;
        d = d + RE_down(path(i+1),rdir_l(n_i,n_j),rmag_l(n_i,n_j),rdir_l(c_i,c_j),rmag_l(c_i,c_j))...
            *meanopt(imageF_l(c_i,c_j),imageF_l(n_i,n_j),meanC);
        path(i+1) = 0;
        c_i = n_i;
        c_j = n_j;
        
    elseif path(i) == 66
        %left
        n_i = c_i;
        n_j = c_j - 1;
        d = d + RE_right(path(i+1),rdir_l(n_i,n_j),rmag_l(n_i,n_j),rdir_l(c_i,c_j),rmag_l(c_i,c_j))...
            *meanopt(imageF_l(c_i,c_j),imageF_l(n_i,n_j),meanC);
        path(i+1) = 0;
        c_i = n_i;
        c_j = n_j;
        
    else
        d = d + RE_internal(path(i),rdir_l(c_i,c_j),rmag_l(c_i,c_j))...
            *(1/imageF_l(c_i,c_j));
    end
    
end
