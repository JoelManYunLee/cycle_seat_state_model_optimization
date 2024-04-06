function [found_alpha_BF] = Vcc(crankAngle)

    %Input Parameters
    %data(:,1): crank angle
    %data(:,2): alpha of BF

    data = [0.678431265, 21.74419225
        2.792765595,	22.69746809
        4.907099926,	23.53158445
        7.373823311,	24.43521051
        10.19293575,	25.06079778
        13.01204819,	25.239537
        15.83116063,	25.35869648
        18.65027307,	25.77575467
        20.7646074,	26.55029129
        22.17416362,	27.50356713
        23.58371985,	28.45684297
        24.99327607,	29.52927829
        26.40283229,	30.78045283
        27.81238851,	32.03162738
        29.22194473,	33.16364244
        30.63150095,	34.2956575
        32.04105717,	35.30851308
        33.45061339,	36.20220918
        35.21255866,	37.19520485
        37.32689299,	38.14848069
        39.79361638,	39.00245697
        42.61272882,	39.47909489
        45.43184126,	39.74720372
        48.2509537,	39.83657333
        51.07006614,	40.04510242
        53.88917858,	40.37279099
        56.70829102,	40.70047956
        59.52740346,	40.96858839
        62.3465159,	40.96858839
        65.16562834,	40.81963904
        67.98474079, 40.73026943
        70.80385323,	40.78984917
        73.62296567,	41.26648709
        76.08968905,	42.04102371
        77.85163433,	42.81556033
        79.6135796,	43.82841592
        81.37552488,	44.96043098
        82.7850811,	46.0328663
        84.19463732,	47.40320032
        85.60419354,	48.65437487
        86.30897165,	49.78638993
        87.71852787,	51.09714421
        88.42330598,	52.22915927
        89.12808409,	53.24201485
        89.8328622,	54.4931894
        90.53764031,	55.86352342
        91.24241842,	57.11469796
        91.94719653,	58.54461172
        92.65197464,	59.97452548
        93.35675275,	61.34485951
        94.06153086,	62.59603405
        94.76630897,	63.96636807
        95.47108708,	65.27712235
        96.17586519,	66.58787664
        96.8806433,	67.89863092
        97.93781047,	68.97106624
        98.99497763,	70.16266104
        101.109312,	70.66908883
        103.2236463,	69.68602312
        104.6332025,	68.6135878
        106.0427587,	67.421993
        108.1570931,	66.2303982
        110.6238165,	66.3892775
        111.6809836,	67.66031196
        112.9730768,	69.12994555
        113.7953179,	70.40098
        114.5000961,	71.53299507
        115.2048742,	72.72458987
        115.9096523,	73.73744545
        116.6144304,	74.92904025
        117.3192085,	76.06105531
        117.6715976,	76.83559193
        118.7287647,	78.02718674
        120.843099,	79.18899167
        122.9574334,	78.5634044
        124.3669896,	77.43138934
        125.7765458,	76.18021479
        127.186102,	74.80988077
        128.5956583,	73.26080753
        130.3576035,	71.83089377
        132.8243269,	71.02656727
        135.6434394,	70.57971922
        138.4625518,	70.01371169
        140.5768861,	68.85190676
        141.9864424,	67.54115248
        143.0436095,	66.28997794
        144.1007767,	65.27712235
        144.8055548,	64.14510729
        145.5103329,	63.01309223
        146.215111,	62.00023665
        146.9198891,	61.04696081
        147.6246672,	60.09368497
        148.3294453,	59.14040912
        149.0342235,	58.00839406
        149.7390016,	56.99553848
        150.7961687,	55.56562472
        151.5009468,	54.61234888
        152.2057249,	53.95697173
        153.2628921,	52.64621745
        154.6724483,	51.21630369
        155.7296155,	50.14386837
        156.7867827,	49.01185331
        158.1963389,	47.8202585
        159.6058951,	46.80740292
        161.0154513,	46.0328663
        163.1297857,	45.02001072
        165.9488981,	44.27526397
        168.7680105,	43.61988683
        171.587123,	43.17303878
        174.4062354,	42.66661098
        177.2253479,	42.07081358
        180.0444603,	41.50480605
        182.8635727,	41.08774787
        185.6826852,	40.64089982
        188.5017976,	40.19405177
        191.3209101,	39.71741385
        194.1400225,	39.18119619
        196.9591349,	38.61518866
        199.7782474,	37.98960139
        202.5973598,	37.33422425
        205.4164723,	36.64905723
        208.2355847,	35.93410035
        211.0546971,	35.39788269
        213.8738096,	34.80208529
        216.692922,	34.20628789
        219.5120345,	33.64028036
        222.3311469,	32.98490322
        225.1502594,	32.15078686
        227.9693718,	31.31667049
        230.4360952,	30.40311448
        232.9028186,	29.52927829
        235.3695419,	28.53628262
        237.8362653,	27.62272661
        240.6553778,	26.78861025
        243.4744902,	26.10344324
        246.2936027,	25.59701544
        249.1127151,	25.09058765
        251.9318275,	24.52458012
        254.75094,	23.98836246
        257.5700524,	23.4521448
        260.3891649,	22.82655753
        263.2082773,	22.32012974
        266.0273897,	21.87328169
        268.8465022,	21.57538299
        271.6656146,	21.42643364
        274.4847271,	21.42643364
        277.3038395,	21.42643364
        280.1229519,	21.27748429
        282.9420644,	21.09874507
        285.7611768,	20.71147676
        288.5802893,	20.23483884
        291.3994017,	19.6688313
        294.2185141,	18.95387442
        297.0376266,	18.32828715
        299.856739,	17.91122897
        302.6758515,	17.64312014
        305.4949639,	17.64312014
        308.3140764,	17.85164923
        311.1331888,	18.11975806
        313.9523012,	18.41765676
        316.7714137,	18.71555546
        319.5905261,	19.10282377
        322.4096386,	19.43051234
        325.228751,	19.69862117
        328.0478634,	19.81778065
        330.8669759,	19.84757052
        333.6860883,	19.75820091
        336.5052008,	19.69862117
        339.3243132,	19.6688313
        342.1434256,	19.84757052
        344.9625381,	20.14546923
        347.7816505,	20.53273754
        349.5435958,	20.83063624];

    crank_angles = data(:,1);
    alpha_BF = data(:,2);

    regression_eqn = polyfit(crank_angles, alpha_BF, 10);

    found_alpha_BF = regression_eqn(1)*(crankAngle)^10 + regression_eqn(2)*(crankAngle)^9 + regression_eqn(3)*(crankAngle)^8 + regression_eqn(4)*(crankAngle)^7 + regression_eqn(5)*(crankAngle)^6 + regression_eqn(6)*(crankAngle)^5 + regression_eqn(7)*(crankAngle)^4 + regression_eqn(8)*(crankAngle)^3 + regression_eqn(9)*(crankAngle)^2 + regression_eqn(10)*(crankAngle)^1 + regression_eqn(11);
end