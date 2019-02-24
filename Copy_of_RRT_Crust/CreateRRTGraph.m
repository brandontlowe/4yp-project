function g = CreateRRTGraph(xinit)
%CREATERRTGRAPH Creates a graph for RRT implementation
%   Creates a graph with initial node corresponding to xinit (4x1). Each node
%   corresponds to a coordinate in 2D space, an orientation theta and forward velocity f.

    nodetable = CreateNodeTable(xinit);
    g = graph(0, nodetable);
end

