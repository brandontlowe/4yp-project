classdef Frontier < handle
    %FRONTIER Frontier for A* algorithm
    %   The frontier consists of the next nodes to be explored.
    
    properties
        coordinates                    % A 3xn array, where n is the order of the square
                                       % grid. Each column is a position vector of a point
                                       % in the frontier with its priority
                                       % as the third entry.

        n                              % Order of the (square) grid being used                            
    end
    
    methods
        function obj = Frontier(x, y, order)
            %FRONTIER Construct an instance of this class
            %   Construct a frontier, with location [x,y] taken as the
            %   starting point for the implementation of A*
            if nargin == 3
                obj.coordinates = zeros(3, order^2);
                obj.coordinates(1,1) = x;
                obj.coordinates(2,1) = y;
                obj.n = order;
                
            end
        end
        function index = GetNextIndex(obj)
            % This function receives the lowest non-zero index in the
            % coordinates array
            if obj.coordinates(:,1) == [0 0 0]'
                index = 1;
            else
                index = find(obj.coordinates(1,:),1) + 1;
            end
        end
        
        function index = FindElement(obj, x, y)
            % This function receives the index of the node [x, y]' in the
            % coordinates array
            indexlist1 = find(obj.coordinates(1,:) == x);               % Find matching entries in x
            indexlist2 = find(obj.coordinates(2,:) == y);               % Matching entries in y
            
            index = intersect(indexlist1,indexlist2);               % True index given by intersection ofthe lists
            
        end
        function Put(obj,x, y, priority)
            % This function appends a position vector onto the the array
            % (replacing a zero vector)
            i = obj.FindElement(x, y);
            
            if isempty(i)
            
                i = obj.GetNextIndex;
                obj.coordinates(1,i) = x;
                obj.coordinates(2,i) = y;
            end
            
            obj.coordinates(3,i) = priority;
            transpose = (obj.coordinates)';                 % Intermediate transposed version of coordinates matrix
            transpose(1:i,:) = sortrows(transpose(1:i,:),3,'ascend');      % Sort Frontier by priority entries
            obj.coordinates = transpose';
        end
        
        function [x, y] = Get(obj)
            % Returns the first position vector in the Frontier 
            x = obj.coordinates(1,1);
            y = obj.coordinates(2,1);
                   
            obj.coordinates = circshift(obj.coordinates,-1, 2);
            obj.coordinates(:,(obj.n)^2) = [0; 0; 0];
        end
        function empty = Empty(obj)
            % Returns 1 if frontier is empty, else returns 0
            if Frontier == zeros(3,obj.n)
                empty = 1;
            else
                empty = 0;
            end
        end
        
    end
end