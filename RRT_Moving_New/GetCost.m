function c = GetCost(x1,x2)
%GETCOST Calculates the cost or loss of traversing from state x1 to state
%x2

pos1 = [x1(1); x1(2)];
pos2 = [x2(1); x2(2)];

v1 = [x1(4)*cos(x1(3)); x1(4)*sin(x1(3))];
v1hat = v1*(1/norm(v1));

c = norm(pos2-pos1) - 0.5*dot(v1hat,pos2-pos1);

end

