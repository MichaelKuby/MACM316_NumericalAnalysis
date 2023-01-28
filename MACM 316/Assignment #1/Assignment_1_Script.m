clc  
clear
format long

inputs = linspace(0, 1, 1000000);
outputs = zeros(size(inputs));
error = zeros(size(inputs));

for i = 1:length(inputs)
    % Compute values for F(h) as h -> 0
    outputs(i) = func(inputs(i));
    % Compute values for |F(h) - L| as h -> 0
    error(i) = abs(outputs(i) - 2);
end

%%
% Plot the graph for F(h) =  ( e^h - e^{-h} ) / h
plot(inputs, outputs, "LineWidth", 2)
title("F(h) =  ( e^h - e^{-h} ) / h")
ylabel("F(h)")
yline(2)
xlabel("h")
xline(0)

%%
% Plot the log of h and the error
loglog(inputs, error)
title("loglog of Error of h vs. h")
ylabel("Error of h")
xlabel("h")