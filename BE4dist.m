function d = BE4dist(r,imageF_l,rdir_l,rmag_l)


% R = [00 00 08 00 06 00 00;
%      00 00 09 00 05 00 00;
%      12 11 10 07 04 03 02;
%      00 00 13 00 01 00 00;
%      14 15 16 19 22 23 24;
%      00 00 17 00 21 00 00;
%      00 00 18 00 20 00 00];
%rmag and rdir are also 7x7 local matrices of the larger image space.

d = inf;
if r ==1
    %44 up, 55 down, 66 left, 77 right
    d = BE_pathfinder([1 77 13],imageF_l,rdir_l,rmag_l);
end
% if r ==2
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([24 77 39 77 44 35 77 12],imageF_l,rdir_l,rmag_l);
% end
% if r ==3
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([23 77 30 44 26 77 11],imageF_l,rdir_l,rmag_l);
% end
% if r ==4
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([22 77 44 10],imageF_l,rdir_l,rmag_l);
% end
% if r ==5
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([21 44 25 77 29 44 9],imageF_l,rdir_l,rmag_l);
% end
% if r ==6
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([20 44 40 44 77 36 44 8],imageF_l,rdir_l,rmag_l);
% end
if r ==07
    %44 up, 55 down, 66 left, 77 right
    d = BE_pathfinder([19 44 7],imageF_l,rdir_l,rmag_l);
end
% if r ==8
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([18 44 37 44 66 33 44 6],imageF_l,rdir_l,rmag_l);
% end
% if r == 09
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([17 44 28 66 32 44 5],imageF_l,rdir_l,rmag_l);
% end
% if r == 10
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([16 44 66 4],imageF_l,rdir_l,rmag_l);
% end
% if r == 11
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([15 66 31 44 27 66 3],imageF_l,rdir_l,rmag_l);
% end
% if r == 12
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([14 66 38 66 44 34 66 2],imageF_l,rdir_l,rmag_l);
% end
if r ==13
    %44 up, 55 down, 66 left, 77 right
    d = BE_pathfinder([13 66 1],imageF_l,rdir_l,rmag_l);
end
% if r ==14
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([12 66 35 66 55 39 66 24],imageF_l,rdir_l,rmag_l);
% end
% if r ==15
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([11 66 26 55 30 66 23],imageF_l,rdir_l,rmag_l);
% end
% if r ==16
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([10 66 55 22],imageF_l,rdir_l,rmag_l);
% end
% if r ==17
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([9 55 29 66 25 55 21],imageF_l,rdir_l,rmag_l);
% end
% if r ==18
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([8 55 36 55 66 40 55 20],imageF_l,rdir_l,rmag_l);
% end
if r ==19
    %44 up, 55 down, 66 left, 77 right
    d = BE_pathfinder([7  55 19],imageF_l,rdir_l,rmag_l);
end
% if r ==20
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([6 55 33 55 77 37 55 18],imageF_l,rdir_l,rmag_l);
% end
% if r ==21
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([5 55 32 77 28 55 17],imageF_l,rdir_l,rmag_l);
% end
% if r ==22
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([4 55 77 16],imageF_l,rdir_l,rmag_l);
% end
% if r ==23
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([3 77 27 55 31 77 15],imageF_l,rdir_l,rmag_l);
% end
% if r ==24
%     %44 up, 55 down, 66 left, 77 right
%     d = BE_pathfinder([2 77 34 77 55 38 77 14],imageF_l,rdir_l,rmag_l);
% end


