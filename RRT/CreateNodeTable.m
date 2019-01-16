function nt = CreateNodeTable(xinit)
%CREATENODETABLE Creates an node table
%   Creates a table that stores position vectors with one (inital) entry
    nt = table(xinit', 'VariableNames', {'Coordinates'});
end