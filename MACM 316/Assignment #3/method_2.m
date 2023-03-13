function [p1] = method_2(p0)
%   An iterative technique for finding the cubed root of 19
format long
p1 = p0 - ( ( p0^3 - 19 ) / ( 3*p0^2 ) );

end
