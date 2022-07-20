%mars1
clearvars -except idx4 id4 filename

load('root3.mat')
load('lensTest.mat')
load('newimage.mat')
load('cameraman.mat')

zlcmaster(:,1) = [40]; %; 180; 180];
zlcmaster(:,2) = [40]; %; 180; 50];

for multicount = 1:size(zlcmaster,1)
    zlc(:,1) = zlcmaster(multicount,1);
    zlc(:,2) = zlcmaster(multicount,2);
    %[10*size(zlc,2)];
    % zlc(3,2) = 10;
%     Z = lensTest;
%     Z = root3;
Z = cameraman;
%        Z = newimage;
%        Z(Z<0.5) = 0.5;

%     Z = [Z(1:100,:) ones(100,100)];
%     Z((0.2<Z) & (Z<0.9))=1/1.5;
    % Z(Z==1) = 0.8;
    % Z(Z==0.5) = 1;
    % Z(Z>0.8) = 0.7;
    % Z(Z>=0.8) = 1;

%     Z = ones(100,200);
%     Z(28:32,20:40) = 0.5;
%     Z(60:80,55:75) = 1/1.5;
    % Z(1:100,50:54) = 0.0001;
    % Z(1:100,50:54) = 0.0001;

    count = 1;

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

    [distb(:,:,multicount),prevb(:,:,multicount)] = Dijk_v6(1,1,Z,zlc,0,1);

    [dist1(:,:,multicount),prev1(:,:,multicount)] = Dijk_v6(1,0,Z,zlc,0,1);

    [dist2(:,:,multicount),prev2(:,:,multicount)] = Dijk_v6(2,0,Z,zlc,0,1);

    [dist3(:,:,multicount),prev3(:,:,multicount)] = Dijk_v6(3,0,Z,zlc,0,1);

    [dist4(:,:,multicount),prev4(:,:,multicount)] = Dijk_v6(4,0,Z,zlc,0,1);


end
