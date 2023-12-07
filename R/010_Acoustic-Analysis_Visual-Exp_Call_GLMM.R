library(here)
Call_Data_Visual_Exp <- read.table(here("Data", "Processed", "07_Acoustic-Data_Visual-Exp_Call-frequency.txt"), header=T)

View(Call_Data_Visual_Exp)

library(dplyr)
glimpse(Call_Data_Visual_Exp)
Call_Data_Visual_Exp$Treatment <- as.character(Call_Data_Visual_Exp$Treatment)

#Exploring data

hist(Call_Data_Visual_Exp$Freq25)
hist(Call_Data_Visual_Exp$Freq75)
hist(Call_Data_Visual_Exp$PeakFreq)

#Carryng packages to GLMM analysis

library(lme4)
library(car)
library(ggpubr)
library(dados)

#model gaussian
model_gau <- lmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Visual_Exp)
summary(model)
Anova(model_gau)
plot(resid(model_gau))
hist(resid(model_gau))
ggqqplot(resid(model_gau))
plot(model_gau)
visreg(model_gau, "Treatment", by = "Sex", overlay = TRUE, main = "A")

#modal gamma link inverse
model_gamma <- glmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Visual_Exp, family = Gamma(link = "inverse"))
summary(model_gamma)
Anova(model_gamma)
plot(resid(model_gamma))
hist(resid(model_gamma))
ggqqplot(resid(model_gamma))
plot(model_gamma)
visreg(model_gamma, "Treatment", by = "Sex", overlay = TRUE, main = "A")

#model gamma link log
model_gamma_log <- glmer(Freq75~Treatment*Sex + (1|Name), data = Call_Data_Visual_Exp, family = Gamma(link = "log"))
summary(model_gamma_log)
Anova(model_gamma_log)
plot(resid(model_gamma_log))
hist(resid(model_gamma_log))
ggqqplot(resid(model_gamma_log))
plot(model_gamma_log)
visreg(model_gamma_log, "Treatment", by = "Sex", overlay = TRUE, main = "A")
visreg(model_gamma_log)
