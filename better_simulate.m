function [Vcc] = better_simulate(f0M, resting_length_muscle, resting_length_tendon, alpha, norm_length)

    % Input Parameters
    % T: simulation time (seconds)
    % f0M: maximum isometric force
    % resting_length_muscle: actual length (m) of muscle (CE) that corresponds to normalized length of 1
    % resting_length_tendon: actual length of tendon (m) that corresponds to normalized length of 1
    
    %%% TASK 1  
    muscle = HillTypeMuscle(f0M, resting_length_muscle/1000, resting_length_tendon/1000);
    
    %%% TASK 2
        function velocity = get_muscle_velocity(alpha, norm_lm)
            a = alpha;
            
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

    Vcc = get_muscle_velocity(alpha, norm_length);
 