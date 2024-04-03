function [hipAngles, kneeAngles] = selectJointAngles( crankAngle )
    jointAnglesMatrix = [ 30 69.65 101.23; 60 63.47 86.03; 90 52.98 68.09; 120 41.08 51.46; 150 29.91 39.20 ]; %second column is for hip angle, third column is for knee angle
    
    i = 1;
    if crankAngle == 30
        i = 1;
    elseif crankAngle == 60
        i = 2;
    elseif crankAngle == 90
        i = 3;
    elseif crankAngle == 120
        i = 4;
    elseif crankAngle == 150
        i = 5;
    else
        error('Not a valid crank angle');
    end

    % jointAngles = ( [jointAnglesMatrix(i, 2), jointAnglesMatrix(i, 3)] );
    hipAngles = jointAnglesMatrix(i,2);
    kneeAngles = jointAnglesMatrix(i,3);

end