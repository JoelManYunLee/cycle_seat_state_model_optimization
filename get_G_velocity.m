function [velo] = get_G_velocity(crankAngle)
    % crank angles data is 1 column matrix
    %  G velocity data is 1 column matrix

    data = [ 1	-0.003874776
            2	-0.003874776
            3	-0.002528475
            4	-0.001210126
            5	8.03E-05
            6	0.001342857
            7	0.002577597
            8	0.003784595
            9	0.004963938
            10	0.006115724
            11	0.007240063
            12	0.008337075
            13	0.009406893
            14	0.010449659
            15	0.011465526
            16	0.012454654
            17	0.013417215
            18	0.014353388
            19	0.015263362
            20	0.016147331
            21	0.017005499
            22	0.017838077
            23	0.01864528
            24	0.019427334
            25	0.020184466
            26	0.020916914
            27	0.021624917
            28	0.02230872
            29	0.022968576
            30	0.023604738
            31	0.024217466
            32	0.024807023
            33	0.025373676
            34	0.025917694
            35	0.026439351
            36	0.026938923
            37	0.027416688
            38	0.027872927
            39	0.028307923
            40	0.02872196
            41	0.029115326
            42	0.029488307
            43	0.029841194
            44	0.030174275
            45	0.030487842
            46	0.030782186
            47	0.0310576
            48	0.031314374
            49	0.031552802
            50	0.031773176
            51	0.031975788
            52	0.032160929
            53	0.03232889
            54	0.032479962
            55	0.032614433
            56	0.032732594
            57	0.032834731
            58	0.03292113
            59	0.032992077
            60	0.033047855
            61	0.033088746
            62	0.033115031
            63	0.033126988
            64	0.033124893
            65	0.033109023
            66	0.033079649
            67	0.033037042
            68	0.032981472
            69	0.032913204
            70	0.032832502
            71	0.032739628
            72	0.032634842
            73	0.0325184
            74	0.032390556
            75	0.032251563
            76	0.032101668
            77	0.031941118
            78	0.031770157
            79	0.031589026
            80	0.031397962
            81	0.031197201
            82	0.030986975
            83	0.030767513
            84	0.030539042
            85	0.030301785
            86	0.030055964
            87	0.029801795
            88	0.029539493
            89	0.029269271
            90	0.028991337
            91	0.028705897
            92	0.028413153
            93	0.028113306
            94	0.027806552
            95	0.027493085
            96	0.027173096
            97	0.026846773
            98	0.026514301
            99	0.026175862
            100	0.025831635
            101	0.025481796
            102	0.025126518
            103	0.024765973
            104	0.024400327
            105	0.024029746
            106	0.023654391
            107	0.023274422
            108	0.022889995
            109	0.022501264
            110	0.02210838
            111	0.021711491
            112	0.021310743
            113	0.020906279
            114	0.020498241
            115	0.020086765
            116	0.019671988
            117	0.019254043
            118	0.01883306
            119	0.018409169
            120	0.017982494
            121	0.01755316
            122	0.017121288
            123	0.016686998
            124	0.016250406
            125	0.015811628
            126	0.015370776
            127	0.014927962
            128	0.014483294
            129	0.014036879
            130	0.013588823
            131	0.013139227
            132	0.012688194
            133	0.012235823
            134	0.011782213
            135	0.011327458
            136	0.010871654
            137	0.010414893
            138	0.009957267
            139	0.009498866
            140	0.009039778
            141	0.00858009
            142	0.008119888
            143	0.007659256
            144	0.007198277
            145	0.006737034
            146	0.006275606
            147	0.005814073
            148	0.005352514
            149	0.004891006
            150	0.004429626
            151	0.003968449
            152	0.003507549
            153	0.003047001
            154	0.002586877
            155	0.002127249
            156	0.001668188
            157	0.001209766
            158	0.000752053
            159	0.000295116
            160	-0.000160973
            161	-0.000616149
            162	-0.001070341
            163	-0.001523484
            164	-0.00197551
            165	-0.002426353
            166	-0.002875946
            167	-0.003324224
            168	-0.003771121
            169	-0.004216572
            170	-0.004660511
            171	-0.005102874
            172	-0.005543596
            173	-0.005982612
            174	-0.006419857
            175	-0.006855267
            176	-0.007288777
            177	-0.007720323
            178	-0.008149839
            179	-0.008577262
            180	-0.009002526
            181	-0.009425567
            182	-0.009846319
            183	-0.010264717
            184	-0.010680695
            185	-0.011094189
            186	-0.011505132
            187	-0.011913458
            188	-0.0123191
            189	-0.012721993
            190	-0.013122069
            191	-0.01351926
            192	-0.013913499
            193	-0.014304718
            194	-0.014692849
            195	-0.015077822
            196	-0.015459569
            197	-0.01583802
            198	-0.016213105
            199	-0.016584754
            200	-0.016952895
            201	-0.017317458
            202	-0.01767837
            203	-0.01803556
            204	-0.018388955
            205	-0.018738481
            206	-0.019084066
            207	-0.019425635
            208	-0.019763113
            209	-0.020096426
            210	-0.020425498
            211	-0.020750254
            212	-0.021070616
            213	-0.021386508
            214	-0.021697853
            215	-0.022004573
            216	-0.02230659
            217	-0.022603825
            218	-0.0228962
            219	-0.023183634
            220	-0.023466047
            221	-0.023743361
            222	-0.024015494
            223	-0.024282364
            224	-0.024543892
            225	-0.024799994
            226	-0.025050589
            227	-0.025295595
            228	-0.025534929
            229	-0.025768508
            230	-0.025996249
            231	-0.026218069
            232	-0.026433883
            233	-0.026643609
            234	-0.026847162
            235	-0.027044458
            236	-0.027235412
            237	-0.027419941
            238	-0.02759796
            239	-0.027769384
            240	-0.02793413
            241	-0.028092111
            242	-0.028243245
            243	-0.028387446
            244	-0.02852463
            245	-0.028654713
            246	-0.028777611
            247	-0.028893239
            248	-0.029001515
            249	-0.029102354
            250	-0.029195674
            251	-0.029281392
            252	-0.029359424
            253	-0.02942969
            254	-0.029492106
            255	-0.029546592
            256	-0.029593067
            257	-0.029631451
            258	-0.029661663
            259	-0.029683626
            260	-0.029697259
            261	-0.029702486
            262	-0.029699228
            263	-0.029687411
            264	-0.029666957
            265	-0.029637793
            266	-0.029599844
            267	-0.029553037
            268	-0.029497301
            269	-0.029432564
            270	-0.029358756
            271	-0.029275808
            272	-0.029183652
            273	-0.029082222
            274	-0.028971452
            275	-0.028851278
            276	-0.028721637
            277	-0.028582467
            278	-0.028433708
            279	-0.028275302
            280	-0.02810719
            281	-0.027929317
            282	-0.027741629
            283	-0.027544073
            284	-0.027336598
            285	-0.027119154
            286	-0.026891694
            287	-0.026654172
            288	-0.026406544
            289	-0.026148767
            290	-0.025880802
            291	-0.02560261
            292	-0.025314154
            293	-0.0250154
            294	-0.024706316
            295	-0.024386872
            296	-0.02405704
            297	-0.023716793
            298	-0.023366109
            299	-0.023004966
            300	-0.022633346
            301	-0.022251231
            302	-0.021858608
            303	-0.021455464
            304	-0.021041792
            305	-0.020617583
            306	-0.020182835
            307	-0.019737545
            308	-0.019281715
            309	-0.018815349
            310	-0.018338454
            311	-0.017851039
            312	-0.017353116
            313	-0.0168447
            314	-0.01632581
            315	-0.015796467
            316	-0.015256693
            317	-0.014706517
            318	-0.014145968
            319	-0.013575079
            320	-0.012993887
            321	-0.01240243
            322	-0.01180075
            323	-0.011188895
            324	-0.010566911
            325	-0.009934852
            326	-0.009292773
            327	-0.008640732
            328	-0.007978791
            329	-0.007307016
            330	-0.006625476
            331	-0.005934243
            332	-0.005233392
            333	-0.004523003
            334	-0.003803158
            335	-0.003073943
            336	-0.002335448
            337	-0.001587767
            338	-0.000830995
            339	-6.52E-05
            340	0.000709413
            341	0.001492838
            342	0.002284929
            343	0.003085572
            344	0.003894649
            345	0.004712036
            346	0.005537608
            347	0.006371236
            348	0.007212785
            349	0.008062119
            350	0.008919096
            351	0.009783573
            352	0.010655401
            353	0.011534428
            354	0.012420498
            355	0.013313451
            356	0.014213125
            357	0.015119351
            358	0.01603196
            359	0.016950777
            360	0.016950777 ];

    crank_angles = data(:,1); % crank angles data
    G_velocity = data(:,2); % G velocity data

    regression_eqn = polyfit(crank_angles, G_velocity, 4); % fit a fourth order polynomial to the data
    velo = regression_eqn(1)*(crankAngle)^4 + regression_eqn(2)*(crankAngle)^3+ regression_eqn(3)*(crankAngle)^2 + regression_eqn(4)*(crankAngle) + regression_eqn(5); % Find BF_velocity
end