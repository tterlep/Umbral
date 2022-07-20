%This function returns the weighted version of the anisorathic propagation
%This function only handles the internal weights

function [Aedges] = RE_right(Qedges,rdir0,rmag0,rdirr,rmagr)

if rdir0 >12
    error('The raythic field needs to have directions specified by 0 to 12. For downward directions please use 12 minus value')
end
    
if rdirr >12
    error('The raythic field needs to have directions specified by 0 to 12. For downward directions please use 12 minus value')
end

Aedges = zeros(size(Qedges,1));

D2 = (sqrt(10)-3)/2;
B = sqrt(2)-1;
C = sqrt(5)-2;
D1 = (3*sqrt(10)-9)/2;


masterRayth = [D1 C B D2 C D1];

if rdir0 == 0
    rdir0 = 13;
end
if rdirr == 0
    rdirr = 13;
end

% R = [00 00 08 00 06 00 00;
%      00 00 09 00 05 00 00;
%      12 11 10 07 04 03 02;
%      00 00 13 00 01 00 00;
%      14 15 16 19 22 23 24;
%      00 00 17 00 21 00 00;
%      00 00 18 00 20 00 00];

Wmaster = ...
       [0 0 1 0 0 0;...
        1 0 1 0 0 1;...
        0 0 1 0 1 0;...
        0 0 1 0 0 0;...
        0 0 0 0 1 0;...
        0 0 0 1 0 0;...
        0 0 0 0 0 0;...
        0 0 0 1 0 0;...
        0 1 0 0 0 0;...
        0 0 1 0 0 0;...
        0 0 1 0 1 0;...
        1 0 1 0 0 1
        1 1 1 1 1 1];
       
   
    
rayth0 = (Wmaster(rdir0,:)*(1/rmag0)-(Wmaster(rdir0,:)-1)*(rmag0));
raythr = (Wmaster(rdirr,:)*(1/rmagr)-(Wmaster(rdirr,:)-1)*(rmagr));
rayth = rayth0.*raythr;
rayth = sqrt(rayth);
masterRayth = rayth.*masterRayth;
 
 for i = 1:size(Qedges,2)
        Aedges(i) = masterRayth(1,Qedges(i));
 end
    
end  