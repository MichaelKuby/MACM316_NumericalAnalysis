function [outputArg1] = derivative(inputArg1)
% The derivative of the function f(x) = e^(-x) - 1/2
e = exp(1);
outputArg1 = -e^(-inputArg1);
end