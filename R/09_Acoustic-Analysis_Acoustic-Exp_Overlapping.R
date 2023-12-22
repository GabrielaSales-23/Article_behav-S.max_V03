library(here)
Overlapping_Data_Acoustic_Exp <- read.table(here("Data", "Processed", "05_Acoustic-Data_Acoustic-Exp_Overlapping-calls.txt"), header=T)

View(Overlapping_Data_Acoustic_Exp)

##Analysis of Overlapping rate
#GLMM model
library(dplyr)
glimpse(Overlapping_Data_Acoustic_Exp)
Overlapping_Data_Acoustic_Exp$Treatment <- as.factor(Overlapping_Data_Acoustic_Exp$Treatment)

hist(Overlapping_Data_Acoustic_Exp$N_overlapping)

library(lme4)
library(car)
m_over <- glmer.nb(N_overlapping~Treatment*Sex+(1|Name), data = Overlapping_Data_Acoustic_Exp)
plot(m_over)
plot(resid(m_over))
Anova(m_over)
