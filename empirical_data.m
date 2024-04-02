function [jointAngles] = selectJointAngles( crankAngle )
    jointAnglesMatrix = 
        [ 30, 69.65, 101.23
          60, 63.47, 86.03
          90, 52.98, 68.09
          120, 41.08, 51.46
          150, 29.91, 39.20 ]; %second column is for hip angle, third column is for knee angle
    
    int i = 0;
    if crankAngle == 30
        i = 0;
    else if crankAngle == 60
        i = 1;
    else if crankAngle == 90
        i = 2;
    else if crankAngle == 120
        i = 3;
    else
        i = 4;
    end

    jointAngles = ( [jointAnglesMatrix(i, 1), jointAnglesMatrix(i, 2)] );

end

function [activationValues] = getActivationValues( crankAngle )
    activationValuesMatrix =
        [ 30, .262, .658, .124
          60, .379, .477, .283
          90, .610, .196, .628
          120, .992, .165, .924
          150, .639, .114, .725 ];
    
    int i = 0;
    if crankAngle == 30
        i = 0;
    else if crankAngle == 60
        i = 1;
    else if crankAngle == 90
        i = 2;
    else if crankAngle == 120
        i = 3;
    else if crankAngle == 150
        i = 4;
    else    
        error('Not a valid crank angle')
    end

    activationValues = ( [activationValuesMatrix(i, 1), activationValuesMatrix(i, 2), activationValuesMatrix(i, 3)] );
end

function [restingMuscleTendonLengths] = getRestingLengths( muscle )
    if muscle == "bf"
        activationValues = [316, 92];
    else if muscle == "rf"
        activationValues = [349.7, 51.7];
    else if muscle == "gas"
        activationValues = [241, 212];
    else
        error('Not a valid muscle input');
    end
end