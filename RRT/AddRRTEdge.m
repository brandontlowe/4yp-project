function newT = AddRRTEdge(T, x1, x2)
%ADDRRTEDGE Adds an edge to RRT graph T by joining up nodes with coordinates
%given by x1 and x2
%   Node inputs must be 2x1 vectors
    
    nodemat = table2array(T.Nodes);
    
    [x1tf, x1index] = ismember(x1', nodemat, 'rows');
    [x2tf, x2index] = ismember(x2', nodemat, 'rows');
    
    dist = GetDistance(x1,x2);          % Calculate distance between x1, x1
    newT = T.addedge(x1index, x2index,dist);
    
end

