function [restingMuscleTendonLengths] = getRestingLengths( muscle )
    if muscle == 1 % 1 is BF
        restingMuscleTendonLengths = [316, 92];
    elseif muscle == 2 % 2 is BF
        restingMuscleTendonLengths = [349.7, 51.7];
    elseif muscle == 3 % 3 is GAS
        restingMuscleTendonLengths = [241, 212];
    else
        error('Not a valid muscle input');
    end

    %first column is resting muscle length, second column is resting tendon length
end