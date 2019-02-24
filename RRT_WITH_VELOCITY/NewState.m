function s = NewState(n)
%NEWSTATE Generate a new 4x1 state vector.
%x and y are generated independently as integers between 1 and n, so the position
%corresponds to a grid vertex. theta is generated between 1 and 2*pi,
%whereas f takes a value between 0 and 0.5; both represented by a double
pos = unidrnd(n,2,1);                                                       % Generate 2x1 vector of random integers, upper limit n^2
theta = rand*2*pi;                                                          % Generate new theta
f = rand*0.5;                                                               % Generate new f

s = [pos; theta; f];

end

