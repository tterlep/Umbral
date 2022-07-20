%Dijkstra's algorithm with raythic shortcuts
function [distSP,prevS] = Dijk_v5_Aniso(e_val,grph,Z,source_m,source_n,irdir,irmag)

%grph = 0 gives RE, 1 gives BE, 2 gives BE4

%23 May 2020
%Art Terlep
%Purdue University ECE, PNG Group

%This algorithm will do a search through a square grid space using raythic
%geometry to determine the length of pathways. Only the shortcut paths will
%be examined and not ALL pathways in the network. A full search across the
%entire network would singificantly increase compuational time and would
%not drastically improve the shortest path search result or estimated distance. 

tic
%% Global parameters

%determine which central vertex to use as the identity for RE matrices
%Later this needs to be changed to address merging all 4 e_vals to create phase contrast. 
% e_val = 1 %can be 1,2,3,4 This determines the orientation of the pathways

%set a distance threshold applied at the end
upthresh = 50000;

%size of desired grid
size_m = size(Z,1);
size_n = size(Z,2);

%specify source point
% source_m = 25;
% source_n = 25;
%defult image 


%% Image space


%import an image 
% load('root3.mat');
% imageS = root3;
% clear root3


imageS = Z;
% 


%find the size
sizeS_m = size(imageS,1);
sizeS_n = size(imageS,2);
%rescale to 0-1
scaleS = max(max(imageS));
% imageS = imageS/scaleS;

imageF = imageS;


%Apply Beta distribution weighting scheme (more binary-like bias to image space)
% a = 5; %higher a than b pushes to favor only strong signal
% b = 1.75; %higher a and b pushes to have a steper cut off
% imageF = betaImage(imageS,size_m,size_n,a,b);
% imageF((imageF<1)&imageF>0) = a;
% imageF(imageF<0.0001) = 0;

% imageF(((1>imageF)&(imageF>0.05))) = 0.5;

% Uncomment to produce a blank image
% imageF = ones(size_m,size_n);


%% Raythic field

%default field
%Isotropic raythic field
rdir = irdir*ones(size_m,size_n);
%rdir carries values from 0 to 12, 0 is non-directional 
%with a single symmetry on a 24-gon
rmag = irmag*ones(size_m,size_n);
%rmag is the amount of bias along rdir

%Uncomment to produce a global field effect. This will apply to RE and BE
%NB: This eventually needs to be modified to fit as part of the global search
%algorithm
% [rdir,rmag] = rfield(size_m,size_n);




%% Modified Dijkstra's implementation
undisc = ones(size_m,size_n);
distS = inf*ones(size_m,size_n);
prevS =  zeros(size_m,size_n);
prevS(source_m,source_n) = coordvert(source_m,source_n,size_n);
%g = coordvert(i,j,size_n)
%[i,j] = coodvertI(g,size_n)


distS(source_m,source_n) = 0;

%Rayth map. Each number here is the row of the R matrix where the first
%column of R indicates the i position of that number in this matrix.
R = [00 00 08 00 06 00 00;
     00 00 09 00 05 00 00;
     12 11 10 07 04 03 02;
     00 00 13 00 01 00 00;
     14 15 16 19 22 23 24;
     00 00 17 00 21 00 00;
     00 00 18 00 20 00 00];
 

%  while undisc(:,:) ~= inf*ones(size_n,size_m)
for count = 1:size_m*size_n %Ideally a while loop, but since we want all points...
     minmat = undisc.*distS;
     min_minmat = min(min(minmat));
     [u_i,u_j] = find(minmat == min_minmat);
     %in case there is more than one min point
     u_i = u_i(1);
     u_j = u_j(1);
     undisc(u_i,u_j) = inf;
     for r=1:24
%slower? version 4 sec vs. 11
%          i = R(r,1);
%          j = R(r,2);
         
         [i,j] = find(R==r);
         i =u_i+(i-4);
         j= u_j+(j-4);
%          
         if i>0 && i <= size_m && j>0 && j <= size_n
             if undisc(i,j) == 1
                 %For large images, we're just going to call a local subspace.
                 %for efficiency, we might want to call this differently?
                 %I don't know how to make this better though....
                 imageF_l = zeros(7,7);
                 rdir_l = zeros(7,7);
                 rmag_l = zeros(7,7);
                 for u_i_i = -3:3
                     for u_j_j = -3:3
                         if (u_i + u_i_i > size_m) || (u_i + u_i_i < 1) || ... 
                                 (u_j + u_j_j > size_n) || (u_j + u_j_j < 1)
                                      imageF_l(u_i_i+4,u_j_j+4) = 0;
                                      rdir_l(u_i_i+4,u_j_j+4) = 0;
                                      rmag_l(u_i_i+4,u_j_j+4) = 0;
                         else
                             imageF_l(u_i_i+4,u_j_j+4) = imageF(u_i+u_i_i,u_j+u_j_j);
                             rdir_l(u_i_i+4,u_j_j+4) = rdir(u_i+u_i_i,u_j+u_j_j);
                             rmag_l(u_i_i+4,u_j_j+4) = rmag(u_i+u_i_i,u_j+u_j_j);
                         end
                     end
                 end
                 
                 
                 
                 %distance function for RE grid graph
                 
                 if grph == 0
                    alt = distS(u_i,u_j) + REdist(r,imageF_l,rdir_l,rmag_l,e_val);
                 elseif grph ==1  
                   alt = distS(u_i,u_j) + BEdist(r,imageF_l,rdir_l,rmag_l);
                 elseif grph == 2
                    alt = distS(u_i,u_j) + BE4dist(r,imageF_l,rdir_l,rmag_l);
                 end
                 
                 if alt < distS(i,j)
                     distS(i,j) = alt;
                     g = coordvert(u_i,u_j,size_n);
                     prevS(i,j) = g;
                 end
             end
         end
     end   
end

toc 

% %
% %cutoff
distSP = distS;
distSP(distSP>upthresh) = upthresh;
% % downthresh = 500;
% % distSP(distSP<downthresh) = upthresh;
% % freq = 0.25*(2-sqrt(2))/2;
% % freq = .25;
% distSP = sin(2*pi*freq*distSP);


% figure(1)
% imagesc(imageF)
% % colormap bone;
% 
% figure(2)
% contour(distSP,50)
% ax = gca;
% ax.YDir = 'reverse';
% 
% figure(3)
% imagesc(-distSP)
% % colormap bone;
% ax = gca;
% ax.YDir = 'reverse';
% 

