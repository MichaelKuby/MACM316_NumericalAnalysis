%$ Part A

% For each n that you are considering, generate a number of 
% large random matrices and measure the average computing time 
% that Matlab's LU factorization algorithm requires to factor 
% each matrix into L and U. Be sure to specify how many factorizations 
% you are averaging over. In the computing time estimate, do not 
% include the cost of constructing the random matrices.

% The n's that I will consider (where the matrices are n x n)
matrice_sizes = (1000 : 1000 : 20000);

% The number of large random matrices I will consider
num_matrices = 10;

% A matrix to hold the running times calculated
times = zeros(length(matrice_sizes), num_matrices);

% Generate a numer of large random matrices
for i = 1:length(matrice_sizes)
    for j = 1:num_matrices
        A = rand(matrice_sizes(i));
        tic
        [L,U,P] = lu(A);
        times(i, j) = toc;
    end
end

% Compute the average running time for each n
means = mean(times, 2);

%% Plot the results
plot(matrice_sizes, means)
title("A = LU factorization mean running times")
ylabel("Average running time (seconds)")
xlabel("Matrix size (n x n)")

%% Use loglog to linearize
loglog(matrice_sizes, means)
title("loglog of A = LU factorization mean running times")
ylabel("Average running time (seconds)")
xlabel("Matrix size (n x n)")

%%
% Calculate the slope of log(error) = m(log(h)) + C
x0 = log(2000)
y0 = log(6.97437*10^(-2))

x1 = log(12000)
y1 = log(9.09617)

%calculate rise/run
rise = y1 - y0
run = x1 - x0
slope = rise/run

%% Part B

% repeat the process in Part A but this time usinga random 
% tridiagonal matrix:  spdiags(rand(n,3), -1:1, n,n) 
% command to generate random tridiagonal n × n matrices.

% The n's that I will consider (where the matrices are n x n)
matrice_sizes_tri = (1000 : 1000 : 100000);

% The number of large random matrices I will consider
num_matrices_tri = 10;

times_tri = zeros(length(matrice_sizes_tri), num_matrices_tri);

% Generate a numer of large random matrices
for i = 1:length(matrice_sizes_tri)
    for j = 1:num_matrices_tri
        A = spdiags(rand(matrice_sizes_tri(i),3), -1:1, matrice_sizes_tri(i),matrice_sizes_tri(i));
        tic
        [L,U,P] = lu(A);
        times_tri(i, j) = toc;
    end
end

% Compute the average running time for each n
means_tri = mean(times_tri, 2);

%% Plot the results
plot(matrice_sizes_tri, means_tri)
title("A = LU factorization for tridiagonal matrices")
ylabel("Average running time (seconds)")
xlabel("Matrix size (n x n)")
