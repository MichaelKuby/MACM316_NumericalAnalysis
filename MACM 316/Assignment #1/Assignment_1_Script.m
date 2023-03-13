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
% Plot h against the error
plot(inputs, error, "LineWidth", 2)
title("Error vs inputs")
ylabel("Error of F(h)")
xlabel("h")

%%
% Plot the log of h and the error
loglog(inputs, error)
title("loglog of Error of h vs. h")
ylabel("Error of h")
xlabel("h")

%%
% Calculate the slope of log(error) = m(log(h)) + C
x0 = log(1.8*10^(-05))
y0 = log(1.16122*10^(-10))

x1 = log(0.278179)
y1 = log(0.0258946)

%calculate rise/run
rise = y1 - y0
run = x1 - x0
slope = rise/run