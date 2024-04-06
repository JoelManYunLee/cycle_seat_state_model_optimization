function [found_alpha_G] = get_activation_values_G(crankAngle)

    %Input Parameters
    %data(:,1): crank angle
    %data(:,2): alpha of G

    data = [1.327209209	0.043659044
        4.386277991	0.053014553
        7.798316248	0.062370062
        10.62207205	0.071725572
        13.09285837	0.07952183
        16.26958364	0.087318087
        18.97568295	0.093555094
        22.27006472	0.101351351
        26.27038543	0.109147609
        28.97648474	0.116943867
        31.80024054	0.129417879
        34.27102686	0.144490644
        36.38884371	0.155925156
        38.50666056	0.167879418
        40.97744688	0.179313929
        43.80120268	0.188669439
        46.50730199	0.1995842
        49.0957448	0.208939709
        51.21356165	0.222453222
        53.3313785	0.237006237
        55.09622587	0.249480249
        56.86107325	0.263513514
        58.9788901	0.277027027
        61.09670695	0.28950104
        63.2145238	0.300935551
        65.68531012	0.313409563
        68.15609644	0.32952183
        69.92094382	0.342255717
        71.33282172	0.35472973
        72.74469962	0.371881497
        74.15657752	0.390592516
        75.56845541	0.408523909
        76.98033331	0.425675676
        78.03924174	0.441268191
        78.74518069	0.453742204
        79.45111964	0.464656965
        80.51002806	0.48024948
        81.92190596	0.498960499
        82.98081439	0.512993763
        83.68675334	0.525467775
        84.74566176	0.545738046
        86.15753966	0.566008316
        87.21644808	0.581600832
        87.92238703	0.592515593
        88.98129546	0.608108108
        90.04020388	0.628378378
        90.74614283	0.640852391
        91.80505126	0.656444906
        92.86395968	0.672037422
        93.56989863	0.682952183
        94.27583758	0.693866944
        94.98177653	0.706340956
        95.68771548	0.721933472
        96.39365443	0.735966736
        97.09959338	0.748440748
        97.80553233	0.762474012
        98.51147128	0.774948025
        99.21741023	0.790540541
        99.92334918	0.804573805
        100.6292881	0.82016632
        101.6881966	0.846673597
        102.3941355	0.863045738
        102.747105	0.874740125
        103.4530439	0.89033264
        104.1589829	0.902806653
        104.8649218	0.91995842
        105.5708608	0.935550936
        106.2767997	0.948024948
        106.9827387	0.962058212
        108.0416471	0.980769231
        109.8064945	1
        113.3361892	1
        115.1010366	0.987006237
        116.5129145	0.972193347
        117.5718229	0.958939709
        118.6307313	0.942567568
        120.0426092	0.924636175
        121.4544871	0.907484407
        122.866365	0.889553015
        123.9252735	0.876299376
        124.9841819	0.860706861
        126.3960598	0.843555094
        127.8079377	0.826403326
        129.2198156	0.809251559
        130.6316935	0.787422037
        132.0435714	0.77027027
        133.4554493	0.753898129
        134.8673272	0.735966736
        136.2792051	0.72037422
        138.3970219	0.706340956
        141.1031212	0.6995842
        144.397503	0.707900208
        146.5153199	0.72037422
        149.3390757	0.728690229
        152.1628315	0.723492723
        154.2806483	0.711018711
        156.0454957	0.698544699
        157.4573736	0.686850312
        158.8692515	0.672037422
        160.2811294	0.65956341
        161.6930073	0.647089397
        163.1048852	0.632276507
        164.5167631	0.618243243
        165.928641	0.604209979
        167.3405189	0.590176715
        168.7523968	0.573804574
        170.1642747	0.553534304
        171.2231831	0.541060291
        172.2820915	0.526247401
        173.3409999	0.512993763
        174.0469389	0.500519751
        174.7528778	0.48960499
        175.4588168	0.477130977
        176.5177252	0.45997921
        177.9296031	0.43970894
        178.9885115	0.425675676
        179.6944505	0.413201663
        180.7533589	0.396049896
        182.1652368	0.376559252
        183.5771147	0.357848233
        184.9889926	0.343035343
        186.4008705	0.324324324
        187.8127484	0.308731809
        189.2246263	0.294698545
        190.6365042	0.283783784
        192.0483821	0.271309771
        193.8132295	0.258835759
        196.2840158	0.244802495
        198.7548021	0.233887734
        203.2257488	0.223492723
        206.1671611	0.219074844
        208.9909169	0.213617464
        211.6970162	0.208939709
        215.226711	0.1995842
        218.1681232	0.188669439
        220.991879	0.177754678
        223.8156348	0.166839917
        226.6393906	0.154365904
        229.4631464	0.143451143
        232.4045587	0.134095634
        234.7576886	0.128898129
        237.5814444	0.123180873
        240.8758261	0.115384615
        243.228956	0.110706861
        246.4056812	0.104469854
        249.935376	0.098232848
        252.8767883	0.094594595
        255.4652311	0.092515593
        258.4066434	0.09043659
        261.2303992	0.09043659
        264.054155	0.09043659
        266.9955673	0.088357588
        269.3486971	0.085758836
        272.1724529	0.07952183
        275.3491782	0.070945946
        278.0552775	0.062370062
        279.9377813	0.056133056
        283.1145066	0.053014553
        286.9971708	0.04989605
        290.1738961	0.045997921
        293.1153084	0.041580042
        295.8214077	0.035862786
        297.9392246	0.031185031
        300.7629804	0.028066528
        303.9397056	0.024948025
        306.7634614	0.021829522
        309.9401867	0.017931393
        312.7639425	0.012474012
        315.2347288	0.007796258
        318.2937976	0.002079002
        320.8822404	0
        325.1178741	0
        328.8828819	0.004158004
        331.7066376	0.009355509
        334.6480499	0.017931393
        337.3541492	0.024948025
        341.0015005	0.032744283
        343.8252563	0.036642412
        346.6490121	0.039760915
        349.4727679	0.043659044 ];

    crank_angles = data(:,1);
    alpha_G = data(:,2);

    regression_eqn = polyfit(crank_angles, alpha_G, 4);

    found_alpha_G = regression_eqn(1)*(crankAngle)^4 + regression_eqn(2)*(crankAngle)^3 + regression_eqn(3)*(crankAngle)^2 + regression_eqn(4)*(crankAngle)^1 + regression_eqn(5);
    %found_alpha_G = regression_eqn(1)*(crankAngle)^10 + regression_eqn(2)*(crankAngle)^9 + regression_eqn(3)*(crankAngle)^8 + regression_eqn(4)*(crankAngle)^7 + regression_eqn(5)*(crankAngle)^6 + regression_eqn(6)*(crankAngle)^5 + regression_eqn(7)*(crankAngle)^4 + regression_eqn(8)*(crankAngle)^3 + regression_eqn(9)*(crankAngle)^2 + regression_eqn(10)*(crankAngle)^1 + regression_eqn(11);
end