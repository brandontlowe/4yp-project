function PlotPath(path,start,goal,n)
%PLOTPATH Plots the path from start to goal on a grid

pathmatrix = PathMatrix(path,start,goal,n);

map = [1 1 1;           % Define colormap so that integers 0 to 3 give diff colors
    0 0 1
    0 1 0
    1 0 0
    0 0 0];

%pathmatrix = pathmatrix +2*obstmatrix;

figure;
pcolor(pathmatrix)
colormap(map)
title('Path from start to goal')
end

