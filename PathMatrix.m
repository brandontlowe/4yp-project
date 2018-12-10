function matrix = PathMatrix(path,n)
%PATHMATRIX Finds and prints a matrix showing the completed path found
%using A*.
%   Simply sets all elements in path array to 1, elements not in path are 0

matrix = zeros(n);

    for i = 1:length(find(path(1,:)))
    matrix(path(1,i), path(2,i)) = 1;
    end
    
end

