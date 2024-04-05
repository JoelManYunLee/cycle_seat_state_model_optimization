function [found_angle] = get_hip_angle(crankAngle)

    % Input Parameters
    % data(:,1): samples of an independent variable
    % data(:,2): corresponding samples of a dependent variable
    
    data = [-0.5677651411026403, 70.05889177239075
        13.8850864972907, 70.69127945171014
        29.199649631227558, 69.46042277210655
        44.095307760761486, 67.19374181735165
        59.4211926515741, 64.09898849653592
        74.32943051097001, 59.76131127376753
        89.23892634335209, 55.21653442419781
        104.15219609469278, 50.05045869422404
        119.9183715306736, 44.47083599293671
        134.8303833090281, 39.511859889764295
        149.3096523801315, 35.79515540625539
        165.060732140278, 32.70072822658423
        179.52113161658852, 32.09051814509554
        194.40295204327433, 32.10193308515545
        210.12887234369688, 33.14949844151125
        224.57417614417307, 35.02448388163872
        239.01696399867689, 37.313668575368894
        254.73156254222368, 40.225130572936806
        268.7378337705178, 44.37788576673453
        283.5856889265763, 49.98099063043084
        298.8625128709274, 54.96312275486766
        313.71917383788934, 59.116530230954524
        328.5783507508236, 62.85573845343869
        344.28791740242565, 66.59559895821201
        359.14961026133227, 69.92060792709347]; % Data taken from "Joint Motions of the Lower Limb during Ergometer Cycling"
    
    crank_angles = data(:,1); % Activation data
    hip_angles = data(:,2); % Max velocity data
    
    regression_eqn = polyfit(crank_angles, hip_angles, 4); % fit a fourth order polynomial to the data
    
    found_angle = regression_eqn(1)*(crankAngle)^4 + regression_eqn(2)*(crankAngle)^3 + regression_eqn(3)*(crankAngle)^2 + regression_eqn(4)*(crankAngle) + regression_eqn(5); % Find max_velocity from regression equation
    end