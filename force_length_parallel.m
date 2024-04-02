function [normalize_PE_force] = force_length_parallel(lm)
%%%% TAKS 1

% Input Parameters
% lm: normalized length of muscle (contractile element)

% Output
% normalized force produced by parallel elastic element

% WRITE YOUR CODE HERE
for i = 1:length (lm)
    if lm(1,i) < 1
        normalize_PE_force(1,i) = 0;
    else
        normalize_PE_force(1,i) = (3*power((lm(1,i) - 1),2))/(0.6 + lm(1,i) - 1);
    end
end