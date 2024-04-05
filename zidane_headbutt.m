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
hipAngles = zeros(numAngles, 1);
kneeAngles = zeros(numAngles, 1);

for i = 1:numAngles
    [hipAngles(i), kneeAngles(i)] = selectJointAngles(crankAngleMatrix(i));
end