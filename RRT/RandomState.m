function x = RandomState(n)
%RANDOMSTATE Generate a random 2D vector with upper limit n^2 (for each
%element)
x = unidrnd(n^2,2,1);            % Generate 2x1 vector of random integers, upper limit n^2
end

