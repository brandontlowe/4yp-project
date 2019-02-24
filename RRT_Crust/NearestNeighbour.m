function snear = NearestNeighbour(T, s)
%NEARESTNEIGHBOUR Finds nearest graph neighbour for RRT implementation
%   Finds the nearest neighbour in the tree T relative to new or goal state
%   x, using a metric that depends on velocity magnitude and orientation in
%   addition to Euclidean distance

% COST FUNCTION - c(s, snew) = norm(xnew - x) - 0.5*vhat*(xnew - x1)

    nodemat = table2array(T.Nodes);
    xmat = (nodemat(:,1:2))';
    vhatmat = [cos(nodemat(:,3)), sin(nodemat(:,3))]';
    
    xnew = s(1:2);
    
    
    
    costvec = zeros(T.numnodes,1);
    
    for i = 1:T.numnodes
        xdiff = xnew - xmat(:,i);
        vhat = vhatmat(:,i);
        costvec(i) = norm(xmat(:,i) - xnew) -0.7*dot(vhat,xdiff);
    end
    
%     pos = xrand(1:2);
%     v = [x(4)*cos(x(3)); x(4)*sin(x(3))];
%     vhat = v/norm(v);
%     
%     xrandmat = zeros(T.numnodes,4);                                           % Create matrix where each row is xrand'
%     xrandmat(:,1) = xrand(1);
%     xrandmat(:,2) = xrand(2);
%     xrandmat(:,3) = xrand(3);
%     xrandmat(:,4) = xrand(4);
%     
% %     relmat = nodemat - xrandmat;                                            % Create matrix of relative vectors (each row)
% %     distmat = relmat(:,1).^2 + relmat(:,2).^2;                              % Calculate distance(^2) for each node
%     
% %    xrelmat = nodemat - xrandmat;                                             % Create matrix of relative vectors (each row)
% %    distvec = xrelmat(:,1).^2 + xrelmat(:,2).^2 + 0*xrelmat(:,3) + (30*xrelmat(:,4)).^2; % Calculate distance(^2) for each node, giving equal weight to each coordinate
%     
%     costvec = zeros(T.numnodes,1);
%     
%     for i = 1:T.numnodes
%         costmat(i) = norm(nodemat(i,1:2) - pos) -0.5*nodemat(i,4)*cos(nodemat(
%     end

    [~, index] = min(costvec);                                                % Find index of closest node
    snear = (table2array(T.Nodes(index,:)))';                                 % Set xnear to coords of closest node

end

