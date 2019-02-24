function tree = GenerateRRTandPlot(xinit, K, n)
%GENERATERRT Implements RRT for pathfinding
%   Implements RRT where a (truncated) continuous plane is approximated by an nxn
%   grid. The weight of graph edges is simply given by the distance between
%   the coordinates corresponding to the two nodes.

%   xinit - initial coordinate vector
%   K - no iterations
%   n - grid dimension (see above)

    tree = CreateRRTGraph(xinit);
    f1 = figure;
    
    for k = 1:K
        xrand = RandomState(n);
        xnear = NearestNeighbour(tree, xrand);
        tree = AddRRTNode(tree, xrand);
        tree = AddRRTEdge(tree, xrand, xnear);
        
        % Plot after each iteration
        figure(f1)
        plot(tree,'XData',tree.Nodes.x,'YData',tree.Nodes.y);
        title('RRT')
        xlabel('x')
        ylabel('y')
        axis([0 n 0 n])

    end
end

