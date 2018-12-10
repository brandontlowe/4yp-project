function PlotVisited(visitedmatrix)
%PLOTVISITED Plots the visited nodes on a grid

map = [1 1 1; 0 0 0];

figure;
pcolor(visitedmatrix)
colormap(map);
title('Visited Nodes')

end

