%mars1
clear

load('root3.mat')
% load('cameramanHI.mat')
% load('testplate3.mat')
% load('ladymini.mat')
% load('peppers.mat')
% load('mich.mat')
% load('conway.mat')
% load('lensTest.mat')



coordi = 8;
coordj = 102;


count = 1;
Z = root3;
% Z(0.2<Z<0.9) = 0.8;
% Z(1:end,35:39) = 0.3;
% Z(1:end,40:43) = 0.6;

%size of desired grid
size_m = size(Z,1);
size_n = size(Z,2);

%Image process
%Apply Beta distribution weighting scheme (more binary-like bias to image space)
% a = 5; %higher a than b pushes to favor only strong signal
% b = 1; %higher a and b pushes to have a steper cut off
% Z = betaImage(Z,size_m,size_n,a,b);
% % Z(Z<0.8) = 0.1;
% Z((Z<=1)&(Z>0.8)) = 0.8;
% imageF(((1>imageF)&(imageF>0.05))) = 0.5;




%% Mainbody

[distSP,prevSP] = Dijk_v5_Aniso(1,1,Z,coordi,coordj,0,1);
distbSP = distSP;
prevbSP = prevSP;
% distb(:,:,count) = sin(2*pi*freq*distbSP(:,:,count));
distb = distSP;

[distSP,prevSP] = Dijk_v5_Aniso(1,0,Z,coordi,coordj,0,1);
dist1SP = distSP;
prev1SP = prevSP;
% dist1(:,:,count) = sin(2*pi*freq*dist1SP(:,:,count));
dist1 = dist1SP;


[distSP,prevSP] = Dijk_v5_Aniso(2,0,Z,coordi,coordj,0,1);
dist2SP = distSP;
prev2SP = prevSP;
% dist2(:,:,count) = sin(2*pi*freq*dist2SP(:,:,count));
dist2 = dist2SP;

[distSP,prevSP] = Dijk_v5_Aniso(3,0,Z,coordi,coordj,0,1);
dist3SP = distSP;
prev3SP = prevSP;
% dist3(:,:,count) = sin(2*pi*freq*dist3SP(:,:,count));
dist3 = dist3SP;

[distSP,prevSP] = Dijk_v5_Aniso(4,0,Z,coordi,coordj,0,1);
dist4SP = distSP;
prev4SP = prevSP;
% dist4(:,:,count) = sin(2*pi*freq*dist4SP(:,:,count));
dist4 = dist4SP;

distsum(:,:,count) = 0.25*(dist1(:,:,count)+dist2(:,:,count)+dist3(:,:,count)+dist4(:,:,count));


%%
