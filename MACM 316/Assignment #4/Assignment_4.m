%% Part A
% Construct a cubic spline with not-a-knot end conditions to approximate
% f(x) = e^(-x)-1/2 by using the values given by f(x) at x = 0, 0.25, 0.5,
% 0.75, 1.0

x = (0:.25:1);
y = Inf(1, length(x));
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

fprime = calc_derivative(f);

% plot the derivative of the polynomial

plot(xx,ppval(fprime,xx), "LineWidth", 1)

% evaluate the derivative at 0.5

spline_val1 = ppval(fprime, 0.5);

%% Part A Cont'd
% Construction of the second derivative: 

f2prime = calc_derivative(fprime);

% plot the derivative of the polynomial

plot(xx,ppval(f2prime,xx), "LineWidth", 1)
legend ("Data", "S(x)", "S'(x)", "S''(x)")
title("Spline of f(x) = e^{-x} - 1/2, computed at the data points, and its derivatives")
xlabel("x, the input values")
ylabel("S_{i}(x), the cubic spline interpolation output")

hold off

% evaluate the derivative at 0.5

spline_val2 = ppval(f2prime, 0.5);

%% Part A Cont'd
% What are the absolute errors in your spline-based approximation?

actual_val1 = derivative(0.5);
actual_val2 = second_derivative(0.5);

% Calculate the absolute errors

error_fprime = abs(spline_val1 - actual_val1);
error_f2prime = abs(spline_val2 - actual_val2);

%% Part B
% Repeat Part A over the interval [0, 1] with equal node spacings 
% h = 2^{−m} , m = 2,3,4,…. Try up to m = 16?

m = 12;
errors1 = Inf(1, m-1);
errors2 = Inf(1, m-1);

for i = 2:m
    gap = 2^(-i);
    input = 0:gap:1;
    output = Inf(1, length(input));
    
    for j = 1:length(input)
        output(j) = func(input(j));
    end

    % construct the spline
    s = spline(input, output);
    
    % compute the derivative
    spline_prime = calc_derivative(s);

    % Evaluate the derivative of the spline at 0.5
    spline_prime_val = ppval(spline_prime, 0.5);

    % compute the second derivative
    spline_prime2 = calc_derivative(spline_prime);

    % Evaluate the derivative of the spline at 0.5
    spline_prime2_val = ppval(spline_prime2, 0.5);

    % compute the error for the first derivative
    error1 = abs(spline_prime_val - derivative(0.5));
    
    % store the error
    errors1(i-1) = error1;

    % compute the error for the second derivative
    error2 = abs(spline_prime2_val - second_derivative(0.5));
    
    % store the error
    errors2(i-1) = error2;
end

%% Part B Cont'd - Plot the Errors for S'(0.5)

h = Inf(1,m-1);

for q = 2:m
    h(q-1) = 2^(-q);
end

% Plot the Absolute errors with respect to h for s'(0.5)
% optimal m value is 10

loglog(h, errors1)
title("Absolute errors of S'(0.5) as a function of h = 2^{-m} for m = 2,...,10")
xlabel("h")
ylabel("Absolute Error values |S'{0.5} - f'(0.5)|")

p1 = polyfit(log(h), log(errors1), 1);
y1 = polyval(p1, log(h));
hold on
loglog(h, exp(y1))
legend("Absolute errors", "Least squares line of best fit")

hold off

%% Part B Cont'd - Plot the Errors for S''(0.5)
% optimal m value is 12
loglog(h, errors2)
title("Absolute errors of S''(0.5) as a function of h = 2^{-m} for m = 2,...,12")
xlabel("h")
ylabel("Absolute Error values |S''( 0.5 ) - f''(  0.5 )|")

p2 = polyfit(log(h), log(errors2), 1);
y2 = polyval(p2, log(h));
hold on
loglog(h, exp(y2))
legend("Absolute errors", "Least squares line of best fit")