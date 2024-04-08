%Main File

clear
clc

crank_angles_matrix = zeros(360,2);
% Column 1 = time
% Column 2 = crank angle

timeStep = 1/540; % Time step chosen to correspond to 1 degree rotations

for i = 1:360
    crank_angles_matrix(i,1) = i/540; % Fill in times
    crank_angles_matrix(i,2) = time_to_crank_angle(i/540); % Fill in crrank angles
end

numAngles = length(crank_angles_matrix);
hipAngles = zeros(numAngles, 2);
kneeAngles = zeros(numAngles, 2);
jointAnglesMatrix = zeros(numAngles,3);

for i = 1:numAngles % Loop through and add hip and knee angles to individual matrices and one combined matrix
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


for k = 1:numAngles % Loop through and fill in BF results
    muscle = muscleMatrix{1};
    hip_joint = jointMatrix{1};
    knee_joint = jointMatrix{2};
    BF_results(k,1) = crank_angles_matrix(k,1); % Column 1 = time
    BF_results(k,2) = hipAngles(k,2); % Column 2 = hip angle
    BF_results(k,3) = kneeAngles(k,2); % Column 3 = knee angle
    BF_results(k,4) = get_muscle_length_change(muscle, hip_joint, BF_results(k,2)); % Column 4 = change in length from hip
    BF_results(k,5) = get_muscle_length_change(muscle, knee_joint, BF_results(k,3)); % Column 5 = change in length from knee
    BF_results(k,6) = (BF_results(k,4) + BF_results(k,5))/1000; % Column 6 = Net change in length, divided by 1000 to be in m
end

tempBFLength = BF_results(:,6); % Temporary matrix to help adjust the changes in length
for k = 1:numAngles
    if k > 1
        BF_results(k,6) = tempBFLength(k) - tempBFLength(k-1); % Change in length should be relative to previous state, not the initial position
    else
        BF_results(k,6) = 0; % Assuming first state has no change in length
    end
    BF_results(k,7) = BF_results(k,6)/timeStep; % Column 7 = approx velocity
end

crank_angles_matrix(360,2) = 360;
% Don't want the first and last result of matrix because the loop causes discontinuties in our graphs
BF_results(360,7) = BF_results(359,7); 
BF_results(1,7) = BF_results(2,7);

for k = 1:numAngles % Loop through and fill in RF results
    muscle = muscleMatrix{2};
    hip_joint = jointMatrix{1};
    knee_joint = jointMatrix{2};
    RF_results(k,1) = crank_angles_matrix(k,1); % Column 1 = time
    RF_results(k,2) = hipAngles(k,2); % Column 2 = hip angle
    RF_results(k,3) = kneeAngles(k,2); % Column 3 = knee angle
    RF_results(k,4) = get_muscle_length_change(muscle, hip_joint, RF_results(k,2)); % Column 4 = change in length from hip
    RF_results(k,5) = get_muscle_length_change(muscle, knee_joint, RF_results(k,3)); % Column 5 = change in length from knee
    RF_results(k,6) = (RF_results(k,4) + RF_results(k,5))/1000; % Column 6 = Net change in length, divided by 1000 to be in m
end

tempRFLength = RF_results(:,6); % Temporary matrix to help adjust the changes in length
for k = 1:numAngles
    if k > 1
        RF_results(k,6) = tempRFLength(k) - tempRFLength(k-1); % Change in length should be relative to previous state, not the initial position
    else
        RF_results(k,6) = 0; % Assuming first state has no change in length
    end
    RF_results(k,7) = RF_results(k,6)/timeStep; % Column 7 = approx velocity
end

% Don't want the first and last result of matrix because the loop causes discontinuties in our graphs
RF_results(360,7) = RF_results(359,7);
RF_results(1,7) = RF_results(2,7);

for k = 1:numAngles % Gastrocnemius results matrix
    muscle = muscleMatrix{3};
    knee_joint = jointMatrix{2};
    G_results(k,1) = crank_angles_matrix(k,1); % Column 1 = time
    G_results(k,2) = 0; % Column 2 = hip angle (0 because gastrocnemius length with hip angle)
    G_results(k,3) = kneeAngles(k,2); % Column 3 = knee angles
    G_results(k,4) = 0; % Column 4 = change in length from hip (0 for calf)
    G_results(k,5) = get_muscle_length_change(muscle, knee_joint, G_results(k,3)); % Column 5 = change in length from knee
    G_results(k,6) = (G_results(k,4) + G_results(k,5))/1000; % Column 6 = Net change in length, divided by 1000 to be in m
end

tempGLength = G_results(:,6); % Temp matrix to help adjust the changes in length
for k = 1:numAngles
    if k > 1
        G_results(k,6) = tempGLength(k) - tempGLength(k-1);% Change in length should be relative to previous state
    else
        G_results(k,6) = 0; % First state has no change in length
    end
    G_results(k,7) = G_results(k,6)/timeStep; % Column 7 = approx velocity
end

% Don't want the first and last result of matrix because the loop causes discontinuties in our graphs
G_results(360,7) = G_results(359,7);
G_results(1,7) = G_results(2,7);

figure % Plot the muscle velocities versus the crank angle
hold on
plot(crank_angles_matrix(:,2), BF_results(:,7), LineWidth=2)
plot(crank_angles_matrix(:,2), RF_results(:,7), LineWidth=2)
plot(crank_angles_matrix(:,2), G_results(:,7), LineWidth=2)
hold off
title('Plots of muscle velocities versus crank angles', FontSize=20)
xlabel('Crank Angle (degrees)',FontSize=18)
ylabel('Muscle Velocity (m/s)',FontSize=18)
legend('BF','RF','G', FontSize=14)

AbsTol = 1e-8;
RelTol = 1e-8;
T = 0.666667; % length of simulation
figure % Plot results from ode45 (consumed energy vs time)
hold on
simulate_DE_BF(AbsTol,RelTol,T)
simulate_DE_RF(AbsTol,RelTol,T)
simulate_DE_G(AbsTol,RelTol,T)
hold off
title('Plots of muscle energies versus time', FontSize=20)
xlabel('Time (s)', FontSize=18)
ylabel('Consumed Metabolic Energy (calorie)', FontSize=18)
legend('BF','RF','G', FontSize=14)

%%% Numerical Error Testing
%figure
%hold on
%simulate_DE_BF(1e-8,1e-11,10)
%simulate_DE_BF(1e-8,1e-8,10)
%simulate_DE_BF(1e-8,1e-5,10)
%simulate_DE_BF(1e-8,1e-2,10)
%hold off
%title('Plots of muscle energies versus time', FontSize=20)
%xlabel('Time (s)', FontSize=18)
%ylabel('Consumed Metabolic Energy (calorie)', FontSize=18)
%legend('RelTol = 1e-11', 'RelTol = 1e-8', 'RelTol = 1e-5', 'RelTol = 1e-2', FontSize=14)

BF_muscle = HillTypeMuscle(100, 0.316, 0.092); % Call hill type class for BF muscle
BF_total_lm_lt_length = 0.316+0.092; 
BF_tendon_data = zeros(numAngles, 6); % Matrix used to compute strain in tendon
BF_tendon_data(1,2) = 0.316; % Resting length of muscle

RF_muscle = HillTypeMuscle(100, 0.3497, 0.0517); % Call hill type class for RF muscle
RF_total_lm_lt_length = 0.3497+0.0517; 
RF_tendon_data = zeros(numAngles, 6); % Matrix used to compute strain in tendon
RF_tendon_data(1,2) = 0.3497; % Resting length of muscle

G_muscle = HillTypeMuscle(100, 0.241, 0.212); % Call hill type class for Gas muscle
G_total_lm_lt_length = 0.241+0.212; 
G_tendon_data = zeros(numAngles, 6); % Matrix used to compute strain in tendon
G_tendon_data(1,2) = 0.241; % Resting length of muscle

for i = 1:numAngles
    BF_tendon_data(i,1) = BF_results(i,6); % Col 1: Change in muscle length
    RF_tendon_data(i,1) = RF_results(i,6); 
    G_tendon_data(i,1) = G_results(i,6); 
    if i > 1
        BF_tendon_data(i,2) = BF_tendon_data(i-1,2) + BF_tendon_data(i,1); % Col 2: current muscle length
        RF_tendon_data(i,2) = RF_tendon_data(i-1,2) + RF_tendon_data(i,1); 
        G_tendon_data(i,2) = G_tendon_data(i-1,2) + G_tendon_data(i,1); 
    end
    BF_tendon_data(i,3) = BF_tendon_data(i,2)/0.316; % Col 3: normalized muscle length
    RF_tendon_data(i,3) = RF_tendon_data(i,2)/0.3497;
    G_tendon_data(i,3) = G_tendon_data(i,2)/0.241; 
    BF_tendon_data(i,4) = BF_muscle.norm_tendon_length(BF_total_lm_lt_length, BF_tendon_data(i,3)); % Col 4: normalized tendon length
    RF_tendon_data(i,4) = RF_muscle.norm_tendon_length(RF_total_lm_lt_length, RF_tendon_data(i,3)); 
    G_tendon_data(i,4) = G_muscle.norm_tendon_length(G_total_lm_lt_length, G_tendon_data(i,3)); 
    BF_tendon_data(i,5) = BF_tendon_data(i,4)*0.092; % Col 5: actual tendon length
    RF_tendon_data(i,5) = RF_tendon_data(i,4)*0.0517;
    G_tendon_data(i,5) = G_tendon_data(i,4)*0.212;
    BF_tendon_data(i,6) = (BF_tendon_data(i,5) - 0.092)/0.092; % Col 6: Tendon strain
    RF_tendon_data(i,6) = (RF_tendon_data(i,5) - 0.0517)/0.0517; 
    G_tendon_data(i,6) = (G_tendon_data(i,5) - 0.212)/0.212; 
end

figure % Plotting tendon strains
hold on
plot(crank_angles_matrix(:,2), BF_tendon_data(:,6), LineWidth=2);
plot(crank_angles_matrix(:,2), RF_tendon_data(:,6), LineWidth=2);
plot(crank_angles_matrix(:,2), G_tendon_data(:,6), LineWidth=2);
hold off
title('Distal Tendon Strain Graph', FontSize=20)
xlabel('Crank Angles (degrees)', FontSize=18)
ylabel('Strain (m/m)', FontSize=18)
legend('BF', 'RF', 'G', FontSize=14)