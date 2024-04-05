clear
clc

crank_angles_matrix = zeros(360,2)
% Column 1 = time
% Column 2 = crank angle

for i = 1:360
    crank_angles_matrix(i,1) = i/540; % Time
    crank_angles_matrix(i,2) = time_to_crank_angle(i/540); % Crank angle
end