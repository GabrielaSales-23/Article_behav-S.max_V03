library(here)
Call_Data_Acoustic_Exp <- read.table(here("Data", "Processed", "05_Acoustic-Data_Acoustic-Exp_Call-frequency.txt"), header=T)

View(Call_Data_Acoustic_Exp)

library(dplyr)
glimpse(Call_Data_Acoustic_Exp)
Call_Data_Acoustic_Exp$Treatment <- as.character(Call_Data_Acoustic_Exp$Treatment)
Call_Data_Acoustic_Exp$Treatment <- factor(Call_Data_Acoustic_Exp$Treatment, 
                                      levels = c("100", "90", "75", "50", "0"))
#Exploring data

hist(Call_Data_Acoustic_Exp$Freq25)
hist(Call_Data_Acoustic_Exp$Freq75)
hist(Call_Data_Acoustic_Exp$PeakFreq)

library(lme4)
library(car)
library(ggpubr)
library(dados)
library(visreg)
library(visreg)

#model gamma link inverse
model_gamma_75 <- glmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "inverse"))
summary(model_gamma_75)
Anova(model_gamma_75)
plot(resid(model_gamma_75))
hist(resid(model_gamma_75))
ggqqplot(resid(model_gamma_75))
plot(model_gamma_75)
visreg(model_gamma_75, "Treatment", by = "Sex", overlay = TRUE)

#model gamma link log
model_gamma_log_75 <- glmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "log"))
summary(model_gamma_log_75)
Anova(model_gamma_log_75)
plot(resid(model_gamma_log_75))
hist(resid(model_gamma_log_75))
ggqqplot(resid(model_gamma_log_75))
plot(model_gamma_log_75)
visreg(model_gamma_log_75, "Treatment", by = "Sex", overlay = TRUE)
visreg(model_gamma_log)

library(MuMIn)
options(na.action = "na.fail") 

gamma_AIC=dredge(model_gamma, rank = "AIC")
gamma_AIC

gammaLog_AIC=dredge(model_gamma_log, rank = "AIC")
gammaLog_AIC

##Freq25

#modal gamma link inverse
model_gamma_25 <- glmer(Freq25~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "inverse"))
summary(model_gamma_25)
Anova(model_gamma_25)
plot(resid(model_gamma_25))
hist(resid(model_gamma_25))
ggqqplot(resid(model_gamma_25))
plot(model_gamma_25)
visreg(model_gamma_25, "Treatment", by = "Sex", overlay = TRUE)

#model gamma link log
model_gamma_log_25 <- glmer(Freq25~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "log"))
summary(model_gamma_log_25)
Anova(model_gamma_log_25)
plot(resid(model_gamma_log_25))
hist(resid(model_gamma_log_25))
ggqqplot(resid(model_gamma_log_25))
plot(model_gamma_log_25)
visreg(model_gamma_log_25, "Treatment", by = "Sex", overlay = TRUE)
visreg(model_gamma_log_25)

##PeakFreq

model_gamma_Peak <- glmer(PeakFreq~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "inverse"))
summary(model_gamma_Peak)
Anova(model_gamma_Peak)
plot(resid(model_gamma_Peak))
hist(resid(model_gamma_Peak))
ggqqplot(resid(model_gamma_Peak))
plot(model_gamma_Peak)
visreg(model_gamma_Peak, "Treatment", by = "Sex", overlay = TRUE)

#model gamma link log
model_gamma_log_Peak <- glmer(PeakFreq~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "log"))
summary(model_gamma_log_Peak)
Anova(model_gamma_log_Peak)
plot(resid(model_gamma_log_Peak))
hist(resid(model_gamma_log_Peak))
ggqqplot(resid(model_gamma_log_Peak))
plot(model_gamma_log_Peak)
visreg(model_gamma_log_Peak, "Treatment", by = "Sex", overlay = TRUE)
visreg(model_gamma_log_Peak)


