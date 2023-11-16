library(here)
Data_Acoustic.Exp <- read.table(here("Data", "Processed", "01_Behavioral-Data_Acoustic-Exp.txt"), header=T)

## Viewing 
View(Data_Acoustic.Exp)
head(Data_Acoustic.Exp)
summary(Data_Acoustic.Exp)

is.na(Data_Acoustic.Exp)
sum(is.na(Data_Acoustic.Exp))

## Cheking variable type
library(dplyr)
glimpse(Data_Acoustic.Exp)

Data_Acoustic.Exp$Treatment <- as.character(Data_Acoustic.Exp$Treatment)
Data_Acoustic.Exp$ID <- as.character(Data_Acoustic.Exp$ID)

## Removing rare behaviors (n_and, n_vooc, n_darp, t_for, t_beb,t_cant, n_conf)

Data_Acoustic.Exp_Final <- Data_Acoustic.Exp[,c(1,2,3,4,5,6,7,8,9,12,14,16,18,19,20,21,23,24)]

# Dados com muitos zeros, por isso fazer transformação de Helling

library(vegan)
Transf.behaviors <- decostand((Data_Acoustic.Exp_Final[,c("n_pulp",
                                 "t_limp","n_limb","n_abeb","n_trec",
                                 "n_empg","t_obs","n_pulo","n_estp",
                                 "n_def","t_com",
                                 "n_vocc",
                                 "t_rel")]), "hellinger")
View(Transf.behaviors)
behav_loc<-Transf.behaviors[,c("n_pulp")]
behav_man<-Transf.behaviors[,c("t_limp","n_limb","n_abeb","n_trec")]
behav_alert<-Transf.behaviors[,c("n_empg","t_obs","n_pulo","n_estp")]
behav_alim<-Transf.behaviors[,c("n_def","t_com")]
behav_int<-Transf.behaviors[,c("n_vocc")]
behav_desc<-Transf.behaviors[,c("t_rel")]
Data_Acoustic.Exp_Final <- bind_cols(Data_Acoustic.Exp_Final[,c("ID","Name", "Sex","Treatment")], Transf.behaviors)
View(Data_Acoustic.Exp_Final)




