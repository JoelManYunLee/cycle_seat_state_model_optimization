function [bfValue, rfValue, gasValue] = getActivationValues( crankAngle )
    activationValuesMatrix =
        [ 30, .262, .658, .124
          60, .379, .477, .283
          90, .610, .196, .628
          120, .992, .165, .924
          150, .639, .114, .725 ]; %second column is bf, third column is rf, fourth column is gas
    
    int i = 1;
    if crankAngle == 30
        i = 1;
    else if crankAngle == 60
        i = 2;
    else if crankAngle == 90
        i = 3;
    else if crankAngle == 120
        i = 4;
    else if crankAngle == 150
        i = 5;
    else    
        error('Not a valid crank angle')
    end

    % activationValues = ( [activationValuesMatrix(i, 2), activationValuesMatrix(i, 3), activationValuesMatrix(i, 4)] );
    bfValue = activationValuesMatrix(i, 2);
    rfValue = activationValuesMatrix(i, 3);
    gasValue = activationValuesMatrix(i, 4);

end