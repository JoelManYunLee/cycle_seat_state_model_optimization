clear
clc

crank_angles_matrix = zeros(360,2);
% Column 1 = time
% Column 2 = crank angle

timeStep = 1/540;

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

BF_results = zeros(numAngles, 7);
RF_results = zeros(numAngles, 7);
G_results = zeros(numAngles, 7);

%%%%%%% PLEASE FIX THE CHANGE IN LENGTH SHENANIGANS
for k = 1:numAngles % BF
    muscle = muscleMatrix{1};
    hip_joint = jointMatrix{1};
    knee_joint = jointMatrix{2};
    BF_results(k,1) = crank_angles_matrix(k,1); % Column 1 = time
    BF_results(k,2) = hipAngles(k,2); % Column 2 = hip angle
    BF_results(k,3) = kneeAngles(k,2); % Column 3 = knee angle
    BF_results(k,4) = get_muscle_length_change(muscle, hip_joint, BF_results(k,2)); % Column 4 = change in length from hip
    BF_results(k,5) = get_muscle_length_change(muscle, knee_joint, BF_results(k,3)); % Column 5 = change in length from knee
    BF_results(k,6) = BF_results(k,4) + BF_results(k,5); % Column 4 = Net change in length
    BF_results(k,7) = BF_results(k,6)/timeStep; % Column 7 = approx velocity
end

for k = 1:numAngles % RF
    muscle = muscleMatrix{2};
    hip_joint = jointMatrix{1};
    knee_joint = jointMatrix{2};
    RF_results(k,1) = crank_angles_matrix(k,1);
    RF_results(k,2) = hipAngles(k,2);
    RF_results(k,3) = kneeAngles(k,2);
    RF_results(k,4) = get_muscle_length_change(muscle, hip_joint, RF_results(k,2));
    RF_results(k,5) = get_muscle_length_change(muscle, knee_joint, RF_results(k,3));
    RF_results(k,6) = RF_results(k,4) + RF_results(k,5);
    RF_results(k,7) = RF_results(k,6)/timeStep; % Column 7 = approx velocity
end

for k = 1:numAngles % Gastrocnemius
    muscle = muscleMatrix{3};
    knee_joint = jointMatrix{2};
    G_results(k,1) = crank_angles_matrix(k,1);
    G_results(k,2) = 0;
    G_results(k,3) = kneeAngles(k,2);
    G_results(k,4) = 0;
    G_results(k,5) = get_muscle_length_change(muscle, knee_joint, G_results(k,3));
    G_results(k,6) = G_results(k,4) + G_results(k,5);
    G_results(k,7) = G_results(k,6)/timeStep; % Column 7 = approx velocity
end

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

% Col 1: Crank angle
% Col 2: Muscle (1 = bf, 2 = rf, 3 = g)
% Col 3: Joint (1 = hip, 2 = knee)
% Col 4: Joint angle
% Col 5: Change in muscle length