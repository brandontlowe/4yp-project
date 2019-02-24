function PlotVisited(visitedmatrix,obstmat,goal)
%PLOTVISITED Plots the visited nodes on a grid

% map = [1 1 1; 0 0 0];
% obstmap = [0 0 0; 1 0 0];
% 
% figure;
% pcolor(obstmat)
% colormap(obstmap);
% 
% hold off
% 
% figure;
% pcolor(visitedmatrix)
% colormap(map);
% title('Visited Nodes')

newmat = visitedmatrix + obstmat;
newmat(goal(1),goal(2)) = 3;

map = [1 1 1; 0 0 1; 0 0 0; 1 0 0];

figure;
pcolor(newmat)
colormap(map)
title('Visited Nodes')

end

