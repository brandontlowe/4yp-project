clear all
n = 50;
start = [2; 2];
goal = [25; 25];
visitedmatrix = zeros(n);
obstmat = zeros(n);
obstmat(23:26,20:23) = 2*ones(4);
obstmat(3:5,1:30) = 2*ones(3,30);

frontier = Frontier(2,2,n);
camefrom = CameFrom(n);
camefrom.Put(2,2,0,0);
costsofar = CostSoFar(n);
costsofar.Put(start(1),start(2),0);

counter = 1

while frontier.Empty ~= 1
    
    [current1, current2] = frontier.Get;
    

    if current1 == goal(1) && current2 == goal(2)
        break
    end
    
    neighbours = GraphNeighbours(current1,current2,n)
    
    for i = 1:length(find(neighbours(1,:)))
        next = neighbours(:,i);
        
        counter = counter + 1
        
        if obstmat(next(1),next(2)) ~= 2 && next(1) > 0 && next(2) > 0 && next(1) <= n && next(2) <= n
            newcost = costsofar.Get(current1,current2) + 1;
            if costsofar.Check(next(1), next(2)) == 0 || newcost < costsofar.Get(next(1), next(2))
                costsofar.Put(next(1), next(2), newcost);
                priority = newcost + norm([next(1) - goal(1); next(2) - goal(2)],2);
                frontier.Put(next(1), next(2), priority);
                camefrom.Put(next(1),next(2),current1,current2)
            end
                visitedmatrix = UpdateVisitedMatrix(visitedmatrix, [current1; current2]);
        end
    end
    



end

path = FindPath(goal, camefrom, n);
PlotPath(path,start,goal,n)
PlotVisited(visitedmatrix,obstmat,goal)