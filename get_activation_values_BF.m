function [found_alpha_BF] = get_activation_values_BF(crankAngle)

    %Input Parameters
    %data(:,1): crank angle
    %data(:,2): alpha of BF

    data = [0.678431265,	0.067
        2.792765595,	0.082
        4.907099926,	0.096
        7.373823311,	0.11
        10.19293575,	0.121
        13.01204819,	0.123
        15.83116063,	0.125
        18.65027307,	0.132
        20.7646074,	0.145
        22.17416362,	0.16
        23.58371985,	0.176
        24.99327607,	0.193
        26.40283229,	0.213
        27.81238851,	0.234
        29.22194473,	0.252
        30.63150095,	0.271
        32.04105717,	0.287
        33.45061339,	0.302
        35.21255866,	0.318
        37.32689299,	0.333
        39.79361638,	0.347
        42.61272882,	0.355
        45.43184126,	0.359
        48.2509537,	0.361
        51.07006614,	0.364
        53.88917858,	0.369
        56.70829102,	0.375
        59.52740346,	0.379
        62.3465159,	0.379
        65.16562834,	0.377
        67.98474079,	0.375
        70.80385323,	0.376
        73.62296567,	0.384
        76.08968905,	0.396
        77.85163433,	0.409
        79.6135796,	0.425
        81.37552488,	0.444
        82.7850811,	0.461
        84.19463732,	0.484
        85.60419354,	0.504
        86.30897165,	0.522
        87.71852787,	0.544
        88.42330598,	0.562
        89.12808409,	0.578
        89.8328622,	0.599
        90.53764031,	0.621
        91.24241842,	0.641
        91.94719653,	0.665
        92.65197464,	0.688
        93.35675275,	0.71
        94.06153086,	0.73
        94.76630897,	0.753
        95.47108708,	0.774
        96.17586519,	0.795
        96.8806433,	0.817
        97.93781047,	0.834
        98.99497763,	0.853
        101.109312,	0.862
        103.2236463,	0.846
        104.6332025,	0.828
        106.0427587,	0.809
        108.1570931,	0.789
        110.6238165,	0.792
        111.6809836,	0.813
        112.9730768,	0.837
        113.7953179,	0.857
        114.5000961,	0.876
        115.2048742,	0.895
        115.9096523,	0.911
        116.6144304,	0.931
        117.3192085,	0.949
        117.6715976,	0.962
        118.7287647,	0.981
        120.843099,	1
        122.9574334,	0.99
        124.3669896,	0.971
        125.7765458,	0.951
        127.186102,	0.929
        128.5956583,	0.904
        130.3576035,	0.88
        132.8243269,	0.867
        135.6434394,	0.86
        138.4625518,	0.851
        140.5768861,	0.832
        141.9864424,	0.811
        143.0436095,	0.79
        144.1007767,	0.774
        144.8055548,	0.756
        145.5103329,	0.737
        146.215111,	0.721
        146.9198891,	0.705
        147.6246672,	0.69
        148.3294453,	0.674
        149.0342235,	0.656
        149.7390016,	0.639
        150.7961687,	0.616
        151.5009468,	0.601
        152.2057249,	0.59
        153.2628921,	0.569
        154.6724483,	0.545
        155.7296155,	0.528
        156.7867827,	0.51
        158.1963389,	0.49
        159.6058951,	0.474
        161.0154513,	0.461
        163.1297857,	0.445
        165.9488981,	0.433
        168.7680105,	0.422
        171.587123,	0.415
        174.4062354,	0.407
        177.2253479,	0.397
        180.0444603,	0.388
        182.8635727,	0.381
        185.6826852,	0.374
        188.5017976,	0.366
        191.3209101,	0.359
        194.1400225,	0.35
        196.9591349,	0.341
        199.7782474,	0.331
        202.5973598,	0.32
        205.4164723,	0.309
        208.2355847,	0.297
        211.0546971,	0.288
        213.8738096,	0.279
        216.692922,	0.269
        219.5120345,	0.26
        222.3311469,	0.249
        225.1502594,	0.236
        227.9693718,	0.222
        230.4360952,	0.207
        232.9028186,	0.193
        235.3695419,	0.177
        237.8362653,	0.162
        240.6553778,	0.149
        243.4744902,	0.137
        246.2936027,	0.129
        249.1127151,	0.121
        251.9318275,	0.112
        254.75094,	0.103
        257.5700524,	0.094
        260.3891649,	0.084
        263.2082773,	0.076
        266.0273897,	0.069
        268.8465022,	0.064
        271.6656146,	0.061
        274.4847271,	0.061
        277.3038395,	0.061
        280.1229519,	0.059
        282.9420644,	0.056
        285.7611768,	0.05
        288.5802893,	0.042
        291.3994017,	0.033
        294.2185141,	0.021
        297.0376266,	0.011
        299.856739,	0.004
        302.6758515,	0
        305.4949639,	0
        308.3140764,	0.003
        311.1331888,	0.008
        313.9523012,	0.013
        316.7714137,	0.017
        319.5905261,	0.024
        322.4096386,	0.029
        325.228751,	0.033
        328.0478634,	0.035
        330.8669759,	0.036
        333.6860883,	0.034
        336.5052008,	0.033
        339.3243132,	0.033
        342.1434256,	0.036
        344.9625381,	0.041
        347.7816505,	0.047
        349.5435958,	0.052];

    crank_angles = data(:,1);
    alpha_BF = data(:,2);

    regression_eqn = polyfit(crank_angles, alpha_BF, 4);

    found_alpha_BF = regression_eqn(1)*(crankAngle)^4 + regression_eqn(2)*(crankAngle)^3 + regression_eqn(3)*(crankAngle)^2 + regression_eqn(4)*(crankAngle)^1 + regression_eqn(5);
    %found_alpha_BF = regression_eqn(1)*(crankAngle)^10 + regression_eqn(2)*(crankAngle)^9 + regression_eqn(3)*(crankAngle)^8 + regression_eqn(4)*(crankAngle)^7 + regression_eqn(5)*(crankAngle)^6 + regression_eqn(6)*(crankAngle)^5 + regression_eqn(7)*(crankAngle)^4 + regression_eqn(8)*(crankAngle)^3 + regression_eqn(9)*(crankAngle)^2 + regression_eqn(10)*(crankAngle)^1 + regression_eqn(11);
end