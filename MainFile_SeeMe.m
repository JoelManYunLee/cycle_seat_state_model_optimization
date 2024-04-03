clear
clc

crankAngleMatrix = [30; 60; 90; 120; 150];
numAngles = length(crankAngleMatrix);
hipAngles = zeros(numAngles, 1);
kneeAngles = zeros(numAngles, 1);

for i = 1:numAngles
    [hipAngles(i), kneeAngles(i)] = selectJointAngles(crankAngleMatrix(i));
end

jointAnglesMatrix = [crankAngleMatrix, hipAngles, kneeAngles];
disp(jointAnglesMatrix);

muscleMatrix = {'biceps_femoris', 'rectus_femoris', 'gastrocnemius'};
jointMatrix = {'hip', 'knee'};
numAngles = size(jointAnglesMatrix, 1);
numMuscles = length(muscleMatrix);
numJoints = length(jointMatrix);

resultMatrix = zeros(numAngles * ((numMuscles * numJoints)-1), 5);
counter = 1;

% Loop for biceps_femoris and rectus_femoris
for m = 1:numMuscles-1 % Excluding gastrocnemius
    for j = 1:numJoints
        for a = 1:numAngles
            muscle = muscleMatrix{m};
            joint = jointMatrix{j};
            joint_angle = jointAnglesMatrix(a, j + 1); % j+1 to account for crank angle column

            muscle_length_change = get_muscle_length_change(muscle, joint, joint_angle);

            resultMatrix(counter, :) = [jointAnglesMatrix(a, 1), m, j, joint_angle, muscle_length_change];
            counter = counter + 1;
        end
    end
end

% Loop for gastrocnemius muscle
for j = 2:numJoints % Excluding hip
    for a = 1:numAngles
        muscle = muscleMatrix{end}; % gastrocnemius
        joint = jointMatrix{j};
        joint_angle = jointAnglesMatrix(a, j + 1); % j+1 to account for crank angle column

        muscle_length_change = get_muscle_length_change(muscle, joint, joint_angle);

        resultMatrix(counter, :) = [jointAnglesMatrix(a, 1), numMuscles, j, joint_angle, muscle_length_change];
        counter = counter + 1;
    end
end

disp(resultMatrix);


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