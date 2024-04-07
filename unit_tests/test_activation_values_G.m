%% Define Main Function
% it always has the same structure.
% The name of the main function corresponds
% to the name of your test file and should
% start or end with the word 'test', which is case insensitive.

function tests = test_activation_values_G %you can only change the name 
%do not change this
tests = functiontests(localfunctions);
end

%% Define Local Test Functions
% test function names must begin or end with
% the case-insensitive word 'test'

%test for real solutions

function testRealSolution(testCase) %dont change function input
%call the unit with its parameters
actSolution = get_activation_values_G(12);
% we know the true response of the unity for the given parameters
expSolution = [2,1];

% verify that the unit and expected solution are the same
verifyEqual(testCase,actSolution,expSolution)
end

function testImaginarySolution(testCase) %dont change function input
actSolution = quadraticSolver(1,2,10);
expSolution = [-1+3i -1-3i];
verifyEqual(testCase,actSolution,expSolution)
end