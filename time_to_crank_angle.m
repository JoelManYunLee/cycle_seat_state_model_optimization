function crank_angle = time_to_crank_angle(time)
    % Constants
    rpm = 90; % Revolutions per minute
    time_per_revolution = 60 / rpm; % Time taken for one revolution (in seconds)
    crank_angle_per_revolution = 360; % Crank angle change per revolution (in degrees)

    % Calculate the total number of revolutions
    total_revolutions = time / time_per_revolution;

    % Calculate the crank angle
    crank_angle = mod(total_revolutions, 1) * crank_angle_per_revolution;

    % Convert crank angle to range [0, 360)
    crank_angle = mod(crank_angle, 360);
end
