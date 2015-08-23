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

**The power laws of nanoscale forces in ambient conditions**

by 

Chia-Yun Lai, a Tuza Olukan, a  Sergio Santos, a Amal Al Ghaferi, a Matteo Chiesa


Laboratory for Energy and NanoScience (LENS), Institute Center for Future Energy (iFES), Masdar Institute of Science and Technology, Abu Dhabi, UAE


## Detail for raw data 

The raw data to produce the force profiles was processed with a matlab code (*available upon request* contacting [here](http://www.lens-online.net/)  M Chiesa).  The raw data and code can be found upon request (link above for password and username) in [www.dropbox.com/home/Power Law](https://www.dropbox.com/home/Power Law) 

In the dropbox account the data has been stored both in raw format, i.e. volts and phase, and as processed force profiles in PROCESSED_DATA.mat files. 

The code employed can also be found there. 


##  Matlab (mat file) with data 




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


