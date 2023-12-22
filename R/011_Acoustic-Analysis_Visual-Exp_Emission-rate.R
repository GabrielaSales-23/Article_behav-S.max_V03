library(here)
Rate_Data_Visual_Exp <- read.table(here("Data", "Processed", "07_Acoustic-Data_Visual-Exp_Emission-rate.txt"), header=T)

View(Rate_Data_Visual_Exp)

##Analysis of emission rate
#GLMM model
library(dplyr)
glimpse(Rate_Data_Visual_Exp)
Rate_Data_Visual_Exp$Treatment <- as.character(Rate_Data_Visual_Exp$Treatment)

hist(Rate_Data_Visual_Exp$Repetition_rate)

library(lme4)
library(car)
m_emission <- glmer.nb(Repetition_rate~Treatment*Sex+(1|Name), data = Rate_Data_Visual_Exp)
plot(m_emission)
plot(resid(m_emission))
Anova(m_emission)

##Analysis of frequency of call in each treatment 
#GLMM model
hist(Rate_Data_Visual_Exp$Freq_treatment)

library(lme4)
library(car)
m_freq <- glmer.nb(Freq_treatment~Treatment*Sex+(1|Name), data = Rate_Data_Visual_Exp)
plot(m_freq)
plot(resid(m_freq))
Anova(m_freq)
