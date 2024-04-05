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
jointAnglesMatrix = zeros(numAngles,3);

test = get_hip_angle(13.885);

for i = 1:numAngles
    hipAngles(i,1) = crank_angles_matrix(i,1);
    hipAngles(i,2) = get_hip_angle(crank_angles_matrix(i,2));
    kneeAngles(i,1) = crank_angles_matrix(i,1);
    kneeAngles(i,2) = get_knee_angle(crank_angles_matrix(i,2));
    jointAnglesMatrix(i,1) = crank_angles_matrix(i,1); % 1st column is time
    jointAnglesMatrix(i,2) = hipAngles(i,2); % 2nd column is hip angle
    jointAnglesMatrix(i,3) = kneeAngles(i,2); % 3rd column is knee angles
end

muscleMatrix = {'biceps_femoris', 'rectus_femoris', 'gastrocnemius'};
jointMatrix = {'hip', 'knee'};
numAngles = size(jointAnglesMatrix, 1);
numMuscles = length(muscleMatrix);
numJoints = length(jointMatrix);

resultMatrix = zeros(numAngles * ((numMuscles * numJoints)-1), 5);
counter = 1;

% Loop for biceps_femoris and rectus_femoris
for m = 1:numMuscles-1 % Excluding gastrocnemius
    for j = 1:numJoints
        for a = 1:numAngles
            muscle = muscleMatrix{m};
            joint = jointMatrix{j};
            joint_angle = jointAnglesMatrix(a, j + 1); % j+1 to account for crank angle column

            muscle_length_change = get_muscle_length_change(muscle, joint, joint_angle);

            resultMatrix(counter, :) = [jointAnglesMatrix(a, 1), m, j, joint_angle, muscle_length_change];
            counter = counter + 1;
        end
    end
end

% Loop for gastrocnemius muscle
for j = 2:numJoints % Excluding hip
    for a = 1:numAngles
        muscle = muscleMatrix{end}; % gastrocnemius
        joint = jointMatrix{j};
        joint_angle = jointAnglesMatrix(a, j + 1); % j+1 to account for crank angle column

        muscle_length_change = get_muscle_length_change(muscle, joint, joint_angle);

        resultMatrix(counter, :) = [jointAnglesMatrix(a, 1), numMuscles, j, joint_angle, muscle_length_change];
        counter = counter + 1;
    end
end