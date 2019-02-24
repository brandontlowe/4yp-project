goal = [800;800;0;0];
initial = [400;400;pi/4;0.2]
K = 30;
n = 1000;

nearest = initial;
dist = inf;

while dist > 60
T = GenerateRRTandPlot(nearest,K,n);
nearest = NearestNeighbour(T,goal);
dist = GetCost(nearest,goal);
end