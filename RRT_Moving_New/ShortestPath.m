function P = ShortestPath(T,s1,s2)
%SHORTESTPATH Returns the shortest path between two nodes in T
%  Returns the shortest path in T between the two nodes represented by 4x1 state
%  vectors s1 and s2.

i1 = GetNodeIndex(T,s1);
i2 = GetNodeIndex(T,s2);

P = shortestpath(T,i1,i2);

end

