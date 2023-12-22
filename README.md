
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

1.  Raw - Data in the way it was collected from Boris software
    (behavioral data) and Raven Pro (acoustic data)

- 01_Behav-data_Acoustic-exp_Females.xlsx: duration and frequency of
  female’s display of each behavior of *Sporophila maximiliani*
  repertoire during acoustic experiment.
- 02-Behav-data_Acoustic-exp_Males.xlsx: duration and frequency of
  male’s display of each behavior of *Sporophila maximiliani* repertoire
  during acoustic experiment.
- 03_Behav-data_Visual-exp_Females.xlsx: duration and frequency of
  female’s display of each behavior of *Sporophila maximiliani*
  repertoire during visual experiment.
- 04_Behav-data_Visual-exp_Males.xlsx: duration and frequency of male’s
  display of each behavior of *Sporophila maximiliani* repertoire during
  visual experiment.
- 05_Acoustic-data_Acoustic-exp_Males.xlsx: acoustic parameters of
  subjects calls.
- 06_Acoustic-data_Acoustic-exp_Females.xlsx: acoustic parameters of
  subjects calls.
- 07_Acoustic-data_Visual-exp.xlsx: acoustic parameters of subjects
  calls.

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
- 08_Metadados_Acoustic-Analys_isVisual-Exp_Emission-rate.txt: Metadata
  of table file “07_Acoustic-Data_Visual-Exp_Emission-rate.txt”.
- 09_Metadados_Acoustic-Exp_levels.txt: levels of the acoustic
  treatments.
- 010_Metadados_Visual-Exp_levels.txt: levels of the visual treatments.

3.  All metadata files are also available in XML format.

## R folder

The R folder contains all scripts made in R Studio software 4.3.2.

The scripts are numbered in the best order to runing, since there are
dependence relationship between some scripts.

- 01_Behav-data_Acoustic-Exp_Read-and-processing_2023-11-09: This script
  was used with behavioral data collected in the acoustic treatment
  experiment to reading, viewing, correction of variable category and
  data transformation for the statistical analyze.
- 02_Supp_Displacement-behav_Acoustic-Exp_Analyse_2023-11-10: This
  script was used with behavioral data of the acoustic treatment
  experiment to find possible displacement behavioral through PCA
  analysis.
- 03_Behav-Analysis_Acoustic-Exp_Permutation-test_2023-11-20: This
  script was used to run the permutational ANOVA and evaluate possible
  treatment differences in the display of displacement and aggressive
  behaviors. Script for graphic results are also in this file.
- 04_Behav-data_Visual-Exp_Read-and-processing_2023-12-05: This script
  was used with behavioral data collected in the visual treatment
  experiment to reading, viewing, correction of variable category and
  data transformation for the statistical analyze.
- 05_Supp_Displacement-behav_Visual-Exp_Analyse_2023-12-05: This script
  was used with behavioral data of the visual treatment experiment to
  find possible displacement behavioral through PCA analysis.
- 06_Behav-Analysis_Visual-Exp_Permutation-test_2023-12-05: This script
  was used to run the permutational ANOVA and evaluate possible
  treatment differences in the display of displacement and aggressive
  behaviors. Script for graphic results are also in this file.
- 07_Acoustic-Analysis_Acoustic-Exp_Call_GLMM: Script with general mixed
  model to value the effect of acoustic treatments in parameters of
  calls.
- 08_Acoustic-Analysis_Acoustic-Exp_Emission-rate: Script with general
  mixed model to emission rate analysis in the acoustic experiment.
- 09_Acoustic-Analysis_Acoustic-Exp_Overlapping: Script with general
  mixed model to overlapping analysis.
- 010_Acoustic-Analysis_Visual-Exp_Call_GLMM: Script with general mixed
  model to value the effect of visual treatments in parameters of calls.
- 011_Acoustic-Analysis_Visual-Exp_Emission-rate: Script with general
  mixed model to emission rate analysis in the visual experiment.

## EML_project

The script contains de code for genarating the metadata file in .xml
format.
