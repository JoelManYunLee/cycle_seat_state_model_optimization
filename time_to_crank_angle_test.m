function tests = time_to_crank_angle_test
    tests = functiontests(localfunctions);
end

function testCrankAngleForZeroTime(testCase)
    actual = time_to_crank_angle(0);
    expected = 0;
    verifyEqual(testCase, actual, expected, 'AbsTol', eps);
end

function testCrankAngleForOneRevolution(testCase)
    actual = time_to_crank_angle(60); % Time for one complete revolution
    expected = 0; % Crank angle should reset to 0 after one revolution
    verifyEqual(testCase, actual, expected, 'AbsTol', eps);
end

function testCrankAngleForNegativeTime(testCase)
    actual = time_to_crank_angle(-30); % Negative time should result in crank angle of 0
    expected = 0;
    verifyEqual(testCase, actual, expected, 'AbsTol', eps);
end

