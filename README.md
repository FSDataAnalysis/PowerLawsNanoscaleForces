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


##  Matlab (mat file) with data 

The raw data has been obtained by processing amplitude versus distance curves obtained with an Asylum AFM. From these curves the force versus distance profiles have been generated and saved for each tip and for each size of tip in matlab (mat) files.From the force profiles distances have been recorded as described in the article *The power laws of nanoscale forces in ambient conditions*. From these distances ratios have been recvered also as detailed in the article. The ratios are d_0/d_1, d0_d_2, ... d_0/d_7 as detailed in the article. 

The distances for all the ratios have been saved in mat files:

*TIPS.mat*

### Data structures in Matlab (mat) files


This file contains data for the 5 different tips employed in this work. 
Each tip is numberd as follows:

* Tip_1

* Tip_2

* etc. 

The above variables are data structures in matlab that are loaded directly from the *TIPS.mat* file. 


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



the above is the first data point of tip one for a critical amplitude of 0.24 Volts, i.e. R=4.75(0.24*40e-9)^(1.1)= 7.2 nm. 



## Scripts for Power Scale laws in nanoscale forces


- Detail on raw data -

The raw data to produce the force profiles was processed with a matlab code (*available upon request* [here](http://www.lens-online.net/) to M Chiesa). The raw data can also be found upon request in the link above in [www.dropbox.com/home/Power Law](https://www.dropbox.com/home/Power Law) 

--------------------------------

Then the data was processed and stored in a mat (matlab) file as detailed in the point above, i.e. **TIPS.mat**, that can be found [here](https://github.com/FSDataAnalysis/PowerLawsNanoscaleForces) by requesting a password and a username [here](http://www.lens-online.net/)

The file **TIPS.mat** can be processed as follows to reproduce the data in the article:

### Scripts

A set of scripts  have been written in Matlab and R and require a working Matlab and R version. The Rscripts.exe need to be added to the environment in a windows machine, i.e. the Rscript.exe needs to be added to the path. The R code is employed to carry out statistical methods employed in this work with the standard lm pachage from R.


### Usage os scripts