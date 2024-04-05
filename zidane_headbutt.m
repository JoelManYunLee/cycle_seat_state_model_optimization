clear
clc

crank_angles_matrix = zeros(360,2);
% Column 1 = time
% Column 2 = crank angle

for i = 1:360
    crank_angles_matrix(i,1) = i/540; % Time
    crank_angles_matrix(i,2) = time_to_crank_angle(i/540); % Crank angle
end

numAngles = length(crank_angles_matrix);
hipAngles = zeros(numAngles, 2);
kneeAngles = zeros(numAngles, 2);

test = get_hip_angle(13.885);

for i = 1:numAngles
    hipAngles(i,1) = crank_angles_matrix(i,1);
    hipAngles(i,2) = get_hip_angle(crank_angles_matrix(i,2));
    kneeAngles(i,1) = crank_angles_matrix(i,1);
    kneeAngles(i,2) = get_knee_angle(crank_angles_matrix(i,2));
end