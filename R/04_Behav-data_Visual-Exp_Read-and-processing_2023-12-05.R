library(here)
Data_Visual.Exp <- read.table(here("Data", "Processed", "03_Behavioral-Data_Visual-Exp.txt"), header=T)

## Viewing 
View(Data_Visual.Exp)
head(Data_Visual.Exp)
summary(Data_Visual.Exp)

is.na(Data_Visual.Exp)
sum(is.na(Data_Visual.Exp))

## Cheking variable type
library(dplyr)
glimpse(Data_Visual.Exp)

Data_Visual.Exp$Treatment <- as.character(Data_Visual.Exp$Treatment)
Data_Visual.Exp$ID <- as.character(Data_Visual.Exp$ID)

## Removing rare behaviors (t_limp, n_and, n_vooc, n_darp, n_def, t_beb, t_for, t_cant, n_conf)

Data_Visual.Exp <- Data_Visual.Exp[,c(1,2,3,4,6,7,8,10,11,13,17,18,19,21,22)]

# Hellinger transformation to minimize zeros effects

library(vegan)
Transf.behaviors <- decostand((Data_Visual.Exp[,c("n_pulp","n_vooc",
                                                    "n_limb","n_abeb","n_trec",
                                                    "t_obs","n_pulo","n_estp",
                                                    "t_com",
                                                    "n_vocc",
                                                    "t_rel")]), "hellinger")
View(Transf.behaviors)
behav_loc<-Transf.behaviors[,c("n_pulp","n_vooc")]
behav_man<-Transf.behaviors[,c("n_limb","n_abeb","n_trec")]
behav_alert<-Transf.behaviors[,c("t_obs","n_pulo","n_estp")]
behav_alim<-Transf.behaviors[,c("t_com")]
behav_int<-Transf.behaviors[,c("n_vocc")]
behav_desc<-Transf.behaviors[,c("t_rel")]
Data_Visual.Exp_Final <- bind_cols(Data_Visual.Exp[,c("ID","Name", "Sex","Treatment")], Transf.behaviors)
View(Data_Visual.Exp_Final)

