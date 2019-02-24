goal = [800;800;0;0];
initial = [400;400;pi;0.2];
K = 22;
n = 1000;

current = initial;
dist = inf;

f0 = figure;

P = graph;
goalgraph = CreateRRTGraph(goal);
goalgraph.Nodes.Name = {'Goal'}';

while dist > 20
T = GenerateRRTandPlot(current,goalgraph,K,n);
nearest = NearestNeighbour(T,goal);

icurr = GetNodeIndex(T, current);
inear = GetNodeIndex(T, nearest);

path = shortestpath(T,icurr,inear);
Pnew = subgraph(T,path);

newnodes = Pnew.Nodes;
newedges = Pnew.Edges;

P = P.addnode(newnodes);
P = P.addedge(newedges);

figure(f0)
clf
        plot(P,'XData',P.Nodes.x,'YData',P.Nodes.y);
        hold on
        plot(goalgraph,'-or','XData',goalgraph.Nodes.x,'YData',goalgraph.Nodes.y);
       quiver(P.Nodes.x, P.Nodes.y, (P.Nodes.f).*cos(P.Nodes.theta), (P.Nodes.f).*sin(P.Nodes.theta),2);
        title('Path')
        xlabel('x')
        ylabel('y')
        axis([0 n 0 n])

dist = GetCost(nearest,goal);
current = nearest;



end