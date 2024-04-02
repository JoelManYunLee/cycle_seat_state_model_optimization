function [muscle_length_change] = get_change_in_muscle_length(muscle, joint, joint_angle)
    % Define coefficients directly based on muscle and joint
    switch muscle
        case 'biceps_femoris'
            switch joint
                case 'hip'
                    coefficients = [0.16644, 0.31078, 0.00061];
                case 'knee'
                    coefficients = [0.19826, -0.04600, 0.00000];
                otherwise
                    error('Joint not found for the specified muscle.');
            end
        case 'rectus_femoris'
            switch joint
                case 'hip'
                    coefficients = [-0.01966, -0.15041, 0.00044];
                case 'knee'
                    coefficients = [-0.02345, 0.24222, -0.00059];
                otherwise
                    error('Joint not found for the specified muscle.');
            end
        case 'gastrocnemius'
            switch joint
                case 'knee'
                    coefficients = [-0.08268, -0.08028, -0.00013];
                otherwise
                    error('Joint not found for the specified muscle.');
            end
        otherwise
            error('Muscle not found.');
    end

    % Calculate the muscle length change using the formula from Visser
    muscle_length_change = coefficients(1) + coefficients(2) * joint_angle + coefficients(3) * (joint_angle ^ 2);
end

function [result] = test_change_muscle_length()
    % Call the function with some value
    call_result = get_change_in_muscle_length('biceps_femoris', 'knee', 20);

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
