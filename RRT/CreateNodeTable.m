function nt = CreateNodeTable(x)
%CREATENODETABLE Creates an node table
%   Creates a 1x2 table from 2x1 vector consisting of an x and a y coordinate
    nt = table(x(1),x(2),'VariableNames',{'x', 'y'});
end