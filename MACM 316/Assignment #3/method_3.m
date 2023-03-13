function [p1] = method_3(p0)
%   An iterative technique for finding the cubed root of 19
format long
p1 = p0 - ( (p0^4 - (19 * p0) ) / (p0^2 - 21) );

end
