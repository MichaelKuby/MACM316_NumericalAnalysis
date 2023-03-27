%% Part A
% Construct a cubic spline with not-a-knot end conditions to approximate
% f(x) = e^(-x)-1/2 by using the values given by f(x) at x = 0, 0.25, 0.5,
% 0.75, 1.0

x = (0:.25:1);
y = zeros(1, length(x));
xx = 0:.01:1;

for i = 1:length(x)    
    y(i) = func(x(i));
end

%% Part A Cont'd
% Construction of a derivative with help from: 
% https://www.mathworks.com/matlabcentral/answers/95194-how-do-i-find-the-derivative-of-a-spline-curve-in-matlab-7-9-r2009b

% Construct the spline

f = spline(x,y);

plot(x,y, 'o', xx, ppval(f,xx), "LineWidth", 1)

hold on

% extract details from piece-wise polynomial by breaking it apart

[breaks,coefs,l,k,d] = unmkpp(f);

% make the polynomial that describes the derivative

fprime = mkpp(breaks,repmat(k-1:-1:1,d*l,1).*coefs(:,1:k-1),d);

% plot the derivative of the polynomial

plot(xx,ppval(fprime,xx), "LineWidth", 1)

% evaluate the derivative at 0.5

spline_val1 = ppval(fprime, 0.5);

%% Part A Cont'd
% Construction of the second derivative: 

% extract details from piece-wise polynomial by breaking it apart

[breaks2,coefs2,l2,k2,d2] = unmkpp(fprime);

% make the polynomial that describes the derivative

f2prime = mkpp(breaks2,repmat(k2-1:-1:1,d2*l2,1).*coefs2(:,1:k2-1),d2);

% plot the derivative of the polynomial

plot(xx,ppval(f2prime,xx), "LineWidth", 1)
legend ("Data", "S(x)", "S'(x)", "S''(x)")
title("Spline of f(x) = e^{-x} - 1/2, computed at the data points, and its derivatives")
xlabel("x, the input values")
ylabel("S_{i}(x), the cubic spline interpolation output")

% evaluate the derivative at 0.5

spline_val2 = ppval(f2prime, 0.5);

%% Part A Cont'd
% What are the absolute errors in your spline-based approximation?

actual_val1 = derivative(0.5);
actual_val2 = second_derivative(0.5);

% Calculate the absolute errors

error_fprime = abs(spline_val1 - actual_val1);
error_f2prime = abs(spline_val2 - actual_val2);
