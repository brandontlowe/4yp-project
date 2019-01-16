function g = CreateRRTGraph(xinit)
%CREATERRTGRAPH Creates a graph for RRT implementation
%   Creates a graph with initial node corresponding to xinit (2x1). Each node
%   corresponds to a coordinate in 2D space.

    nodetable = CreateNodeTable(xinit);
    g = graph(0, nodetable);
end

