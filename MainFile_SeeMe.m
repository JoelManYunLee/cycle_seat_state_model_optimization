
clear
clc

crankAngleMatrix = [30, 60, 90, 120, 150];
hipJointAngleMatrix = zeros(5,1);
kneeJointAngleMatrix = zeros(5,1);
% Getting joint angles
for i = 1:length(crankAngleMatrix)
    hipJointAngleMatrix(i) = selectJointAngles(crankAngleMatrix(i,1)); 
    kneeJointAngleMatrix(i) = selectJointAngles(crankAngleMatrix(i,2));
end 

hipJointAngleMatrix 
kneeJointAngleMatrix 

muscleMatrix = ['biceps_femoris', 'rectus_femoris', 'gastrocnemius'];
jointMatrix = ['hip', 'knee'];
muscleLengthChange = zeros(25,5);

for i:length(crankAngleMatrix)
    for j:length()


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