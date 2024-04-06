function [force_length_regression] = get_muscle_force_length_regression()
%%% TASK 2

% Input Parameters
% data(:,1): samples of an independent variable
% data(:,2): corresponding samples of a dependent variable

% Output
% force_length_regression: the genered Gaussian model

%     WRITE CODE HERE
%      1) Use WebPlotDigitizer to extract force-length points
%     from Winters et al. (2011) Figure 3C, which is on Learn. Click
%     "View Data", select all, cut, and paste below. 
%     2) Normalize the data so optimal length = 1 and peak = 1. 
%     3) Return a Regression object that uses Gaussian basis functions.

% Define data points

% Normalization

% Regression with "fit" function with "gauss2" option as model type

% Matrix below comes from Winters et al. force-length graph, with normalized length where a length of 1 gives an optimal force value of 1 
data = [0.22622108	0
        0.102827763	0.017751479
        0	0.08086785
        0.051413882	0.130177515
        0.205655527	0.128205128
        0.205655527	0.140039448
        0.154241645	0.159763314
        0.154241645	0.201183432
        0.095115681	0.228796844
        0.280205656	0.222879684
        0.305912596	0.222879684
        0.329048843	0.207100592
        0.205655527	0.25443787
        0.205655527	0.301775148
        0.23907455	0.305719921
        0.305912596	0.339250493
        0.30848329	0.33530572
        0.154241645	0.357001972
        0.262210797	0.41025641
        0.305912596	0.435897436
        0.357326478	0.445759369
        0.416452443	0.426035503
        0.416452443	0.424063116
        0.473007712	0.435897436
        0.416452443	0.455621302
        0.416452443	0.449704142
        0.416452443	0.451676529
        0.277634962	0.453648915
        0.277634962	0.475345168
        0.293059126	0.493096647
        0.30848329	0.532544379
        0.323907455	0.564102564
        0.357326478	0.599605523
        0.40874036	0.526627219
        0.398457584	0.532544379
        0.426735219	0.674556213
        0.437017995	0.704142012
        0.460154242	0.714003945
        0.508997429	0.712031558
        0.524421594	0.662721893
        0.511568123	0.619329389
        0.460154242	0.619329389
        0.59125964	0.623274162
        0.460154242	0.731755424
        0.473007712	0.75147929
        0.496143959	0.804733728
        0.519280206	0.814595661
        0.514138817	0.814595661
        0.547557841	0.830374753
        0.588688946	0.820512821
        0.588688946	0.810650888
        0.627249358	0.816568047
        0.614395887	0.759368836
        0.670951157	0.741617357
        0.678663239	0.779092702
        0.701799486	0.783037475
        0.69151671	0.798816568
        0.676092545	0.848126233
        0.676092545	0.848126233
        0.632390746	0.848126233
        0.586118252	0.852071006
        0.622107969	0.865877712
        0.822622108	0.785009862
        0.822622108	0.83234714
        0.807197943	0.887573964
        0.776349615	0.891518738
        0.71722365	0.895463511
        0.730077121	0.911242604
        0.678663239	0.905325444
        0.678663239	0.871794872
        0.652956298	0.873767258
        0.825192802	0.92504931
        0.843187661	0.921104536
        0.861182519	0.946745562
        0.825192802	0.966469428
        0.838046273	0.968441815
        0.820051414	0.946745562
        0.853470437	0.938856016
        0.879177378	0.998027613
        0.935732648	0.962524655
        0.953727506	0.962524655
        1.035989717	0.99408284
        1.007712082	0.984220907
        1	1
        0.997429306	0.992110454
        1.095115681	0.99408284
        1.11311054	0.982248521
        1.077120823	0.966469428
        1.131105399	0.960552268
        1.141388175	0.970414201
        1.146529563	0.958579882
        1.179948586	0.998027613
        1.218508997	0.950690335
        1.269922879	0.966469428
        1.179948586	0.938856016
        1.118251928	0.911242604
        1.071979434	0.90729783
        1.038560411	0.91321499
        1.218508997	0.91913215
        1.259640103	0.893491124
        1.221079691	0.877712032
        1.33933162	0.897435897
        1.341902314	0.869822485
        1.380462725	0.869822485
        1.311053984	0.859960552
        1.33933162	0.854043393
        1.33933162	0.848126233
        1.215938303	0.842209073
        1.223650385	0.792899408
        1.223650385	0.765285996
        1.28277635	0.796844181
        1.323907455	0.804733728
        1.326478149	0.794871795
        1.347043702	0.800788955
        1.380462725	0.816568047
        1.40874036	0.761341223
        1.35218509	0.759368836
        1.4781491	0.753451677
        1.434447301	0.723865878
        1.460154242	0.715976331
        1.439588689	0.678500986
        1.444730077	0.65877712
        1.424164524	0.635108481
        1.501285347	0.65877712
        1.516709511	0.627218935
        1.547557841	0.621301775
        1.578406169	0.591715976
        1.323907455	0.585798817
        1.323907455	0.522682446
        1.393316195	0.512820513
        1.393316195	0.526627219
        1.439588689	0.473372781
        1.532133676	0.50887574
        1.688946016	0.477317554
        1.508997429	0.418145957
        1.629820051	0.408284024
        1.627249357	0.41025641
        1.526992288	0.343195266
        1.668380463	0.282051282
        1.681233933	0.282051282
        1.732647815	0.33530572
        1.832904884	0.33530572
        1.812339331	0.244575937
        1.781491002	0.232741617
        1.583547557	0.26035503
        1.835475578	0.171597633
        1.835475578	0.1617357
        1.922879177	0.1617357
        1.832904884	0.112426036
        1.881748072	0.110453649
        1.933161953	0.108481262
        1.984575835	0.071005917 ];

% Extract independent and dependent variables
muscle_length = data(:, 1);
relative_tension = data(:, 2);

force_length_regression = fit(muscle_length, relative_tension, 'gauss2');
end
