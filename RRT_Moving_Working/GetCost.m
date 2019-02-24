function d = GetCost(x1,x2)
%GETCOST Calculates the cost or loss of traversing from state x1 to state
%x2

    xd = x2 -x1;                                                             % Find vector xd from x1 to x2
    xd(3:4) = [10*xd(3); 100*xd(4)];                                         % Scale (delta) theta and f for weighting
    d = norm(xd);                                                            % Calculate 2-norm of xd
end

