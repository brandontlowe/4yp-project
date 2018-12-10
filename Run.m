clear all
n = 50;
start = [2; 2];
goal = [25; 25];
visitedmatrix = zeros(n);

frontier = Frontier(2,2,n);
camefrom = CameFrom(n);
camefrom.Put(2,2,0,0);
costsofar = CostSoFar(n);
costsofar.Put(start(1),start(2),0);

while frontier.Empty ~= 1
    
    [current1, current2] = frontier.Get;
    
    if current1 == goal(1) && current2 == goal(2)
        break
    end
    
    neighbours = GraphNeighbours(current1,current2);
    
    for i = 1:length(find(neighbours(1,:)))
        next = neighbours(:,i);
        
        newcost = costsofar.Get(current1,current2) + 1;
        if costsofar.Check(next(1), next(2)) == 0 || newcost < costsofar.Get(next(1), next(2))
            costsofar.Put(next(1), next(2), newcost);
            priority = newcost + norm(next(1) - goal(1), next(2) - goal(2));
            frontier.Put(next(1), next(2), priority);
            camefrom.Put(next(1),next(2),current1,current2)
        end
    end
    
    visitedmatrix = UpdateVisitedMatrix(visitedmatrix, [current1; current2]);


end

path = FindPath(goal, camefrom, n);
PlotPath(path,start,goal,n)
PlotVisited(visitedmatrix)