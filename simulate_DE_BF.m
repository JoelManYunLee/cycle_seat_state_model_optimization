function simulate_DE_BF(AbsTol, RelTol, T)

    % Initial condition
    E0 = 0;  % Initial value of E

    % Time span for simulation
    tspan = [0 T]; 

    % Testing for numerical error
    options = odeset ('RelTol', RelTol, 'AbsTol', AbsTol);

    % Solve the differential equation
    [t, E] = ode45(@dEdt, tspan, E0, options);

    % Plot the results
    plot(t, E, LineWidth=2);

    % Define the differential equation
    function dEdt = dEdt(t, E)
        % Parameters
        Fo = 1;         % Some constant value for Fo
        Lo = get_optimal_muscle_length()*0.316; % Normalize length that corresponds to peak force * resting length
        alpha = get_activation_values_BF(time_to_crank_angle(t)); % Value of alpha at current crank angle
        Vmax = get_max_shortening_velocity(alpha); % Value of vmax at current alpha

        % Differential equation
        dEdt = alpha * Fo * Lo * Vmax * (0.054 + 0.0506 * get_BF_velocity(time_to_crank_angle(t)) + 2.46 * (get_BF_velocity(time_to_crank_angle(t)))^2) / ...
               (1 - 1.13 * get_BF_velocity(time_to_crank_angle(t)) + 12.8 * (get_BF_velocity(time_to_crank_angle(t)))^2 - 1.64 * (get_BF_velocity(time_to_crank_angle(t)))^3);
    end
end