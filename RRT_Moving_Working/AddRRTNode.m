function newT = AddRRTNode(T,x)
%ADDRRTNODE Adds node with (2D) coordinate given by 4x1 vector x to the RRT

    xtable = CreateNodeTable(x);
    newT = T.addnode(xtable);
end

