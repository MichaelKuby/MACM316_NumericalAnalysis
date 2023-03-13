% The following iteratively computes the cubed root of 19 using an initial
% approximation p0 = 2

format long

pn_1 = 2; % initial guesses
pn_2 = 2;
pn_3 = 2;
pn_4 = 2; 

p = (19)^(1/3);

n = 500; % number of iterations

results = zeros(n, 4); % Up to n iterations for each of the 4 methods

%% Part A

for i = 1:n % controls rows
    
    % Compute the next iteration for each method and store the result

    j = 1; % controls columns
    
    pn_1 = method_1(pn_1);
    results(i,j) = pn_1;
    j = j + 1;

    pn_2 = method_2(pn_2);
    results(i,j) = pn_2;
    j = j + 1;

    pn_3 = method_3(pn_3);
    results(i,j) = pn_3;
    j = j + 1;

    pn_4 = method_4(pn_4);
    results(i,j) = pn_4;
    j = j + 1;
    
end

%% Part B

abs_errors = abs(results - p);
x = [1:n];

plot(x, abs_errors(:, 1), x, abs_errors(:, 2), x, abs_errors(:, 3), x, abs_errors(:, 4), "LineWidth",1.5);
title("The Absolute Error |pn - p| for methods 1-4 over n iterations")
xlabel("n")
ylabel("Absolute Error")
legend('Method 1', 'Method 2', 'Method 3', 'Method 4')

lim = abs_errors(1:6,:);

%% Part C

pn = abs_errors(2:end, :);
pnplus1 = abs_errors(1:end-1, :) ;
alpha = 1;

error_constant_lambda = pn ./ (pnplus1).^alpha;