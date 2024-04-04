%% Section 1: Get hip and knee angles
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

%% Section 2: Get collection of associated muscle length changes in each muscle at each crank angle.
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

% Col 1: Crank angle
% Col 2: Muscle (1 = bf, 2 = rf, 3 = g)
% Col 3: Joint (1 = hip, 2 = knee)
% Col 4: Joint angle
% Col 5: Change in muscle length
disp(resultMatrix);

%% Section 3: Get activation values
clc

% Column 6 is activation values
newColumn = zeros(length(resultMatrix),1); % New column for results matrix
resultMatrix = [resultMatrix newColumn]; % Append on another column
tempA = zeros(1,3); % Temp array to fill in activation values
for i = 1:length(resultMatrix) %Loop through and fill in activation values
    [tempA(1), tempA(2), tempA(3)] = getActivationValues(resultMatrix(i,1));
    resultMatrix(i,6) = tempA(resultMatrix(i, 2)); % Fill in value based on the muscle type
end

disp(resultMatrix)
%% Section 4: Get optimal length (L0) and Vmax

% Column 7 is Vmax
% Column 8 is L0
newColumn = zeros(length(resultMatrix),2); % New 2 column for results matrix
resultMatrix = [resultMatrix newColumn]; % Append on another 2 columns

for i = 1:length(resultMatrix)
    resultMatrix(i,7) = get_max_shortening_velocity(resultMatrix(i,6)); % Find Vmax using activation value
    resultMatrix(i,8) = get_optimal_muscle_length(); % NEED THE CSV IN THE FOLDER
end

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