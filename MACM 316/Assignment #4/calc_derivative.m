function [derivative] = calc_derivative(spline_struct)
% Takes a spline struct and creates the derivative
% extract details from piece-wise polynomial by breaking it apart
[breaks,coefs,l,k,d] = unmkpp(spline_struct);
% make the polynomial that describes the derivative
derivative = mkpp(breaks,repmat(k-1:-1:1,d*l,1).*coefs(:,1:k-1),d);
end