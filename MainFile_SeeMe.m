%% Main File
%% Section 1
clear
clc

% Create the regression model for (1) Force Length and (2) Force Velocity
% Declaring models as global variables so they can be used within the scope
% of other functions
global force_length_regression force_velocity_regression
force_length_regression = get_muscle_force_length_regression(); 
force_velocity_regression = get_muscle_force_velocity_regression();

%% Section 2: Question 1:
clc
plot_curves();

%% Section 3: Question 2:
clc

a = 1;
lm = 1;
lt = 1.01;
velocity = get_velocity(a, lm, lt);

%% Section 4: Question 3:
clc

T = 2;
f0M = 100;
resting_length_muscle = 0.3;
resting_length_tendon = 0.1;
 
RelTol = 1e-6; % 1e-3
AbsTol = 1e-8;

tic
simulate(T, f0M, resting_length_muscle, resting_length_tendon, RelTol, AbsTol);
toc

%% Section 5: Testing
clc

test_change_muscle_length();

function [result] = test_change_muscle_length()
    % Call the function with some value
    call_result = get_muscle_length_change('biceps_femoris', 'knee', 20);

    % Calculate expected answer based on coefficients and joint angle
    expected_coefficients = [0.19826, -0.04600, 0.00000];
    joint_angle = 20;
    expected_result = expected_coefficients(1) + expected_coefficients(2) * joint_angle + expected_coefficients(3) * (joint_angle ^ 2);

    % Check if results are close within some tolerance (due to floating point arithmetic)
    tolerance = 1e-10;
    if abs(call_result - expected_result) < tolerance
        result = 'Correct';
    else
        result = 'Wrong';
    end

    disp(result);
end