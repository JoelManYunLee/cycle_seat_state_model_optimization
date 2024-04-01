function simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol)

% Input Parameters
% T: simulation time (seconds)
% f0M: maximum isometric force
% resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
% resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1

%%% TASK 1  
muscle = HillTypeMuscle(100, 0.3, 0.1);

%%% TASK 2
    function velocity = get_muscle_velocity(time, norm_lm)
        % Determine a based on time
        if time < 0.5
            a = 0;
        else
            a = 1;
        end
        
        % Modifying properties
        muscle.resting_length_muscle = resting_length_muscle;
        muscle.resting_length_tendon = resting_length_tendon;
        muscle.f0M = f0M;

        muscle_tendon_length = resting_length_muscle + resting_length_tendon;

        % Calculate normalized tendon length using HillTypeMuscle method
        norm_lt = muscle.norm_tendon_length(muscle_tendon_length, norm_lm);

        % Calculate velocity using get_velocity
        velocity = get_velocity(a, norm_lm, norm_lt);
    end


%%% TASK 3 xdot = vm
% the outputs of ode45 must be named "time" and "norm_lm"

% Define the time span to be 2 seconds
tspan = [0 T];

% Set the initial condition to 1
x0 = 1;

opts = odeset('RelTol',RelTol,'AbsTol', AbsTol);
[time, norm_lm] = ode45(@get_muscle_velocity, tspan, x0, opts);

%%% TASK 4
% save the estimated forces in a vector called "forces"

% Determine the number of columns in norm_lm
num_columns = size(norm_lm, 2);

% Create a column vector to store the forces
forces = zeros(1, num_columns);

% Set the forces
for i = 1:size(norm_lm)
    forces(i) = muscle.get_force(resting_length_muscle + resting_length_tendon, norm_lm(i));
end

%%%% Do not alter the rest (it should not be needed) %%%%%%
norm_lm = norm_lm * resting_length_muscle;

% Plot results
figure()
LineWidth = 1.5;
FontSize = 12;

subplot(2,1,1)
plot(time, norm_lm, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('Normalized CE Length (m)')
set(gca,'FontSize', FontSize)

subplot(2,1,2)
plot(time, forces, 'LineWidth', LineWidth)
xlabel('Time (s)')
ylabel('CE Tension (N)')
set(gca,'FontSize', FontSize)
end