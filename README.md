
# Communication breakdown! How information loss affects behavioral responses in the Great-Billed Seed-Finch, *Sporophila maximiliani* (Thraupidae: Passeriformes)

This repository contains all data and R script of statistical analysis
used to investigate the role of information quality in the behavior of
*Sporophila maximiliani* (Great-billed Seed-Finch).

I assessed whether the loss of acoustic and visual information during
intraspecific communication produces displacement and aggressive
behaviors in receptor individuals.

This procedure is part of an experimental project developed during my
master’s degree graduation in Ecology and Evolution.

The repository is still under development.

# Repository structure

All type of material is organized in individual folders properly named
and described bellow:

## Data folder

Data folder contain two sub folders:

1.  Raw - Data in the way it was collected.

2.  Processed - Data in a table format suitable for sctatistical
    analysis. In this folder all table files are in two formats (.xlsx
    and .txt), with the txt format being the most suitable for carrying
    out statistical analysis. The .txt files are described bellow:

- 01_Behavioral-Data_Acoustic-Exp.txt: Identity, sex and behavioral
  frequency or duration of all behaviors displayed by subjects during
  the acoustic treatment experiment.
- 02_Metadados_Behav-Analysis_Acoustic-Exp.txt: Metadata of table file
  01.
- 03_Behavioral-Data_Visual-Exp.txt: Identity, sex and behavioral
  frequency or duration of all behaviors displayed by subjects during
  the visual treatment experiment.
- 04_Metadados_Behav-Analysis_Visual-Exp.txt: Metadata of table file 01.
- 05_Acoustic-Data_Acoustic-Exp_Call-frequency.txt: Identity, sex and
  some acoustic parameters of all calls emitted by subjects during the
  acoustic treatment experiment.
- 05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt: Identity, sex, number
  of call and emission rate of calls in each treatment by subjects
  during the acoustic treatment experiment.
- 05_Acoustic-Data_Acoustic-Exp_Overlapping-calls.txt: Identity, sex and
  number of calls overlapping the playback in each treatment by subjects
  during the acoustic treatment experiment.
- 06_Metadados_Acoustic-Analysis_Acoustic-Exp_Calss-frequency.txt:
  Metadata of table file
  “05_Acoustic-Data_Acoustic-Exp_Call-frequency.txt”.
- 06_Metadados_Acoustic-Analysis_Acoustic-Exp_Emission-rate.txt:
  Metadata of table file
  “05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt”.
- 06_Metadados_Acoustic-Analysis_Acoustic-Exp_Overlapping-calls.txt:
  Metadata of table file
  “05_Acoustic-Data_Acoustic-Exp_Overlapping-calls.txt”.
- 07_Acoustic-Data_Visual-Exp_Call-frequency.txt: Identity, sex and some
  acoustic parameters of all calls emitted by subjects during the visual
  treatment experiment.
- 07_Acoustic-Data_Visual-Exp_Emission-rate.txt: Identity, sex, number
  of call and emission rate of calls in each treatment by subjects
  during the visual treatment experiment.
- 08_Metadados_Acoustic-Analys_isVisual-Exp_Calls-frequency.txt:
  Metadata of table file
  “07_Acoustic-Data_Visual-Exp_Call-frequency.txt”.
- 08_Metadados_Acoustic-Analys_isVisual-Exp_Emission-rate.txt: Metada of
  table file “07_Acoustic-Data_Visual-Exp_Emission-rate.txt”.

3.  eml_01_Behavioral-Data_Acoustic-Exp.xml - EML file with Metadata
    information of “01_Behavioral-Data_Acoustic-Exp.txt” data file.

## R folder

The R folder contains all scripts made in R Studio software 4.3.2.

The scripts are numbered in the best order to runing, since there are
dependence relationship between some scripts.

- 01_Supp_Displacement-behav_Acoustic-Exp_Read-and-processing_2023-11-09:
  This script was used with behavioral data collected in the acoustic
  treatment experiment to: reading, viewing, correction of variable
  category and data transformation for the statistical analyze.

- 02_Supp_Displacement-behav_Acoustic-Exp_Analyse_2023-11-10: This
  script was used with behavioral data of the acoustic treatment
  experiment to find possible displacement behavioral through PERMANOVA,
  Friedman test and PCA analysis.

- 03_Behav-Analysis_Acoustic-Exp_Permutation-test_2023-11-20: This
  script was used to run the permutational ANOVA and evaluate possible
  treatment differences in the display of displacement and aggressive
  behaviors.

\##EML_project

The script contains de code for genarating the metadata file in .xml
format.
