function xnear = NearestNeighbour(T, xrand)
%NEARESTNEIGHBOUR Finds nearest graph neighbour for RRT implementation
%   Returns the node of T that is closest to position xrand (giving equal
%   weight to the four state coordinates)

    nodemat = table2array(T.Nodes);
    
    xrandmat = zeros(T.numnodes,4);                                           % Create matrix where each row is xrand'
    xrandmat(:,1) = xrand(1);
    xrandmat(:,2) = xrand(2);
    xrandmat(:,3) = xrand(3);
    xrandmat(:,4) = xrand(4);
    
%     relmat = nodemat - xrandmat;                                            % Create matrix of relative vectors (each row)
%     distmat = relmat(:,1).^2 + relmat(:,2).^2;                              % Calculate distance(^2) for each node
    
    xrelmat = nodemat - xrandmat;                                             % Create matrix of relative vectors (each row)
    distvec = xrelmat(:,1).^2 + xrelmat(:,2) + 0*xrelmat(:,3) + 30*xrelmat(:,4); % Calculate distance(^2) for each node, giving equal weight to each coordinate
    
    [~, index] = min(distvec);                                                % Find index of closest node
    xnear = (table2array(T.Nodes(index,:)))';                                 % Set xnear to coords of closest node

end

