%Raythic Field specification
%23 May 2020
%Art Terlep
%Purdue University ECE, PNG Group

%This function allows the user to specify a raythic field equivalent to a
%vector field input. Right now, this function is manual, but in the future
%it will convert an arbitrary vector field into a raythic field. 


%The next version of this function will take into account current distance
%as well to make this a cellular automata function. 

function [rdir,rmag] = rfield(size_m,size_n)

%Isotropic raythic field
rdir = 0*ones(size_m,size_n);
%rdir carries values from 0 to 12 
%with a single symmetry on a 24-gon
rmag = 1*ones(size_m,size_n);
%rmag is the amount of bias along rdir


% rdir bias = 
%     [00 00 08 00 06 00 00;
%      00 00 09 00 05 00 00;
%      12 11 10 07 04 03 02;
%      00 00 01 00 01 00 00;
%      02 03 04 07 10 11 12;
%      00 00 05 00 09 00 00;
%      00 00 06 00 08 00 00];



for i  =1:size_m
    for j = 1:size_n
        angl(i,j) = atan2((i-100),(j-100));
        angl(i,j) = -angl(i,j);
        if angl(i,j) < 0
            angl(i,j) = angl(i,j) +pi;
        end
%         if angl(i,j) > 2*pi -0.0001
%             angl(i,j) = 0;
%         end
        r01 = min(abs(angl(i,j)-atan2(0,1)),abs(angl(i,j)-(pi+atan2(0,1))));
        r02 = abs(angl(i,j)-atan2(1,3));
        r03 = abs(angl(i,j)-atan2(1,2));
        r04 = abs(angl(i,j)-atan2(1,1));
        r05 = abs(angl(i,j)-atan2(2,1));
        r06 = abs(angl(i,j)-atan2(3,1));
        r07 = abs(angl(i,j)-atan2(1,0));
        r08 = abs(angl(i,j)-atan2(3,-1));
        r09 = abs(angl(i,j)-atan2(2,-1));
        r10 = abs(angl(i,j)-atan2(1,-1));
        r11 = abs(angl(i,j)-atan2(1,-2));
        r12 = abs(angl(i,j)-atan2(1,-3));
        
        RR = [r01 r02 r03 r04 r05 r06 r07 r08 r09 r10 r11 r12];
        [M,I] = min(RR);
        clear M
        rdir(i,j) = I;
        
        %Strength proportional to radius from 100,100
%         rmag(i,j) = 30*(1-exp(-12*(((1/212)*sqrt((100-i)^2+(100-j)^2)))^2))+0.1;
        rmag(i,j) = 6; 

%         if rmag(i,j) > 15
%             rmag(i,j) = 30;
%         end
    end
end


rdirh = rdir;
rdirh(rdir== 4) = 10;
rdirh(rdir== 10) = 4;

rdirh(rdir== 05) = 09;
rdirh(rdir== 09) = 05;

rdirh(rdir== 08) = 06;
rdirh(rdir== 06) = 08;

rdirh(rdir== 11) = 03;
rdirh(rdir== 03) = 11;

rdirh(rdir== 12) = 02;
rdirh(rdir== 02) = 12;

% rdir = rdirh; %turn on for hyper

for i =1:size_m
    for j = 1:size_n
        rdir(i,j) = rdir(i,j)+5;  
        if rdir(i,j) >= 13
            rdir(i,j) = rdir(i,j) - 12;
        end
    end
end

%Duplicate the rdir across the image
% spacer = rdir(100-10:100+10,100-10:100+10);
% spacer = [spacer spacer spacer spacer spacer spacer spacer...
%     spacer spacer spacer spacer];
% spacer = [spacer; spacer; spacer; spacer; spacer; spacer; spacer;...
%     spacer; spacer; spacer; spacer];
% 
% spacer = spacer(1:212,1:212);
% rdir = spacer;
