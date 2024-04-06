function simulate_DE()

    % Initial condition
    E0 = 0;  % Initial value of E

    % Time span for simulation
    tspan = [0 10]; % Modify the time span as needed

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
        Lo = 1;         % Some constant value for Lo
        alpha_val = get_activation(time_to_crank_angle(t)); % Value of alpha at current crank angle
        vmax_val = get_max_shortening_velocity(alpha_val); % Value of vmax at current alpha

        % Differential equation
        dEdt = alpha_val * Fo * Lo * vmax_val * (0.054 + 0.0506 * Vcc(time_to_crank_angle(t)) + 2.46 * Vcc(time_to_crank_angle(t))^2) / ...
               (1 - 1.13 * Vcc(time_to_crank_angle(t)) + 12.8 * Vcc(time_to_crank_angle(t))^2 - 1.64 * Vcc(time_to_crank_angle(t))^3);
    end
end