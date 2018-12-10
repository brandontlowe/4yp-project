function path = FindPath(goal,CameFrom,n)
%FINDPATH Returns the quickest path after implementation of A* algorithm
%   Once matrix implementation of A* has finished, call this function to
%   return the optimal path

path = zeros(2,10*n);
current = goal;
index = 1;

while current(1) ~= 0 && current(2) ~= 0
    path(:,index) = current;
    [current(1), current(2)] = CameFrom.Get(current(1), current(2));
    index = index + 1;
end

