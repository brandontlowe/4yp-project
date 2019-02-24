function newT = AddRRTEdge(T, x1, x2)
%ADDRRTEDGE Adds an edge to RRT graph T by joining up nodes with states
%given by x1 and x2
%   Node inputs must be 4x1 vectors
    
    nodemat = table2array(T.Nodes);
    
    [~, x1index] = ismember(x1', nodemat, 'rows');
    [~, x2index] = ismember(x2', nodemat, 'rows');
    
    cost = GetCost(x1,x2);                                                   % Calculate distance between x1, x2
    newT = T.addedge(x1index, x2index, cost);
    
end

