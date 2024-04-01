function [normalize_tendon_tension] = force_length_tendon(lt)
%%%% TAKS 1

% Input Parameters
% lt: normalized length of tendon (series elastic element)

% Output
% normalized tension produced by tendon

% WRITE YOUR CODE HERE
for i = 1:length(lt)
    if lt(1,i) < 1
        normalize_tendon_tension(1,i) = 0;
    else
        normalize_tendon_tension(1,i) = 10*(lt(1,i) - 1) + 240*power((lt(1,i) - 1),2);
    end
end