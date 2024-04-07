function [max_velocity] = get_max_shortening_velocity(alpha)

% Input Parameters
% data(:,1): samples of an independent variable
% data(:,2): corresponding samples of a dependent variable

data = [1, 1
    0.8, 0.982
    0.6, 0.862
    0.4, 0.707
    0.2, 0.68]; % Data taken from "The maximum shortening velocity of muscle shouldbe scaled with activation" John Chow

activation = data(:,1); % Activation data
max_velo = data(:,2); % Max velocity data

regression_eqn = polyfit(activation, max_velo, 2); % fit a second order polynomial to the data

max_velocity = regression_eqn(1)*(alpha)^2 + regression_eqn(2)*alpha + regression_eqn(3); % Find max_velocity from regression equation
end