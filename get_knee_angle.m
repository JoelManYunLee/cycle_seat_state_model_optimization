function [knee_angle] = get_knee_angle(crank_angle)

    % Input Parameters
    % data(:,1): samples of an independent variable
    % data(:,2): corresponding samples of a dependent variable
    
    %%% Data is from M. O, Ericson, R. Nisell, G. Nemeth, “Joint Motions of the Lower-Limb during Ergometer Cycling,” Journal of Orthopaedic and Sports Physical Therapy, vol. 9, no.8, pp.273-278, 1998. doi:10.2519/jospt.1988.9.8.273.
    data = [-1.8929254302103402, 109.10216718266253
        13.078393881453152, 106.37770897832817
        28.04971319311663, 100.68111455108358
        43.02103250478011, 94.4891640866873
        57.9923518164436, 87.30650154798761
        73.47992351816444, 79.38080495356036
        87.93499043977056, 71.95046439628481
        102.39005736137668, 64.02476780185758
        118.91013384321226, 56.594427244582036
        133.36520076481838, 50.1547987616099
        148.8527724665392, 46.19195046439627
        163.30783938814534, 45.69659442724456
        178.79541108986618, 48.668730650154785
        192.73422562141494, 53.12693498452012
        208.73804971319313, 59.07120743034055
        223.19311663479928, 65.51083591331269
        238.16443594646276, 72.69349845201238
        254.16826003824096, 80.86687306501547
        268.6233269598471, 88.29721362229101
        282.5621414913958, 96.22291021671826
        299.5984703632887, 103.1578947368421
        313.0210325047801, 106.62538699690401
        327.9923518164436, 109.34984520123838
        342.9636711281071, 110.58823529411764
        358.45124282982795, 109.59752321981424
        ]; % Data taken from knee graph
    
    crank_angles = data(:,1);
    knee_angles = data(:,2);
    
    regression_eqn = polyfit(crank_angles, knee_angles, 5); % fit a second order polynomial to the data
    
    knee_angle = regression_eqn(1)*(crank_angle)^5 + regression_eqn(2)*(crank_angle)^4+ regression_eqn(3)*(crank_angle)^3 + regression_eqn(4)*(crank_angle)^2 + regression_eqn(5)*crank_angle + regression_eqn(6); % Find knee angle
    end