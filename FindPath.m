function path = FindPath(goal,CameFrom)
%FINDPATH Returns the quickest path after implementation of A* algorithm
%   Once matrix implementation of A* has finished, call this function to
%   return the optimal path

path = goal;
current = goal;

while current ~= [0 0]'
    current = CameFrom.Get(current(1), current(2));
    path = [path, current];
end

