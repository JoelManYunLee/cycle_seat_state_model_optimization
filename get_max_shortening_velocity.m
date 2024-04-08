function [max_velocity] = get_max_shortening_velocity(alpha)

% Input Parameters
% data(:,1): samples of an independent variable
% data(:,2): corresponding samples of a dependent variable

data = [1, 1
    0.8, 0.982
    0.6, 0.862
    0.4, 0.707
    0.2, 0.68]; % Data taken from "The maximum shortening velocity of muscle shouldbe scaled with activation" John Chow

    F = griddedInterpolant(data(:,1), data(:,2)); % Interpolate data

    max_velocity = F(alpha);
end