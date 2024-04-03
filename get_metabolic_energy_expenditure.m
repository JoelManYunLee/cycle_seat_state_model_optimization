function [E_dot] = get_metabolic_energy_expenditure(L_dot, L0, F0, alpha, max_velocity)

% Input Parameters
% L_dot: Rate of change of the contractile element length
% L0: 
% F0: 
% alpha:
% max_velocity:

% Output
% E_dot: The rate of metabolic energy expenditure in the muscle

contractile_element_velocity = L_dot/max_velocity;

E_dot = alpha*F0*L0*max_velocity*((0.054 + 0.0506*contractile_element_velocity + 2.46*(contractile_element_velocity^2)) / (1 - 1.13*contractile_element_velocity - 12.8*contractile_element_velocity^2 - 1.64*contractile_element_velocity^3));



