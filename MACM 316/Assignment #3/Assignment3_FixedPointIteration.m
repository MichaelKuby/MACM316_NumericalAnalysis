% The following iteratively computes the cubed root of 19 using an initial
% approximation p0 = 2

format long

pn_1 = 2; % initial guesses
pn_2 = 2;
pn_3 = 2;
pn_4 = 2; 

p = (19)^(1/3);

n = 25; % number of iterations

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

%% Part C

% method 1

e_n2_1 = abs_errors(end, 1);
e_n1_1 = abs_errors(end-1,1);
e_n_1  = abs_errors(end-2,1);

num_1 = log(e_n2_1) - log(e_n1_1);
denom_1 = log(e_n1_1) - log(e_n_1);
alpha_1 = num_1 / denom_1;

lambda_1 = e_n1_1 / (e_n_1 ^ alpha_1);

% method 2

e_n2_2 = abs_errors(end, 2);
e_n1_2 = abs_errors(end-1,2);
e_n_2  = abs_errors(end-2,2);

num_2 = log(e_n2_2) - log(e_n1_2);
denom_2 = log(e_n1_2) - log(e_n_2);
alpha_2 = num_2 / denom_2;

lambda_2 = e_n1_2 / (e_n_2 ^ alpha_2);

% method 3

e_n2_3 = abs_errors(end, 3);
e_n1_3 = abs_errors(end-1,3);
e_n_3  = abs_errors(end-2,3);

num_3 = log(e_n2_3) - log(e_n1_3);
denom_3 = log(e_n1_3) - log(e_n_3);
alpha_3 = num_3 / denom_3;

lambda_3 = e_n1_3 / (e_n_3 ^ alpha_3);

% method 4

e_n2_4 = abs_errors(end, 4);
e_n1_4 = abs_errors(end-1,4);
e_n_4  = abs_errors(end-2,4);

num_4 = log(e_n2_4) - log(e_n1_4);
denom_4 = log(e_n1_4) - log(e_n_4);
alpha_4 = num_4 / denom_4;

lambda_4 = e_n1_4 / (e_n_4 ^ alpha_4);
