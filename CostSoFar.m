classdef CostSoFar < handle
    %CostSoFar matrices consisting of visited nodes and the cost (so far)
    %associated with reaching them
    %   A 2xn array and an n-dimensional array. The visited matrix consists
    %   of nodes visited so far (each position vector being a column), and
    %   the cost array consists of the cost so far associated with each
    %   node visited (associated cost has same index as position vector).
    
    properties
        visited
        cost
    end
    
    methods
        function obj = CostSoFar(n)
            %CostSoFar Construct an instance of this class
            %   Creates a CostSoFar object for a grid of order n (i.e. an
            %   nxn grid).
            obj.visited = zeros(2,n^2);
            obj.cost = zeros(1,n^2);
        end
        
        function index = GetNextIndex(obj)
            % This function receives the lowest non-zero index in the
            % visited array (which should also be the same for the camefrom
            % array)
            if obj.visited(:,1) == [0 0]'
                index = 1;
            else
                index = find(obj.visited(1,:),1,'last') + 1;
            end
        end
        
        function index = FindElement(obj, x, y)
            % This function receives the index of the node [x, y]' in the
            % visited array
            indexlist1 = find(obj.visited(1,:) == x);               % Find matching entries in x
            indexlist2 = find(obj.visited(2,:) == y);               % Matching entries in y
            
            index = intersect(indexlist1,indexlist2);               % True index given by intersection ofthe lists
            
        end
        
        function Put(obj, x, y, cost)
            %Put Add a visited point to the object
            %   The visited node gets added to visited, and its associated
            %   cost is added to cost. This is to be used for adding a new visited node,
            %   OR replacing the cost associated with it.
            
            i = obj.FindElement(x, y);
            
            if isempty(i)
                i = obj.GetNextIndex;
            
                obj.visited(1,i) = x;
                obj.visited(2,i) = y;
            
                obj.cost(i) = cost;
            
            else
                obj.cost(i) = cost;
            end
        end
        
        function cost = Get(obj, x, y)
            % Finds the cost so far associated with a node [x y]
            i = obj.FindElement(x, y);
            
            if isempty(i)
                cost = 0;
            else
                cost = obj.cost(i);
            end
        end
            
        function check = Check(obj,x,y)
            % Returns a 1 if a node is already in the visited matrix, else
            % returns 0
            indexlist1 = find(obj.visited(1,:) == x);
            indexlist2 = find(obj.visited(2,:) == y);
            
            match = intersect(indexlist1,indexlist2);
            check = not(isempty(match));
        end
        
    end
end

