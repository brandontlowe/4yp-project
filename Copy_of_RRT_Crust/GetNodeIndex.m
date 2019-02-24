function index = GetNodeIndex(T,s)
%GETNODEINDEX Returns the index of node associated with state s in tree T

nodemat = (table2array(T.Nodes))';                                              % Create a matrix where each column is a state vector
[~, index, ~] = intersect(nodemat',s','rows');

end

