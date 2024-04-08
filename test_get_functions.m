%% Define Main Function
% it always has the same structure.
% The name of the main function corresponds
% to the name of your test file and should
% start or end with the word 'test', which is case insensitive.

function tests = test_get_functions %you can only change the name 
%do not change this
tests = functiontests(localfunctions);
end

%% Define Local Test Functions.
% Note that not all "get" functions were tested in this file. This is
% because some are from the existing "HillTypeMuscle" model, to which no
% unit tests are required.

function test_activation_values_BF(testCase)
actSolution = get_activation_values_BF(90.53764031);
% Answer is taken from the actual data table. Line 53 of
% get_activation_values_BF.m
expSolution = 0.621;

% verify that the unit and expected solution are the same given a +/- 5%
% error range. 
verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_activation_values_G(testCase) %dont change function input
actSolution = get_activation_values_G(90.04020388);
% Answer is taken from the actual data table. Line 53 of
% get_activation_values_G.m
expSolution = 0.628378378;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_activation_values_RF(testCase) %dont change function input
actSolution = get_activation_values_RF(89.49488661);
% Answer is taken from the actual data table. Line 54 of
% get_activation_values_RF.m
expSolution = 0.1992;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_BF_velocity(testCase)
actSolution = get_BF_velocity(90);
% Answer is taken from the actual data table. Line 94 of get_BF_velocity.m
expSolution = -0.055675786;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_G_velocity(testCase)
actSolution = get_G_velocity(90);
% Answer is taken from the actual data table. Line 90 of get_G_velocity.m
expSolution = 0.028991337;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_hip_angle(testCase)
actSolution = get_hip_angle(89.23892634335209);
% Answer is taken from the actual data table. Line 14 of get_hip_angle.m
expSolution = 55.21653442419781;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_knee_angle(testCase)
actSolution = get_knee_angle(87.93499043977056);
% Answer is taken from the actual data table. Line 14 of get_knee_angle.m
expSolution = 71.95046439628481;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_max_shortening_velocity(testCase)
actSolution = get_max_shortening_velocity(0.4);
% Answer is taken from the actual data table. Line 10 of get_shortening_velocity.m
expSolution = 0.707;

verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_muscle_length_change(testCase)
    actSolution = get_muscle_length_change('biceps_femoris', 'hip', 90);
    %0.1644 + (0.31078 * 90) + (0.00061 * 90^2) = 33.07764
    expSolution =  33.07764;
    
    verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end

function test_RF_velocity(testCase)
    actSolution = get_RF_velocity(90);
    % Answer is taken from the actual data table. Line 94 of get_RF_velocity.m    
    expSolution = -0.028660704;
    
    verifyEqual(testCase,actSolution,expSolution, RelTol=0.05)
end


