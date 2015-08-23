1. Run file MainCode.m

Choosing :
remove_infs_nans=1;
remove_outliers_now=1;
removing_std_away=0.95;
removing_std_away_large_ratios=0.95;
minimum_number_data_points=10;  %% if less than 10 data points it will not exclude points in remove_outliers file


Generates PROCESSSED_TIPS.MAT with dx, FAD, Ac etc. data

2. (OPTIONAL) In folder Adhesion vs Ac

2.1 Run file c_VERSUS_FAD_main.m with previous MAT file

Generates output to be read by:

2.2 Inference_Regression.m

Does the inference on FAD versus Ac


3. Produce data dx versus R

3.1 First Go to DX_Second and produce dx matrix with

Dx_Main

SELECT


Remove_outliers_processed=1;


Hamaker_graphite_siliconTip=1.32*1e-19;
a0=0.165e-9;
surface_energy_graphite=Hamaker_graphite_siliconTip/(24*a0*a0*pi);
Constant_adhesion=4*pi*surface_energy_graphite;

Critical_amplitude_C=4.75;
Power_CA=1.12;
Conversion_VMeter=40e-9;



3.2 Then turn the data into matrix form with 

Dx_second_MatricedData.m

Output is DX_Matrix



4. Run Figure1 for dx versus R

SELECT

remove_outliers_far_away=1;
removing_std_away_dx=0.95;
maximum_allowed=100;
minimum_allowed=0.01;





