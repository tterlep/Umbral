function d = REdist(r,imageF_l,rdir_l,rmag_l,e_val)

 
% R = [00 00 08 00 06 00 00;
%      00 00 09 00 05 00 00;
%      12 11 10 07 04 03 02;
%      00 00 13 00 01 00 00;
%      14 15 16 19 22 23 24;
%      00 00 17 00 21 00 00;
%      00 00 18 00 20 00 00];
%rmag and rdir are also 7x7 local matrices of the larger image space.

d = inf;
%% e_val = 1
if e_val == 1
    if r ==1
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==2
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 4 13 77 1 28 44 4 24 77 6 17 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==3
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 4 5 44 2 77 5 9 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==4
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 4 44 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==5
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([6 77 2 44 5 10 4 44 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==6
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([14 44 1 23 77 4 27 44 6 18 4 44 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==07
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 44 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==8
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 44 3 3 19 44 6 26 66 4 22 44 1 15],imageF_l,rdir_l,rmag_l);
    end
    if r == 09
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 44 3 3 11 44 5 66 5 7],imageF_l,rdir_l,rmag_l);
    end
    if r == 10
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 44 3 3 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 11
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 12 66 2 44 2 8 3 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 12
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 20 66 1 21 44 4 25 66 6 16 3 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==13
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 3 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==14
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 17 66 6 24 55 4 28 66 1 13 4 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==15
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 9 66 5 55 2 5 4 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==16
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 55 3 4 66 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==17
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 55 3 4 10 66 5 55 2 6],imageF_l,rdir_l,rmag_l);
    end
    if r ==18
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 55 3 4 18 55 6 27 66 4 23 55 1 14],imageF_l,rdir_l,rmag_l);
    end
    if r ==19
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 55 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==20
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([15 55 1 22 77 4 26 55 6 19 3 55 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==21
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([7 77 5 55 5 11 3 55 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==22
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 3 55 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==23
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 3 8 55 2 77 2 12 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==24
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([77 3 3 16 77 6 25 55 4 21 77 1 20 1],imageF_l,rdir_l,rmag_l);
    end
end


%% e_val = 2
if e_val == 2
    if r ==1
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 77 3 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==2
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 77 3 4 13 77 1 28 44 4 24 77 6 17],imageF_l,rdir_l,rmag_l);
    end
    if r ==3
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 77 3 4 5 77 2 44 5 9],imageF_l,rdir_l,rmag_l);
    end
    if r ==4
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 77 3 4 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==5
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 6 44 2 77 5 10 4 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==6
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 14 44 1 23 77 4 27 44 6 18 4 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==07
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 4 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==8
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 19 44 6 26 66 4 22 44 1 15 1 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 09
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 11 44 5 66 5 7 1 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 10
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 66 3 1 44 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 11
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 66 3 1 12 66 2 44 2 8],imageF_l,rdir_l,rmag_l);
    end
    if r == 12
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 66 3 1 20 66 1 21 44 4 25 66 6 16],imageF_l,rdir_l,rmag_l);
    end
    if r ==13
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 66 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==14
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([17 66 6 24 55 4 28 66 1 13 4 66 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==15
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([9 55 5 66 2 5 4 66 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==16
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 4 66 3 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==17
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 4 10 66 5 55 2 6 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==18
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 4 18 55 6 27 66 4 23 55 1 14 2],imageF_l,rdir_l,rmag_l);
    end
    if r ==19
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==20
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 1 15 55 1 22 77 4 26 55 6 19 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==21
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 1 7 77 5 55 5 11 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==22
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([55 3 1 77 3 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==23
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([8 55 2 77 5 12 1 77 3 3 ],imageF_l,rdir_l,rmag_l);
    end
    if r ==24
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([16 77 6 25 55 4 21 77 1 20 1 77 3 3],imageF_l,rdir_l,rmag_l);
    end
end

%% e_val = 3
if e_val == 3
    if r ==1
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 1 77 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==2
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 13 77 1 28 44 4 24 77 6 17 2 77 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==3
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 5 77 2 44 5 9 2 77 3 ],imageF_l,rdir_l,rmag_l);
    end
    if r ==4
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 44 3 2 77 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==5
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 44 3 2 6 44 2 77 5 10],imageF_l,rdir_l,rmag_l);
    end
    if r ==6
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 44 3 2 14 44 1 23 77 4 27 44 6 18],imageF_l,rdir_l,rmag_l);
    end
    if r ==07
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 44 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==8
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([19 44 6 26 66 4 22 44 1 15 1 44 3 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 09
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([11 66 2 44 2 7 1 44 3 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 10
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 1 44 3 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 11
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 1 12 44 5 66 5 8 3],imageF_l,rdir_l,rmag_l);
    end
    if r == 12
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 1 20 66 1 21 44 4 25 66 6 16 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==13
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 1 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==14
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 2 17 66 6 24 55 4 28 66 1 13 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==15
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 2 9 66 5 55 2 5 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==16
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([66 3 2 55 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==17
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([10 66 5 55 2 6 2 55 3 4 ],imageF_l,rdir_l,rmag_l);
    end
    if r ==18
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([18 55 6 27 66 4 23 55 1 14 2 55 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==19
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([2 55 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==20
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 55 3 1 15 55 1 22 77 4 26 55 6 19],imageF_l,rdir_l,rmag_l);
    end
    if r ==21
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 55 3 1 7 55 2 77 2 11],imageF_l,rdir_l,rmag_l);
    end
    if r ==22
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 55 3 1 77 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==23
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 8 77 5 55 5 12 1 77 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==24
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([3 16 77 6 25 55 4 21 77 1 20 1 77 3],imageF_l,rdir_l,rmag_l);
    end
end

%% e_val = 4
if e_val == 4
    if r ==1
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 77 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==2
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([13 77 1 28 44 4 24 77 6 17 2 77 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==3
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([5 44 2 77 5 9 2 77 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==4
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 2 77 3 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==5
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 2 6 77 2 44 5 10 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==6
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 2 14 44 1 23 77 4 27 44 6 18 4],imageF_l,rdir_l,rmag_l);
    end
    if r ==07
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 2 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==8
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 3 19 44 6 26 66 4 22 44 1 15 1],imageF_l,rdir_l,rmag_l);
    end
    if r == 09
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 3 11 66 2 44 2 7 1],imageF_l,rdir_l,rmag_l);
    end
    if r == 10
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([44 3 3 66 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r == 11
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([12 44 5 66 5 8 3 66 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r == 12
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([20 66 1 21 44 4 25 66 6 16 3 66 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==13
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 66 3 1],imageF_l,rdir_l,rmag_l);
    end
    if r ==14
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 66 3 2 17 66 6 24 55 4 28 66 1 13],imageF_l,rdir_l,rmag_l);
    end
    if r ==15
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 66 3 2 9 66 5 55 2 5],imageF_l,rdir_l,rmag_l);
    end
    if r ==16
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 66 3 2 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==17
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 10 55 5 66 2 6 2 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==18
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([4 18 55 6 27 66 4 23 55 1 14 2 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==19
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 2 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==20
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 15 55 1 22 77 4 26 55 6 19 3 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==21
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 7 55 2 77 2 11 3 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==22
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 77 3 3 55 3],imageF_l,rdir_l,rmag_l);
    end
    if r ==23
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 77 3 3 8 77 5 55 5 12],imageF_l,rdir_l,rmag_l);
    end
    if r ==24
        %44 up, 55 down, 66 left, 77 right
        d = RE_pathfinder([1 77 3 3 16 77 6 25 55 4 21 77 1 20],imageF_l,rdir_l,rmag_l);
    end
end
