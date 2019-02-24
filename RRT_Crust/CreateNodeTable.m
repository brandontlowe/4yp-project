function nt = CreateNodeTable(x)
%CREATENODETABLE Creates an node table
%   Creates a 1x4 table from 4x1 vector consisting of an x and a y
%   coordinate, orientation theta (relative to +ve horizontal axis) and
%   forward velocity f
    nt = table(x(1),x(2), x(3), x(4), 'VariableNames',{'x', 'y', 'theta', 'f'});
end