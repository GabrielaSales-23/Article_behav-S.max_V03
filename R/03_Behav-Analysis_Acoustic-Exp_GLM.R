library(permute)
library(lattice)
library(vegan)
library(readxl)
library(ggplot2)
library(lme4)
library(nlme)

library(here)
Data_Acoustic.Exp <- read.table(here("Data", "Processed", "01_Behavioral-Data_Acoustic-Exp.txt"), header=T)
Data_Acoustic.Exp <- Data_Acoustic.Exp[,c(1,2,3,4,5,6,7,8,9,12,14,16,18,19,20,21,23,24)]
Data_Acoustic.Exp$Treatment <- as.factor(Data_Acoustic.Exp$Treatment)
Data_Acoustic.Exp$ID <- as.factor(Data_Acoustic.Exp$ID)
Data_Acoustic.Exp$Name <- as.factor(Data_Acoustic.Exp$Name)


