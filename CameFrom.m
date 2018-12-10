classdef CameFrom < handle
    %CameFrom Matrices consisting of visited nodes and the nodes they came
    %from
    %   Two 2x(n^2) matrices. One consisting of visited nodes, the other
    %   consising of the nodes from which they came (which share the same
    %   index).
    
    properties
        visited
        camefrom
    end
    
    methods
        function obj = CameFrom(n)
            %CameFrom Construct an instance of this class
            %   Creates a CameFrom object for a grid of order n (i.e. an
            %   nxn grid).
            obj.visited = zeros(2,n^2);
            obj.camefrom = zeros(2,n^2);
        end
        
        function index = GetNextIndex(obj)
            % This function receives the lowest non-zero index in the
            % visited array (which should also be the same for the camefrom
            % array)
            if obj.visited(:,1) == [0 0]'
                index = 1;
            else
                index = find(obj.visited(1,:),1, 'last') + 1;
            end
        end
        
        function index = FindElement(obj, x, y)
            % This function receives the index of the node [x, y]' in the
            % visited array
            indexlist1 = find(obj.visited(1,:) == x);               % Find matching entries in x
            indexlist2 = find(obj.visited(2,:) == y);               % Matching entries in y
            
            index = intersect(indexlist1,indexlist2);               % True index given by intersection ofthe lists
            
        end
        
        function Put(obj, x, y, xc, yc)
            %Put Add a visited point to the object
            %   The visited node gets added to visited, the node on the
            %   path prior to the visited node gets added to camefrom. This
            %   is to be used for adding a new visited node OR updating the
            %   camefrom entry for a node that has already been visited
            
            i = obj.FindElement(x, y);
            if isempty(i)
                i = obj.GetNextIndex;           % Append entry if [x,y] hasn't already been visited
                
                obj.visited(1,i) = x;
                obj.visited(2,i) = y;
                
                obj.camefrom(1,i) = xc;
                obj.camefrom(2,i) = yc;
                
            else
                obj.camefrom(1,i) = xc;         % If an entry for [x, y] already exists,
                obj.camefrom(2,i) = yc;         % update it
                
            end
        end
        
        
        function [xfrom, yfrom] = Get(obj, x, y)
            % Finds the node from which [x y] came
            i = obj.FindElement(x, y);
            out = obj.camefrom(:,i);
            xfrom = out(1); 
            yfrom = out(2);
            
        end
    end
    
    
end

