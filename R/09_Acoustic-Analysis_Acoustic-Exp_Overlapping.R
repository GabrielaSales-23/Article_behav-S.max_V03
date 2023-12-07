library(here)
Overlapping_Data_Acoustic_Exp <- read.table(here("Data", "Processed", "05_Acoustic-Data_Acoustic-Exp_Overlapping-calls.txt"), header=T)

View(Overlapping_Data_Acoustic_Exp)

##Analysis of emission rate
#GLMM model
library(dplyr)
glimpse(Overlapping_Data_Acoustic_Exp)
Overlapping_Data_Acoustic_Exp$Treatment <- as.character(Overlapping_Data_Acoustic_Exp$Treatment)

hist(Overlapping_Data_Acoustic_Exp$N_overlapping)

library(lme4)
library(car)
m_over <- glmer.nb(N_overlapping~Treatment*Sex+(1|Name), data = Overlapping_Data_Acoustic_Exp)
plot(m_over)
plot(resid(m_over))
Anova(m_over)

#Permutation anova 

library(permuco)
m_over <- aovperm(N_overlapping~Treatment*Sex+Error(Name/Treatment), data=Overlapping_Data_Acoustic_Exp, np=999, type = "permutation")


##Analysis of frequency of call in each treatment 
#GLMM model
library(dplyr)
hist(Overlapping_Data_Acoustic_Exp$Freq_O)

library(lme4)
library(car)
m_freq <- glmer.nb(Freq_O~Treatment*Sex+(1|Name), data = Overlapping_Data_Acoustic_Exp)
plot(m_freq)
plot(resid(m_freq))
Anova(m_freq)

#Permutation anova 

library(permuco)
m_freq <- aovperm(Freq_O~Treatment*Sex+Error(Name/Treatment), data=Overlapping_Data_Acoustic_Exp, np=999, type = "permutation")
