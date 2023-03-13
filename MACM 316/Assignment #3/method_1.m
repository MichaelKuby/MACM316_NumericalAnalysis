function [p1] = method_1(p0)
%   An iterative technique for finding the cubed root of 19
format long
p1 = ( (18*p0) + (19/p0^2) ) / 19;

end
