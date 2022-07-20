%This function returns the weighted version of the anisorathic propagation
%This function only handles the internal weights

function [Aedges] = BE_internal(Qedges,rdir0,rmag0)

if rdir0 >12
    error(strcat(num2str(rdir0), '_The BE raythic field needs to have directions specified by 0 to 12. For downward directions please use 12 minus value'))
end
  

Aedges = zeros(size(Qedges,1));

O = 0.5;
B = sqrt(2)/2;
R = sqrt(5)/4;
G1 = sqrt(10)/6;
G2 = sqrt(10)/3;

masterRayth = [O G1 R B R G1   O G1 R B R G1   O G1 R B R G1   O G1 R B R G1 ...
    R R R R R R R R   G2 G2 G2 G2 G2 G2 G2 G2];

if rdir0 == 0
    for i = 1:size(Qedges,2)
        Aedges(i) = masterRayth(1,Qedges(i))*1/rmag0;
    end
else
    
% R = [00 00 08 00 06 00 00;
%      00 00 09 00 05 00 00;
%      12 11 10 07 04 03 02;
%      00 00 13 00 01 00 00;
%      14 15 16 19 22 23 24;
%      00 00 17 00 21 00 00;
%      00 00 18 00 20 00 00];
 

Wmaster =  ...
       [1 0 0 0 0 0   0 0 0 0 0 0   1 0 0 0 0 0   0 0 0 0 0 0   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0;...
        0 0 0 0 0 0   0 0 0 0 0 1   0 0 0 0 0 0   0 0 0 0 0 1   0 0 0 0 0 0 0 0   0 0 1 0 0 0 1 0;
        0 0 0 0 0 0   0 0 0 0 1 0   0 0 0 0 0 0   0 0 0 0 1 0   0 1 0 0 0 1 0 0   0 0 0 0 0 0 0 0;...
        0 0 0 0 0 0   0 0 0 1 0 0   0 0 0 0 0 0   0 0 0 1 0 0   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0;...
        0 0 0 0 0 0   0 0 1 0 0 0   0 0 0 0 0 0   0 0 1 0 0 0   1 0 0 0 1 0 0 0   0 0 0 0 0 0 0 0;...
        0 0 0 0 0 0   0 1 0 0 0 0   0 0 0 0 0 0   0 1 0 0 0 0   0 0 0 0 0 0 0 0   0 0 0 1 0 0 0 1;...
        0 0 0 0 0 0   1 0 0 0 0 0   0 0 0 0 0 0   1 0 0 0 0 0   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0;...
        0 0 0 0 0 1   0 0 0 0 0 0   0 0 0 0 0 1   0 0 0 0 0 0   0 0 0 0 0 0 0 0   1 0 0 0 1 0 0 0;...
        0 0 0 0 1 0   0 0 0 0 0 0   0 0 0 0 1 0   0 0 0 0 0 0   0 0 0 1 0 0 0 1   0 0 0 0 0 0 0 0;...
        0 0 0 1 0 0   0 0 0 0 0 0   0 0 0 1 0 0   0 0 0 0 0 0   0 0 0 0 0 0 0 0   0 0 0 0 0 0 0 0;...
        0 0 1 0 0 0   0 0 0 0 0 0   0 0 1 0 0 0   0 0 0 0 0 0   0 0 1 0 0 0 1 0   0 0 0 0 0 0 0 0;...
        0 1 0 0 0 0   0 0 0 0 0 0   0 1 0 0 0 0   0 0 0 0 0 0   0 0 0 0 0 0 0 0   0 1 0 0 0 1 0 0];...
        
 masterRayth = (Wmaster(rdir0,:)*(1/rmag0)-(Wmaster(rdir0,:)-1)*(rmag0))...
     .*masterRayth;
 
 for i = 1:size(Qedges,2)
        Aedges(i) = masterRayth(1,Qedges(i));
 end
    
end


        
        
    