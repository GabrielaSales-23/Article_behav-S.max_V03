library(permute)
library(lattice)
library(vegan)
library(readxl)
library(ggplot2)
library(lme4)
library(nlme)

library(here)
Data_Acoustic.Exp <- read.table(here("Data", "Processed", "01_Behavioral-Data_Acoustic-Exp.txt"), header=T)
Data_Acoustic.Exp <- Data_Acoustic.Exp[,c(1,2,3,4,5,6,7,8,9,12,14,16,18,19,20,21,23,24)]
Data_Acoustic.Exp$Treatment <- as.factor(Data_Acoustic.Exp$Treatment)
Data_Acoustic.Exp$ID <- as.factor(Data_Acoustic.Exp$ID)
Data_Acoustic.Exp$Name <- as.factor(Data_Acoustic.Exp$Name)


library(permute)
library(lattice)
library(vegan)
library(readxl)
library(ggplot2)
library(lme4)
library(nlme)
library(car)

library(here)
Data_Acoustic.Exp <- read.table(here("Data", "Processed", "01_Behavioral-Data_Acoustic-Exp.txt"), header=T)
Data_Acoustic.Exp <- Data_Acoustic.Exp[,c(1,2,3,4,5,6,7,8,9,12,14,16,18,19,20,21,23,24)]
Data_Acoustic.Exp$Treatment <- as.factor(Data_Acoustic.Exp$Treatment)
Data_Acoustic.Exp$ID <- as.factor(Data_Acoustic.Exp$ID)
Data_Acoustic.Exp$Name <- as.factor(Data_Acoustic.Exp$Name)

#Exploring data

plot(Data_Acoustic.Exp$t_limp)
hist(Data_Acoustic.Exp$t_limp)
qqplot(Data_Acoustic.Exp$t_limp)
qqnorm(Data_Acoustic.Exp$t_limp) 
qqline(Data_Acoustic.Exp$t_limp, col = 2)

#Tranforming data
library(vegan)
library(dplyr)
Transf.behaviors <- decostand((Data_Acoustic.Exp[,c("n_pulp",
                                                    "t_limp","n_limb","n_abeb","n_trec",
                                                    "n_empg","t_obs","n_pulo","n_estp",
                                                    "n_def","t_com",
                                                    "n_vocc",
                                                    "t_rel")]), "hellinger")
Data_Acoustic.Exp_Final <- bind_cols(Data_Acoustic.Exp[,c("ID","Name", "Sex","Treatment")], Transf.behaviors)
View(Data_Acoustic.Exp_Final)
hist(Data_Acoustic.Exp_Final$t_limp)


#Analysis

library("R2admb")
library("glmmADMB")

m_limp <- glmmadmb(t_limp ~ Treatment + Sex + (1|Name),
                   data = Data_Acoustic.Exp_Final, zeroInflation = T, family = "poisson")
coefplot(m_limp)
summary(m_limp)

Anova(m_limp)
plot(m_limp)

hist(residuals(m_limp))
plot(residuals(m_limp))
qqnorm(resid(m_limp))


m_rel <- glmmadmb(t_rel ~ Treatment + Sex + (1|Name),
                  data = Data_Acoustic.Exp_Final, zeroInflation = T, family = "poisson")
coefplot(m_rel)
summary(m_rel)

Anova(m_rel)
plot(m_rel)

hist(residuals(m_rel))
plot(m_rel)
qqnorm(resid(m_rel))

m_rel <- lmer(log(Data_Acoustic.Exp$t_rel) ~ Treatment + Sex + (1|Name),
              data = Data_Acoustic.Exp)

hist(scale(Data_Acoustic.Exp$t_rel))

m_rel <- glmmadmb(scale(Data_Acoustic.Exp$t_rel) ~ Treatment + Sex + (1|Name),
                  data = Data_Acoustic.Exp, zeroInflation = T, family = "poisson")


### TESTES

t_limp <- Data_Acoustic.Exp$t_limp

par(mfrow=c(1,1))
plot(t_limp)
hist(Data_Acoustic.Exp$t_rel)
qqplot(t_com)
qqnorm(t_limp) 
qqline(t_limp, col = 2)
View(Data_Acoustic.Exp)

install.packages("R2admb")
install.packages("glmmADMB", repos=c("http://glmmadmb.r-forge.r-project.org/repos", 
                                     getOption("repos")), type="source")
library("R2admb")
library("glmmADMB")
library(coefplot)

t_limp <- Data_Acoustic.Exp$t_limp
om <- glmmadmb(n_abeb ~ Treatment*Sex + (1|Name),
               data = Data_Acoustic.Exp, zeroInflation = T, family = "poisson")
coefplot(om)
summary(om)


library(pscl)
library(glmmTMB)
library(dplyr)

modelo <- glmmTMB(t_limp ~ Treatment*Sex + (1 | Name), data = Data_Acoustic.Exp, family = "poisson", zi = ~ Treatment * Sex)

modelo <- zeroinfl(t_limp ~ Treatment*Sex, data = Data_Acoustic.Exp, dist = "negbin")

modelo_misto_binomial_negativa <- glmmTMB(t_limp ~ Treatment*Sex + (1 | Name), 
                                          data = Data_Acoustic.Exp, 
                                          family = nbinom2)

modelo_zero_inflado <- zeroinfl(t_limp ~ Treatment*Sex | 1, data = Data_Acoustic.Exp, dist = "poisson")

modelo_mistura <- hurdle(t_limp ~ Treatment*Sex, data = Data_Acoustic.Exp, dist = "poisson")

modelo_mistura_gaussiano <- hurdle(t_limp ~ Treatment*Sex, data = Data_Acoustic.Exp, dist = "geometric")

modelo_mistura_gaussiano <- glmmTMB(t_limp ~ Treatment * Sex + (1 | Name), 
                                    data = Data_Acoustic.Exp, 
                                    family = truncated_poisson(), 
                                    zi = ~ Treatment * Sex)

# Exemplo de especificação de valores iniciais
start_values <- list(Treatment = 0.1, Sex = 0.2, `Treatment:Sex` = 0.3, `(Intercept)` = 0.05)
modelo_mistura_gaussiano <- glmmTMB(t_limp ~ Treatment * Sex + (1 | Name), 
                                    data = Data_Acoustic.Exp, 
                                    family = truncated_poisson(), 
                                    zi = ~ Treatment * Sex)
summary(modelo_mistura_gaussiano)

library(brms)

modelo_mistura_gaussiano <- brm(t_limp ~ Treatment * Sex + (1 | Name),
                                data = Data_Acoustic.Exp,
                                family = zero_inflated("gaussian"))

modelo_mistura_gaussiano <- brm(t_limp ~ Treatment * Sex + (1 | Name),
                                data = Data_Acoustic.Exp,
                                family = hurdle_poisson(),
                                control = list(adapt_delta = 0.99))

model <- glmer.nb(t_limp ~ Treatment * Sex + (1 | Name), data = Data_Acoustic.Exp)
summary(model)  ##Menor AIc 

model <- glm(t_limp ~ Treatment * Sex + (1 | Name), data = Data_Acoustic.Exp, family = "poisson")
summary(model)

modelo_glmm <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                     data = Data_Acoustic.Exp,
                     family = Gamma(link = "inverse"))
summary(modelo_glmm)

modelo_glmm <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                     data = Data_Acoustic.Exp,
                     family = inverse.gaussian(link = "1/mu^2"))

modelo_glmm <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                     data = Data_Acoustic.Exp,
                     family = lognormal())


Data_Acoustic.Exp$log_t_com <- log(Data_Acoustic.Exp$t_com + 1)  # Adiciona 1 para evitar log(0)
shapiro.test(Data_Acoustic.Exp$log_t_com)

# Ajuste o modelo LMM com distribuição normal nos dados log-transformados
modelo_lmm <- lmer(log_t_com ~ Treatment * Sex + (1 | Name),
                   data = Data_Acoustic.Exp)
summary(modelo_lmm)


# Instale e carregue o pacote glmmTMB
install.packages("glmmTMB")
library(glmmTMB)

# Ajuste um modelo GLMM com distribuição Tweedie
modelo_tweedie <- glmmTMB(t_com ~ Treatment * Sex + (1 | Name),
                          data = Data_Acoustic.Exp,
                          family = tweedie(link = "log"))

# Examine os resultados do modelo
summary(modelo_tweedie)


# Instale e carregue os pacotes necessários
install.packages("lme4")
library(lme4)
library(tweedie)

# Ajuste um modelo GLMM com distribuição Tweedie
modelo_tweedie <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                        data = Data_Acoustic.Exp,
                        family = tweedie(link = "log"),
                        start = list(theta = 1, phi = 1))

# Examine os resultados do modelo
summary(modelo_tweedie)


### tentando com transformação de hellinger

library(vegan)
Transf.behaviors <- decostand((Data_Acoustic.Exp[,c("n_pulp",
                                                    "t_limp","n_limb","n_abeb","n_trec",
                                                    "n_empg","t_obs","n_pulo","n_estp",
                                                    "n_def","t_com",
                                                    "n_vocc",
                                                    "t_rel")]), "hellinger")
Data_Acoustic.Exp <- bind_cols(Data_Acoustic.Exp[,c("ID","Name", "Sex","Treatment")], Transf.behaviors)
View(Data_Acoustic.Exp)

hist(Data_Acoustic.Exp$t_com)

modelo_glmm <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                     data = Data_Acoustic.Exp,
                     family = Gamma(link = "inverse"))
summary(modelo_glmm)

modelo_glmm <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                     data = Data_Acoustic.Exp,
                     family = inverse.gaussian(link = "1/mu^2"))

modelo_glmm <- glmer(t_com ~ Treatment * Sex + (1 | Name),
                     data = Data_Acoustic.Exp,
                     family = lognormal())

modelo_lmm <- lmer(t_com ~ Treatment * Sex + (1 | Name),
                   data = Data_Acoustic.Exp)
summary(modelo_lmm)
