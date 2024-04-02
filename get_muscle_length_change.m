function [muscle_length_change] = get_muscle_length_change(muscle, joint, joint_angle)
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
