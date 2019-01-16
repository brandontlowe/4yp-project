function d = GetDistance(x1,x2)
%RETURNDISTANCE Returns the Euclidean distance between two 2D position
%vectors

    xd = x2 -x1;                % Find vector xd from x1 to x2
    d = norm(xd);               % Calculate 2-norm of xd
end

