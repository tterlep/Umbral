clear dist1M dist2M dist3M dist4M distsumM counte phi distsumMM clear

freq = 0.05;

dist1M(:,:,1) = dist1*0;
dist2M(:,:,1) = dist2*0;
dist3M(:,:,1) = dist3*0;
dist4M(:,:,1) = dist4*0;

counte = 0;
for phi = pi/500:pi/500:pi*2
    counte = counte+1;
    
%     wv1 = exp(-dist1).*sin(phi+2*pi*freq*dist1);
%     wv2 = exp(-dist2).*sin(phi+2*pi*1*freq*dist2);
%     wv3 = exp(-dist3).*sin(phi+2*pi*1*freq*dist3);
%     wv4 = exp(-dist4).*sin(phi+2*pi*1*freq*dist4);

%     wv1 = (1./dist1).^(0.1).*sin(phi+2*pi*freq*dist1);
%     wv2 = (1./dist2).^(0.1).*sin(phi+2*pi*1*freq*dist2);
%     wv3 = (1./dist3).^(0.1).*sin(phi+2*pi*1*freq*dist3);
%     wv4 = (1./dist4).^(0.1).*sin(phi+2*pi*1*freq*dist4);

    wv1 = sin(phi+2*pi*freq*dist1);
    wv2 = sin(phi+2*pi*freq*dist2);
    wv3 = sin(phi+2*pi*freq*dist3);
    wv4 = sin(phi+2*pi*freq*dist4);

%     wv1(wv1>0) = 1;
%     wv1(wv1<=0) = 0;
%     wv2(wv2>0) = 1;
%     wv2(wv2<=0) = -1;
%     wv3(wv3>0) = 1;
%     wv3(wv3<=0) = -1;
%     wv4(wv4>0) = 1;
%     wv4(wv4<=0) = -1;

    %packet
%     packmin = 70;
%     packmax = 80;
    wt1 = wv1;
    wt2 = wv2;
    wt3 = wv3;
    wt4 = wv4;
%     wt1(dist1<packmin) = 0;
%     wt1(dist1>=packmin) = wv1(dist1>=packmin);
%     wt1(dist1>packmax) = 0;
%     wt2(dist2<packmin) = 0;
%     wt2(dist2>=packmin) = wv2(dist2>=packmin);
%     wt2(dist2>packmax) = 0;
%     wt3(dist3<packmin) = 0;
%     wt3(dist3>=packmin) = wv3(dist3>=packmin);
%     wt3(dist3>packmax) = 0;
%     wt4(dist4<packmin) = 0;
%     wt4(dist4>=packmin) = wv4(dist4>=packmin);
%     wt4(dist4>packmax) = 0;

    dist1M(:,:,counte) = wt1;
    dist2M(:,:,counte) = wt2;
    dist3M(:,:,counte) = wt3;
    dist4M(:,:,counte) = wt4;
    distsumM(:,:,counte) = abs(dist1M(:,:,counte)+dist2M(:,:,counte)+dist3M(:,:,counte)+dist4M(:,:,counte))/4;
end
distsumMM = sum(distsumM,3)/size(distsumM,3);

Zp = Z;
% a = 0.1; %higher a than b pushes to favor only strong signal
% b = 2; %higher a and b pushes to have a steper cut off
% Zp = betaImage(Z,size_m,size_n,a,b);

fig = figure(1);
tiledlayout(2,4) 

nexttile
imagesc(Zp)
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc(distsumMM)
hold on
scatter(zlc(:,2),zlc(:,1),'x','MarkerFaceColor',[1 0.1 0.1])
hold off
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap jet
colorbar

nexttile
imagesc(dist1M(:,:,1))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap jet
colorbar

nexttile
imagesc((abs(dist2M(:,:,1))))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap jet
colorbar

nexttile
imagesc((abs(dist1M(:,:,1)-dist3M(:,:,1))))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc((abs(dist2M(:,:,1)-dist4M(:,:,1))))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc((abs(distsumM(:,:,1))))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc((distsum))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar
