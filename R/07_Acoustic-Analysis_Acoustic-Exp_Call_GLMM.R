library(here)
Call_Data_Acoustic_Exp <- read.table(here("Data", "Processed", "05_Acoustic-Data_Acoustic-Exp_Call-frequency.txt"), header=T)

View(Call_Data_Acoustic_Exp)

library(dplyr)
glimpse(Call_Data_Acoustic_Exp)
Call_Data_Acoustic_Exp$Treatment <- as.character(Call_Data_Acoustic_Exp$Treatment)

#Exploring data

hist(Call_Data_Acoustic_Exp$Freq25)
hist(Call_Data_Acoustic_Exp$Freq75)
hist(Call_Data_Acoustic_Exp$PeakFreq)

library(lme4)
library(car)
library(ggpubr)
library(dados)

#model gaussian
model_gau <- lmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp)
summary(model_gau)
Anova(model_gau)
plot(resid(model_gau))
hist(resid(model_gau))
ggqqplot(resid(model_gau))
plot(model_gau)
visreg(model_gau, "Treatment", by = "Sex", overlay = TRUE, main = "A")

#modal gamma link inverse
model_gamma <- glmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "inverse"))
summary(model_gamma)
Anova(model_gamma)
plot(resid(model_gamma))
hist(resid(model_gamma))
ggqqplot(resid(model_gamma))
plot(model_gamma)
library(visreg)
visreg(model_gamma, "Treatment", by = "Sex", overlay = TRUE, main = "A")

#model gamma link log
model_gamma_log <- glmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Acoustic_Exp, family = Gamma(link = "log"))
summary(model_gamma_log)
Anova(model_gamma_log)
plot(resid(model_gamma_log))
hist(resid(model_gamma_log))
ggqqplot(resid(model_gamma_log))
plot(model_gamma_log)
visreg(model_gamma_log, "Treatment", by = "Sex", overlay = TRUE, main = "A")
visreg(model_gamma_log)

library(MuMIn)
options(na.action = "na.fail") 
gau_AIC=dredge(model_gau, rank="AIC")
gau_AIC

gamma_AIC=dredge(model_gamma, rank = "AIC")
gamma_AIC

gammaLog_AIC=dredge(model_gamma_log, rank = "AIC")
gammaLog_AIC
