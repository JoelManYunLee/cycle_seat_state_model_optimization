function [E_dot] = get_energy_expenditure(L_dot, resting_length_muscle)

% Input Parameters
% L_dot: Rate of change of the 

% Output
% E_dot: 

% TODO set these values:
F0 = 1;
L0 = resting_length_muscle;
alpha = 1;
max_velocity = 1;

contractile_element_velocity = L_dot/max_velocity;

E_dot = alpha*F0*L0*max_velocity*((0.054 + 0.0506*contractile_element_velocity + 2.46*(contractile_element_velocity^2)) / (1 - 1.13*contractile_element_velocity - 12.8*contractile_element_velocity^2 - 1.64*contractile_element_velocity^3));



