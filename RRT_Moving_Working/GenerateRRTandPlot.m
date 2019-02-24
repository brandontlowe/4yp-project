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
%    xnew = xinit;
    
    for k = 1:K
        xnew = NewState(xinit, n);
        xnear = NearestNeighbour(tree, xnew);
        tree = AddRRTNode(tree, xnew);
        tree = AddRRTEdge(tree, xnew, xnear);
        
        % Plot after each iteration
        figure(f1)
        clf
        plot(tree,'XData',tree.Nodes.x,'YData',tree.Nodes.y);
        hold on
        quiver(tree.Nodes.x, tree.Nodes.y, (tree.Nodes.f).*cos(tree.Nodes.theta), (tree.Nodes.f).*sin(tree.Nodes.theta));
        title('RRT')
        xlabel('x')
        ylabel('y')
        axis([0 n 0 n])

    end
end

