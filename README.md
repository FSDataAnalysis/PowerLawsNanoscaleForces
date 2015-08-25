---
title: "Markdown"
author: "Power laws in the nanoscale et al."
date: "Sunday, August 23, 2015"
output: html_document
---

<!--( Detailed usage of the R and Matlab scripts employed to produce
the data for the paper:

The power laws of nanoscale forces in ambient conditions

by 

Chia-Yun Lai, a Tuza Olukan, a  Sergio Santos, a Amal Al Ghaferi, a Matteo Chiesa


Laboratory for Energy and NanoScience (LENS), Institute Center for Future Energy (iFES), Masdar Institute of Science and Technology, Abu Dhabi, UAE

)--> 


# DATA sets and contents for:

*The power laws of nanoscale forces in ambient conditions*

by 

Chia-Yun Lai, a Tuza Olukan, a  Sergio Santos, a Amal Al Ghaferi, a Matteo Chiesa


Laboratory for Energy and NanoScience (LENS), Institute Center for Future Energy (iFES), Masdar Institute of Science and Technology, Abu Dhabi, UAE


## Details for acccessing raw data 

### Raw data

The raw data to produce the force profiles was processed with a matlab code (*available upon request* contacting [here](http://www.lens-online.net/)  Dr M Chiesa).  The raw data and code can be found upon request (link above for password and username) in [www.dropbox.com/home/Power Law](https://www.dropbox.com/home/Power Law) 

Note: *The password and username for dropbox are the same as that for this github account*.


In the dropbox account the data has been stored both in raw format (text files), i.e. volts and phase, and as processed force profiles in PROCESSED_DATA.mat files. 

The code employed can also be found there. The contents in the dropbox account are devided in three folders:

1) POWER LAWS (raw and semi processed data)

  1.1) ALICE: Contains all force profiles and raw text files by Alice (3 tips)
  1.2) TUZA:  Contains all force profiles and raw text files by Tuza  (2 tips)
  
2) UPDATED CODES

  1.1) Contains a folder with the force reconstruction scripts in Matlab
  
  1.2) Contains a folder with the statistics code employed to process the force         profiles into force versus distance, energy dissipation and other, work of        adhesion, distances, etc. 
  
3) ALL_STATS_5_TIPS: Processed distanced from Force of adhesion

  The distances from Fts=Force of adhesion to any point beta, i.e. Beta 1, 2,      etc. as discussed in the paper *The power laws of nanoscale forces in ambient    conditions*, can be found in this folder for each tip and each critical          amplitude, i.e. tip radius. 
  
  For example, the file *ALL_DATA_STATS_0_FC1.mat* contains a matrix termed 
  *dFAD_FAD_zero_matrix_Stats* of 10 columns by approximately 200 rows. 
  
  *The columns* contains distances (in mters) from the minima in force (Force of   adhesion or F_AD) to:
  
  * 0.05FAD, 0.15FAD, ..., 0.95FAD
  
  *The raws* contain information about each data point for each tip. 
  
  *The names of the files* contain information about tip and tip size. For         example in *ALL_DATA_STATS_0_FC1.mat* the zero stands for tip 0 and FC1 stands
  for the experiments of the first tip size. 
  
  *The tip sizes for each tip* in relation to each data file are found in the      excel file in the dropbox account      
  [here](https://www.dropbox.com/home/Power%20Law/ALL_STATS_5_TIPS)
  in the rar file *PowerLawAllTipsDistances.rar*
  
  
### Plotting individual force profiles

Force versus distance curves for individual tips and data points can be plotted in matlab by laoding the mat files in the folder *ALL_STATS_5_TIPS* and calling the distance with the D structure and the force with the FORCE structure. 

For example, for *Figure S4* laoding ALL_DATA_STATS_0_FC1.mat  and/or ALL_DATA_STATS_0_FC8.mat  and calling:

*plot(D.No_1, FORCE.No_1)*

See more details below. 
  
### Accounting for intermolecular distances


  The *dFAD_FAD_zero_matrix_Stats* matrices that have been described above,        contain the distances that have been employed in this work without including     the intermolecular distance a0. 
  
  In Matlab it is trivial to account for a0 in a single operation, i.e. 
  
  *dFAD_FAD_zero_matrix_Stats+a0* adds the distance a0 to all the distances        measured from the point of minima. 
  
  
  For further details please contact Matteo Chiesa at mchiesa@masdar.ac.ar or
  Sergio Santos as santos_en@yahoo.com 


##  Matlab (mat file) with (Semi-raw data) data 



The raw data has been obtained by processing amplitude versus distance curves obtained with an Asylum AFM. From these curves the force versus distance profiles have been generated and saved for each tip and for each size of tip in matlab (mat) files.

From the force profiles distances have been recorded as described in the article *The power laws of nanoscale forces in ambient conditions* and can be accessed and processed as detailed in the paragraph above. 

From now on however we assume that we have the distances and ratios from the force profiles as explained below.  The distance ratios have been recovered also as detailed in the article. 


The ratios are d_0/d_1, d0_d_2, ... d_0/d_7 as detailed in the article. 


The distances for all the ratios have been saved in mat files:

*TIPS.mat* 

that can be found [here](https://github.com/FSDataAnalysis/PowerLawsNanoscaleForces)


### Data structures in Matlab (mat) files


The *TIPS.mat* file contains data for the 5 different tips employed in this work. 
Each tip is numberd as follows:

* Tip_1

* Tip_2

* etc. 

The above variables are data structures in matlab that are loaded directly from the *TIPS.mat* file, i.e. load TIPS.mat (from matlab console) 


For each tip, i.e. Tip_1, etc.,  data has been obtained at a different value of crticical amplitude in Volts. The Vollts to meter conversion was roughly 40 nm per volt. The value in volts has been saved for each tip as a child data structure as follows:


* Tip_1.N_024

* Tip_1.N_031 

* etc.

The number after *N_* contains information about the critical amplitude (Ac). In particular 024 implies a critical amplitude of 0.24 Volts. The critical amplitude
can be converted into tip radius via the expression given in [here](http://scitation.aip.org/content/aip/journal/rsi/83/4/10.1063/1.4704376) with reference (Santos, S., L. Guang, et al. (2012). "A method to provide rapid in situ determination of tip radius in dynamic atomic force microscopy." Review of Scientific Instruments 83: 043707-043717)

### How information is stored for each tip and each radius

Each data structure, i.e. Tip_1.N_024, contains a matrix of 8 rows and ap`proximately 200 columns. Each column stands for a data point or force profile and teh rows contain the following information:

* Row 1: Force of adhesion in Newtons. 

* Raw 2: d_0/d_1

to

* Raw 8: d_0/d_7

Each of the above matrices stands for a tip radius for a given tip. 

An example of the format is:

**_EXAMPLE_**

 >> Tip_1.N_024(:,1)
 
    -1.5306e-009
     1.0281e+000
     1.0860e+000
     1.3283e+000
     2.4552e+000
     3.7893e+000
     6.4647e+000
     6.6438e+000



the above is the first data point of tip one for a critical amplitude of 0.24 Volts, i.e. R=4.75(0.24*40e-9)^(1.1)= 7.2 nm. By choosing the other data points, i.e. columns in the matrix, all the data for tip 1 for Ac=0.24 is obatined.  



## Scripts for Power Scale laws in nanoscale forces

### Further processing of files

In order to convert Amplitude in Volts into meters and recover the size of the tip for each data point the following procedure needs to be followed. 

**1. Run the main code** 

[MainCode.m](https://github.com/FSDataAnalysis/PowerLawsNanoscaleForces)

This code reads the TIPS.mat file and removes possible NAN objects or outliers from the data (employing a standard machine learning algorithm, i.e. p-value).

The generated mat file is:

**PROCESSSED_TIPS.mat**


2. The above mat file **PROCESSED_TIPS.mat** is **then further processed** in order to 

1) arrange it and get the right format. 

2) Choose the value of the intermolecular distance a0, the surface energy of the sample, i.e. gamma, and the Hamaker constant, i.e. Hamaker.  In this work a0=0.165 nm is typically employed as also reported in the literature. 

These values can be changed by inputing them in the script as required. The names are clear and are found at the top of the script. 

**THE STEPS ARE:**

First the **GeneratingTheDxMATFile.rar** file needs to be unzipped. It can be found in the repository together with the MainCode.m file. 

Second the **PROCESSED_TIPS.mat** file needs to be added to the folder. 

Third, the **Dx_Main.m** file needs to be run.

Fourth, run the **Dx_second_MatricedData.m** file. 


The resulting **DX_DATA_PROCESSED.mat** file can now be employed to reproduce the figures. 




### FIGURE 2 in the paper


1. Unzip the **GeneratingFigure2.rar** file

2. Add the *DX_DATA_PROCESSED.mat** file to the resulting folder. 

3. Run the **Figure2_Inf_Dx.m** file to produce the first part of Fig. 2

4. Run the **Figure2_n_Runivariate.m** file to produce the second part of Fig. 2


### FIGURE 3 in the paper



1. Unzip the **GeneratingFigure3.rar** file

2. Add the *DX_DATA_PROCESSED.mat** file to the resulting folder. 

3. Run the **Figure3_Inf_DxMultivariate.m** file to run the statistics package in R


4. Run the **Figure3_2_n_Multivariate.m** file to produce  Fig. 3

The errors at a 95% confidence interval are also plotted as Figures 2 and 3 in matlab, i.e minima and maxima. 


# VISUALIZING INDIVIDUAL FORCE CURVES

The force versus distance profiles can be visualized one by one by loading any of the mat files in the *ALL_STATS_5_TIPS* folder in the drpbox account [force profiles here](https://www.dropbox.com/home/Power%20Law/ALL_STATS_5_TIPS)

Once any of the mat files are opened, i.e. single tip for single tip radius size containing approximately 200 curves each, the figures can be produced in matlab via de commant

*plot(D.No_0, FORCE.No_0)*

The D and FORCE objects are structures containing the individual force curves. 
The number of the force curve can be called by writing N_Number. For example the first one is number 0 and is called by D.No_0 and FORCE.No_0.


<!--REFERENCES

[1.Van der Waals interctions](Pauling, L. and J. Y. Beach (1935). "The van der Waals Interaction of Hydrogen Atoms." Physical Review 47(9): 686-692.)

(http://journals.aps.org/pr/abstract/10.1103/PhysRev.47.686)

[Electrostatic Modelling](Feynman, R. P. (1939). "Forces in Molecules." Physical Review 56(4): 340-343.)

--> 