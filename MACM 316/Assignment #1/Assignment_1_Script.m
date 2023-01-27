clc  
clear
format long

inputs = linspace(0, 2, 1000)
outputs = zeros(size(inputs))
ouputs_minusL = zeros(size(inputs))
xSq = zeros(size(inputs))
xCu = zeros(size(inputs))

for i = 1:length(inputs)
    % Compute values for F(h) as h -> 0
    outputs(i) = func(inputs(i))
    % Compute values for |F(h) - L| as h -> 0
    outputs_minusL(i) = abs(outputs(i) - 2)
    % Create the function y = x^2 to compare against
    xSq(i) = (inputs(i)^2)
    % Create the function y = x^3 to compare against
    xCu(i) = (inputs(i)^3)
end

% Plot the graph for F(h) =  ( e^h - e^{-h} ) / h
plot(inputs, outputs, "LineWidth", 2)
title("F(h) =  ( e^h - e^{-h} ) / h")
ylabel("Output Values")
yline(2)
xlabel("Input Values")
xline(0)

% Plot the graph for | ( e^h - e^{-h}  / h ) - L | and compare against x^2,
% x^3, etc...
plot(inputs, outputs_minusL, "LineWidth", 2)
title("| ( e^h - e^{-h}  / h ) - L |")
ylabel("Output Values")
xlabel("Input Values")
xline(0)

hold on
plot(inputs, xSq, '-b', "Color", "cyan")
plot(inputs, xCu, '-b', "Color", "green")

legend("| F(h) - L |", "h^2", "h^3")