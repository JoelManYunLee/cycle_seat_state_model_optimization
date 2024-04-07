function simulate_DE_RF(AbsTol,RelTol)

    % Initial condition
    E0 = 0;  % Initial value of E

    % Time span for simulation
    tspan = [0 0.666667];

    % Testing for numerical error
    options = odeset ('RelTol', RelTol, 'AbsTol', AbsTol);

    % Solve the differential equation
    [t, E] = ode45(@dEdt, tspan, E0);

    % Plot the results
    plot(t, E);
    xlabel('Time');
    ylabel('E');
    title('Simulation of Differential Equation');

    % Define the differential equation
    function dEdt = dEdt(t, E)
        % Parameters
        Fo = 1;         % Some constant value for Fo
        Lo = get_optimal_muscle_length()*0.3497; % Normalize length that corresponds to peak force * resting length
        alpha = get_activation_values_RF(time_to_crank_angle(t)); % Value of alpha at current crank angle
        Vmax = get_max_shortening_velocity(alpha); % Value of vmax at current alpha

        % Differential equation
        dEdt = alpha * Fo * Lo * Vmax * (0.054 + 0.0506 * get_RF_velocity(time_to_crank_angle(t)) + 2.46 * (get_RF_velocity(time_to_crank_angle(t)))^2) / ...
               (1 - 1.13 * get_RF_velocity(time_to_crank_angle(t)) + 12.8 * (get_RF_velocity(time_to_crank_angle(t)))^2 - 1.64 * (get_RF_velocity(time_to_crank_angle(t)))^3);
    end
end