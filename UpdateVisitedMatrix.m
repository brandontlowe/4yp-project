function matrix = UpdateVisitedMatrix(oldmatrix, current)
%VISITEDMATRIX Updates the matrix of visited nodes to include current

intmatrix = oldmatrix;
intmatrix(current(1),current(2)) = 1;
matrix = intmatrix;
end

