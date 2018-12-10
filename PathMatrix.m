function matrix = PathMatrix(path,start,goal,n)
%PATHMATRIX Finds and prints a matrix showing the completed path found
%using A*.
%   Simply sets all elements in path array to 1, elements not in path are 0

matrix = zeros(n);

    for i = 1:length(find(path(1,:)))
        if (path(1,i) ~= start(1) || path(1,i) ~= start(2)) && (path(1,i) ~= goal(1) || path(2,i) ~= goal(2))
            matrix(path(1,i), path(2,i)) = 1;
        else
            if path(1,i) == start(1) && path(2,i) == start(2)
                matrix(path(1,i), path(2,i)) = 2;
            else
                if path(1,i) == goal(1) && path(2,i) == goal(2)
                    matrix(path(1,i), path(2,i)) = 3;
                end
            end
        end
    end
    
end

