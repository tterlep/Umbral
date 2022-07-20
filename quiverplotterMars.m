%quiverplotter

[X,Y] = meshgrid(1:size_n,1:size_m);
dp = zeros(size_m,size_n,2);

for i = 1:size_m
    for j = 1:size_n
        [dp(i,j,1),dp(i,j,2)] = coordvertI(prevS1(i,j),size_n);
        if dp(i,j,1) == 0 || dp(i,j,2) == 0
            dp(i,j,1) = i;
            dp(i,j,2) = j;
        end
    end
end
U = dp(:,:,2);
V = dp(:,:,1);
U = 0.8*(U-X);
V = 0.8*(V-Y);
figure(4)
imagesc(Z)
colormap bone

hold on
q = quiver(X,Y,U,V,0,'r');
q.LineWidth = 1;
% axis equal
% grid
% text(p1(1),p1mmn m n  n n  nmmm    (2), sprintf('(%.0f,%.0f)',p1))
% text(p2(1),p2(2), sprintf('(%.0f,%.0f)',p2))
