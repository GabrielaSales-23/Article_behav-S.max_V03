library(here)
Rate_Data_Acoustic_Exp <- read.table(here("Data", "Processed", "05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt"), header=T)

View(Rate_Data_Acoustic_Exp)

##Analysis of emission rate
#GLMM model
library(dplyr)
glimpse(Rate_Data_Acoustic_Exp)
Rate_Data_Acoustic_Exp$Treatment <- as.factor(Rate_Data_Acoustic_Exp$Treatment)
Rate_Data_Acoustic_Exp$Name <- as.factor(Rate_Data_Acoustic_Exp$Name)

hist(Rate_Data_Acoustic_Exp$Repetition_rate)

library(lme4)
library(car)
m_emission_nb <- glmer.nb(Repetition_rate~Treatment*Sex+(1|Name), data = Rate_Data_Acoustic_Exp)
plot(m_emission_nb)
plot(resid(m_emission_nb))
Anova(m_emission_nb)
summary(m_emission_nb)

##Analysis of frequency of call in each treatment 
#GLMM model
library(dplyr)
glimpse(Rate_Data_Acoustic_Exp)
Rate_Data_Acoustic_Exp$Treatment <- as.factor(Rate_Data_Acoustic_Exp$Treatment)

hist(Rate_Data_Acoustic_Exp$Freq_treatment)

m_freq <- glmer.nb(Freq_treatment~Treatment*Sex+(1|Name), data = Rate_Data_Acoustic_Exp)
plot(m_freq)
plot(resid(m_freq))
Anova(m_freq)

#Permutation anova 

library(permuco)
m_freq <- aovperm(Freq_treatment~Treatment*Sex+Error(Name/Treatment), data=Rate_Data_Acoustic_Exp, np=999, type = "permutation")
