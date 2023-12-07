library(here)
Rate_Data_Acoustic_Exp <- read.table(here("Data", "Processed", "05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt"), header=T)

View(Rate_Data_Acoustic_Exp)

##Analysis of emission rate
#GLMM model
library(dplyr)
glimpse(Rate_Data_Acoustic_Exp)
Rate_Data_Acoustic_Exp$Treatment <- as.character(Rate_Data_Acoustic_Exp$Treatment)

hist(Rate_Data_Acoustic_Exp$Repetition_rate)

library(lme4)
library(car)
m_emission <- glmer.nb(Repetition_rate~Treatment*Sex+(1|Name), data = Rate_Data_Acoustic_Exp)
plot(m_emission)
plot(resid(m_emission))
Anova(m_emission)

#Permutation anova 

library(permuco)
m_emission <- aovperm(Repetition_rate~Treatment*Sex+Error(Name/Treatment), data=Rate_Data_Acoustic_Exp, np=999, type = "permutation")


##Analysis of frequency of call in each treatment 
#GLMM model
library(dplyr)
glimpse(Rate_Data_Acoustic_Exp)
Rate_Data_Acoustic_Exp$Treatment <- as.character(Rate_Data_Acoustic_Exp$Treatment)

hist(Rate_Data_Acoustic_Exp$Freq_treatment)

library(lme4)
library(car)
m_freq <- glmer.nb(Freq_treatment~Treatment*Sex+(1|Name), data = Rate_Data_Acoustic_Exp)
plot(m_freq)
plot(resid(m_freq))
Anova(m_freq)

#Permutation anova 

library(permuco)
m_freq <- aovperm(Freq_treatment~Treatment*Sex+Error(Name/Treatment), data=Rate_Data_Acoustic_Exp, np=999, type = "permutation")
