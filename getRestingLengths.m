function [restingMuscleTendonLengths] = getRestingLengths( muscle )
    if muscle == "bf"
        restingMuscleTendonLengths = [316, 92];
    else if muscle == "rf"
        restingMuscleTendonLengths = [349.7, 51.7];
    else if muscle == "gas"
        restingMuscleTendonLengths = [241, 212];
    else
        error('Not a valid muscle input');
    end

    %first column is resting muscle length, second column is resting tendon length
end