function snew = NewState(s,n)
%NEWSTATE Generate a new 4x1 state vector.
%x and y are generated independently as integers between 1 and n, so the position
%corresponds to a grid vertex. theta is generated between 1 and 2*pi,
%whereas f takes a value between 0 and 0.5; both represented by a double

v = s(4);
t = 70;

rmin = (v-0.1)*t;
rmax = (v+0.1)*t;
%R = 230;
aov = pi/18;

% if n - s(1) < R
%    if n - s(2) < n - s(1)
%        R = n - s(2);
%    else
%        R = n - s(1);
%    end
% end

mu = 0.3;
sig = 0.1;

dr = rand*(rmax-rmin) +rmin;
dalpha = (rand-0.5)*pi/3;

dx = dr*cos(dalpha + s(3));
dy = dr*sin(dalpha + s(3));


xnew = s(1) + dx;
xnew = round(xnew);
ynew = s(2) + dy;
ynew = round(ynew);

dtheta = (rand-0.5)*2*aov;
thetanew = s(3) + dtheta;

f = normrnd(mu, sig);


snew = [xnew; ynew; thetanew; f];

end

