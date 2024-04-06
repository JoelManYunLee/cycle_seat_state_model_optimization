function [velo] = get_RF_velocity(crankAngle)
    % crank angles data is 1 column matrix
    %  rf velocity data is 1 column matrix

    data = [1	-0.003987817
            2	-0.003987817
            3	-0.004803248
            4	-0.005598278
            5	-0.00637387
            6	-0.00713093
            7	-0.007870306
            8	-0.008592793
            9	-0.009299133
            10	-0.009990018
            11	-0.010666092
            12	-0.011327953
            13	-0.011976152
            14	-0.0126112
            15	-0.013233566
            16	-0.013843681
            17	-0.014441935
            18	-0.015028687
            19	-0.015604257
            20	-0.016168936
            21	-0.016722981
            22	-0.017266621
            23	-0.017800057
            24	-0.018323462
            25	-0.018836983
            26	-0.019340745
            27	-0.019834849
            28	-0.020319374
            29	-0.020794379
            30	-0.021259904
            31	-0.021715971
            32	-0.022162586
            33	-0.022599737
            34	-0.0230274
            35	-0.023445535
            36	-0.023854091
            37	-0.024253005
            38	-0.024642202
            39	-0.0250216
            40	-0.025391106
            41	-0.025750618
            42	-0.02610003
            43	-0.026439226
            44	-0.026768086
            45	-0.027086486
            46	-0.027394297
            47	-0.027691385
            48	-0.027977616
            49	-0.028252852
            50	-0.028516953
            51	-0.02876978
            52	-0.029011192
            53	-0.029241048
            54	-0.02945921
            55	-0.029665537
            56	-0.029859895
            57	-0.030042147
            58	-0.030212162
            59	-0.030369811
            60	-0.030514969
            61	-0.030647513
            62	-0.030767325
            63	-0.030874293
            64	-0.030968309
            65	-0.031049269
            66	-0.031117075
            67	-0.031171635
            68	-0.031212864
            69	-0.031240681
            70	-0.031255013
            71	-0.031255794
            72	-0.031242963
            73	-0.031216467
            74	-0.031176261
            75	-0.031122306
            76	-0.031054572
            77	-0.030973035
            78	-0.030877679
            79	-0.030768497
            80	-0.030645488
            81	-0.030508661
            82	-0.030358032
            83	-0.030193624
            84	-0.03001547
            85	-0.02982361
            86	-0.029618093
            87	-0.029398975
            88	-0.029166321
            89	-0.028920203
            90	-0.028660704
            91	-0.02838791
            92	-0.028101921
            93	-0.02780284
            94	-0.027490781
            95	-0.027165865
            96	-0.026828219
            97	-0.026477981
            98	-0.026115294
            99	-0.025740309
            100	-0.025353186
            101	-0.02495409
            102	-0.024543194
            103	-0.02412068
            104	-0.023686733
            105	-0.023241549
            106	-0.022785328
            107	-0.022318276
            108	-0.021840608
            109	-0.021352544
            110	-0.020854309
            111	-0.020346135
            112	-0.019828259
            113	-0.019300924
            114	-0.01876438
            115	-0.018218878
            116	-0.017664679
            117	-0.017102046
            118	-0.016531247
            119	-0.015952554
            120	-0.015366244
            121	-0.014772599
            122	-0.014171904
            123	-0.013564446
            124	-0.01295052
            125	-0.012330419
            126	-0.011704443
            127	-0.011072893
            128	-0.010436074
            129	-0.009794293
            130	-0.009147858
            131	-0.008497081
            132	-0.007842276
            133	-0.007183756
            134	-0.00652184
            135	-0.005856843
            136	-0.005189086
            137	-0.004518888
            138	-0.003846569
            139	-0.003172451
            140	-0.002496855
            141	-0.001820102
            142	-0.001142513
            143	-0.000464411
            144	0.000213886
            145	0.000892056
            146	0.001569782
            147	0.002246744
            148	0.002922625
            149	0.003597112
            150	0.00426989
            151	0.004940646
            152	0.005609072
            153	0.006274858
            154	0.0069377
            155	0.007597295
            156	0.008253342
            157	0.008905543
            158	0.009553604
            159	0.010197234
            160	0.010836144
            161	0.01147005
            162	0.01209867
            163	0.012721728
            164	0.01333895
            165	0.013950066
            166	0.014554812
            167	0.015152927
            168	0.015744154
            169	0.016328241
            170	0.016904942
            171	0.017474014
            172	0.01803522
            173	0.018588328
            174	0.01913311
            175	0.019669346
            176	0.020196817
            177	0.020715314
            178	0.021224632
            179	0.02172457
            180	0.022214934
            181	0.022695537
            182	0.023166196
            183	0.023626736
            184	0.024076985
            185	0.024516781
            186	0.024945964
            187	0.025364385
            188	0.025771896
            189	0.02616836
            190	0.026553644
            191	0.026927622
            192	0.027290174
            193	0.027641188
            194	0.027980555
            195	0.028308178
            196	0.028623961
            197	0.028927819
            198	0.029219671
            199	0.029499444
            200	0.02976707
            201	0.030022489
            202	0.030265648
            203	0.0304965
            204	0.030715003
            205	0.030921124
            206	0.031114835
            207	0.031296117
            208	0.031464953
            209	0.031621337
            210	0.031765268
            211	0.031896749
            212	0.032015792
            213	0.032122415
            214	0.032216642
            215	0.032298502
            216	0.032368033
            217	0.032425275
            218	0.032470278
            219	0.032503095
            220	0.032523787
            221	0.032532419
            222	0.032529062
            223	0.032513794
            224	0.032486697
            225	0.032447859
            226	0.032397374
            227	0.032335339
            228	0.03226186
            229	0.032177043
            230	0.032081003
            231	0.031973858
            232	0.03185573
            233	0.031726749
            234	0.031587045
            235	0.031436754
            236	0.031276018
            237	0.031104981
            238	0.03092379
            239	0.030732599
            240	0.030531564
            241	0.030320842
            242	0.030100598
            243	0.029870997
            244	0.029632208
            245	0.029384403
            246	0.029127757
            247	0.028862446
            248	0.028588651
            249	0.028306554
            250	0.028016338
            251	0.02771819
            252	0.027412298
            253	0.02709885
            254	0.026778039
            255	0.026450057
            256	0.026115096
            257	0.025773352
            258	0.025425019
            259	0.025070293
            260	0.024709372
            261	0.02434245
            262	0.023969725
            263	0.023591394
            264	0.023207651
            265	0.022818695
            266	0.022424719
            267	0.022025918
            268	0.021622485
            269	0.021214613
            270	0.020802493
            271	0.020386313
            272	0.019966262
            273	0.019542526
            274	0.019115288
            275	0.01868473
            276	0.01825103
            277	0.017814366
            278	0.01737491
            279	0.016932834
            280	0.016488306
            281	0.016041489
            282	0.015592544
            283	0.015141629
            284	0.014688897
            285	0.014234497
            286	0.013778574
            287	0.013321269
            288	0.012862718
            289	0.012403054
            290	0.011942401
            291	0.011480883
            292	0.011018616
            293	0.010555711
            294	0.010092274
            295	0.009628405
            296	0.009164199
            297	0.008699743
            298	0.00823512
            299	0.007770407
            300	0.007305672
            301	0.00684098
            302	0.006376386
            303	0.005911941
            304	0.005447688
            305	0.004983662
            306	0.004519892
            307	0.004056399
            308	0.003593198
            309	0.003130296
            310	0.00266769
            311	0.002205373
            312	0.001743328
            313	0.00128153
            314	0.000819947
            315	0.000358539
            316	-0.000102744
            317	-0.000563958
            318	-0.001025169
            319	-0.001486451
            320	-0.001947885
            321	-0.002409562
            322	-0.002871582
            323	-0.003334052
            324	-0.003797089
            325	-0.004260819
            326	-0.004725376
            327	-0.005190901
            328	-0.005657548
            329	-0.006125477
            330	-0.006594856
            331	-0.007065864
            332	-0.007538688
            333	-0.008013524
            334	-0.008490577
            335	-0.00897006
            336	-0.009452195
            337	-0.009937214
            338	-0.010425356
            339	-0.01091687
            340	-0.011412013
            341	-0.011911051
            342	-0.012414257
            343	-0.012921915
            344	-0.013434316
            345	-0.013951758
            346	-0.01447455
            347	-0.015003007
            348	-0.015537453
            349	-0.016078219
            350	-0.016625644
            351	-0.017180076
            352	-0.017741869
            353	-0.018311385
            354	-0.018888992
            355	-0.019475067
            356	-0.020069993
            357	-0.020674159
            358	-0.021287961
            359	-0.021911803
            360	-0.021911803 ];

    crank_angles = data(:,1); % crank angles data
    RF_velocity = data(:,2); % rf velocity data

    regression_eqn = polyfit(crank_angles, RF_velocity, 4); % fit a fourth order polynomial to the data
    velo = regression_eqn(1)*(crankAngle)^4 + regression_eqn(2)*(crankAngle)^3+ regression_eqn(3)*(crankAngle)^2 + regression_eqn(4)*(crankAngle) + regression_eqn(5); % Find BF_velocity
end