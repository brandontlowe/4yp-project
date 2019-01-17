function xnear = NearestNeighbour(T, xrand)
%NEARESTNEIGHBOUR Finds nearest graph neighbour for RRT implementation
%   Returns the node of T that). is closest to position xrand

    nodemat = table2array(T.Nodes);
    
    xrandmat = zeros(T.numnodes,2);                   % Create matrix where each row is xrand'
    xrandmat(:,1) = xrand(1);
    xrandmat(:,2) = xrand(2);
    
    relmat = nodemat - xrandmat;                      % Create matrix of relative vectors (each row)
    distmat = relmat(:,1).^2 + relmat(:,2).^2;        % Calculate distance(^2) for each node
    
    [m, index] = min(distmat);                        % Find index of closest node
    xnear = (table2array(T.Nodes(index,:)))';         % Set xnear to coords of closest node

end

