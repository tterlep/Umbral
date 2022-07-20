clear im distsumM distsumMM distsumMM2 distsumBB distsumBB2 dist1M dist2M dist3M dist4M distbM distsumM counte phi distsumMM wv1 wv2 wv3 wv4 wt1 wt2 wt3 wt4
% filename = 'root1.gif';
% filename2 = 'falseroot1.gif';

% digits(4);

phimax = 5000;

distsumMM = zeros(size(dist1,1),size(dist1,2));
distsumBB = zeros(size(dist1,1),size(dist1,2));

idx = 0;
for counts = 1:multicount
    for freq = [0.07]
        idx = 1+idx;
        distsumB = zeros(size(dist1,1),size(dist1,2),phimax);
        distsumM = zeros(size(dist1,1),size(dist1,2),phimax);
        dist1M = zeros(size(dist1,1),size(dist1,2),phimax);
        dist2M = zeros(size(dist1,1),size(dist1,2),phimax);
        dist3M = zeros(size(dist1,1),size(dist1,2),phimax);
        dist4M = zeros(size(dist1,1),size(dist1,2),phimax);
        distbM = zeros(size(dist1,1),size(dist1,2),phimax);
        for counte = 1:1:phimax
            phi = (counte/(phimax))*2*pi;

            %     wv1 = exp(-dist1).*sin(phi+2*pi*freq*dist1);
            %     wv2 = exp(-dist2).*sin(phi+2*pi*1*freq*dist2);
            %     wv3 = exp(-dist3).*sin(phi+2*pi*1*freq*dist3);
            %     wv4 = exp(-dist4).*sin(phi+2*pi*1*freq*dist4);

            %     wv1 = (1./dist1(:,:,counts)).^(0.1).*sin(phi+2*pi*freq*dist1(:,:,counts));
            %     wv2 = (1./dist2(:,:,counts)).^(0.1).*sin(phi+2*pi*freq*dist2(:,:,counts));
            %     wv3 = (1./dist3(:,:,counts)).^(0.1).*sin(phi+2*pi*freq*dist3(:,:,counts));
            %     wv4 = (1./dist4(:,:,counts)).^(0.1).*sin(phi+2*pi*freq*dist4(:,:,counts));

            wv1 = sin(phi+2*pi*freq*dist1(:,:,counts));
            wv2 = sin(phi+2*pi*freq*dist2(:,:,counts));
            wv3 = sin(phi+2*pi*freq*dist3(:,:,counts));
            wv4 = sin(phi+2*pi*freq*dist4(:,:,counts));
            wvb = sin(phi+2*pi*freq*distb(:,:,counts));

            %             wv1 = sin((0.7*counts/multicount)*2*pi+phi+2*pi*freq*dist1(:,:,counts));
            %             wv2 = sin((0.7*counts/multicount)*2*pi+phi+2*pi*freq*dist2(:,:,counts));
            %             wv3 = sin((0.7*counts/multicount)*2*pi+phi+2*pi*freq*dist3(:,:,counts));
            %             wv4 = sin((0.7*counts/multicount)*2*pi+phi+2*pi*freq*dist4(:,:,counts));
            %             wvb = sin((0.7*counts/multicount)*2*pi+phi+2*pi*freq*distb(:,:,counts));
            %
            %                 wv1(wv1>0) = 1;
            %                 wv1(wv1<=0) = -1;
            %                 wv2(wv2>0) = 1;
            %                 wv2(wv2<=0) = -1;
            %                 wv3(wv3>0) = 1;
            %                 wv3(wv3<=0) = -1;
            %                 wv4(wv4>0) = 1;
            %                 wv4(wv4<=0) = -1;
            %                 wvb(wvb>0) = 1;
            %                 wvb(wvb<=0) = -1;

            %packet
            %     packmin = 70;
            %     packmax = 80;
            wt1 = wv1;
            wt2 = wv2;
            wt3 = wv3;
            wt4 = wv4;
            wtb = wvb;
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
            distbM(:,:,counte) = wtb;
            distsumM(:,:,counte) = dist1M(:,:,counte)+dist2M(:,:,counte)+dist3M(:,:,counte)+dist4M(:,:,counte);
        end
    end
    distsumM = abs(distsumM)/4;
    distsumB = abs(distbM);
    distsumBB = 0.5*pi*sum(distsumB,3)/phimax;
    distsumMM = 0.5*pi*sum(distsumM,3)/phimax;
    if counts == 1
        distsumMM2 = distsumMM;
        distsumBB2 = distsumBB;
    else 
        distsumMM2 = max(distsumMM2,distsumMM);
        distsumBB2 = max(distsumBB2,distsumBB);
    end
end
    Zp = Z;
%     Z(40:60,40:60) = 0.6;;
% a = 0.1; %higher a than b pushes to favor only strong signal
% b = 2; %higher a and b pushes to have a steper cut off
% Zp = betaImage(Z,size_m,size_n,a,b);

%     fig = figure(2);
%     imagesc(distsumMM2)
%     ax = gca;
%     ax.YDir = 'reverse';
%     ax.XDir = 'normal';
%     colormap bone
%     drawnow
%     frame = getframe(fig);
%     im(:,:,:,idx) = frame2im(frame);
%     [A,map] = rgb2ind(im(:,:,:,idx),256);
%     if idx == 1
%         imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',1);
%     else
%         imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',1);
%     end
%
%     fig = figure(3);
%     imagesc(distsumBB2)
%     ax = gca;
%     ax.YDir = 'reverse';
%     ax.XDir = 'normal';
%     colormap bone
%     drawnow
%     frame = getframe(fig);
%     im2(:,:,:,idx) = frame2im(frame);
%     [A2,map2] = rgb2ind(im2(:,:,:,idx),256);
%     if idx == 1
%         imwrite(A2,map2,filename2,'gif','LoopCount',Inf,'DelayTime',1);
%     else
%         imwrite(A2,map2,filename2,'gif','WriteMode','append','DelayTime',1);
%     end
% end

fig = figure(1);
tiledlayout(2,4)

nexttile
imagesc(Zp)
hold on
scatter(zlcmaster(:,2),zlcmaster(:,1),'x','MarkerFaceColor',[1 0.1 0.1])
hold off
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc(distsumMM)
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap jet
colorbar

nexttile
imagesc(distsumMM2)
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap jet
colorbar

nexttile
imagesc(dist2M(:,:,1))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap jet
colorbar

nexttile
imagesc(dist3M(:,:,1))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc(dist4M(:,:,1))
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc(distsumBB)
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar

nexttile
imagesc(distsumBB2)
ax = gca;
ax.YDir = 'reverse';
ax.XDir = 'normal';
colormap bone
colorbar



