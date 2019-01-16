function tree = GenerateRRT(xinit, K, n)
%GENERATERRT Implements RRT for pathfinding
%   Implements RRT where a (truncated) continuous plane is approximated by an nxn
%   grid. The weight of graph edges is simply given by the distance between
%   the coordinates corresponding to the two nodes.

%   xinit - initial coordinate vector
%   K - no iterations
%   n - grid dimension (see above)

    tree = CreateRRTGraph(xinit);
    
    for k = 1:K
        xrand = RandomState(n);
        xnear = NearestNeighbour(xrand, t);
        tree.addnode(tablexrand'); % CREATE ADDRRTNODE FUNCTION - MUST CONVERT VECTOR INTO A TABLE FOR LAST BIT TO WORK
        tree.addedge(xrand',xnear',GetDistance(xrand,xnear));
    end
end

