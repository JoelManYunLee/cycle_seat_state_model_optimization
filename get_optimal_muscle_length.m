function [L_0] = get_optimal_muscle_length()

force_length_gauss = get_muscle_force_length_regression();

L_0 = force_length_gauss.b1; % Find the length of CE that corresponds to largest force

end