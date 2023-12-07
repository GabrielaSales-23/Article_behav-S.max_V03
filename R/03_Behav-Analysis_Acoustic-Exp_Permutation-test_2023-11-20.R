#Permutation ANOVA
library(RVAideMemoire)
perm.anova(n_trec ~ Treatment*Sex|Name, data = Data_Acoustic.Exp_Final, nperm=999)

summary(Data_Acoustic.Exp_Final$Name)
table(Data_Acoustic.Exp_Final$Name)

sum(Data_Acoustic.Exp_Final$Treatment == "100")
sum(Data_Acoustic.Exp_Final$Treatment == "90")
sum(Data_Acoustic.Exp_Final$Treatment == "75")
sum(Data_Acoustic.Exp_Final$Treatment == "50")
sum(Data_Acoustic.Exp_Final$Treatment == "0")

sum(Data_Acoustic.Exp_Final$Sex == "M")
sum(Data_Acoustic.Exp_Final$Sex == "F")

Data_Acoustic.Exp_Final$Name

#Opting for unbalanced data
library(car)
model <- aov(n_trec ~ Treatment * Sex + Error(Name/(Treatment*Sex)), data = Data_Acoustic.Exp_Final)
drop1(model, test = "F")

summary(model)

#Grafic

boxplot(trec~Treatment, col = c("green", "red", "blue", "orange", "black"), xlab="Treatment", ylab= "Frequeny of feather settling", labels="Frequency of feather settling in each treatment")
ggplot(Data_Acoustic.Exp_Final, aes(y = n_trec, x = Treatment)) +
  geom_bar(stat = "identity", fill = "tomato")+
  xlab("Treatment") + 
  ylab("Frequeny of feather settling") 

## Permutation ANOVA
library(permuco)

# maintenance behaviors 

m_n_trec <- aovperm(n_trec ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_trec)

m_n_abeb <- aovperm(n_abeb ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_abeb)
boxplot(n_abeb~Treatment, col = c("green", "red", "blue", "orange", "yellow"), xlab="Treatment", ylab= "Frequeny of bill opening", labels="Frequency of bill opening in each treatment", data = Data_Acoustic.Exp_Final)

library(ggplot2)
ggplot(Data_Acoustic.Exp_Final, aes(y = n_abeb, x = Treatment)) +
  geom_bar(stat = "identity", fill = "tomato")+
  xlab("Treatment") + 
  ylab("Frequency of bill opening") 

m_n_limb <- aovperm(n_limb ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_limb)

m_t_limp <- aovperm(t_limp ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_t_limp)

# alert behavior

m_n_empg <- aovperm(n_empg ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_empg)

m_t_obs <- aovperm(t_obs ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_t_obs)

m_n_pulo <- aovperm(n_pulo ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_pulo) ## correlation with n_empg, so dosen't need to test

m_n_estp <- aovperm(n_estp ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_estp)

# Other behaviors with great variability in PCA analysis

m_t_com <- aovperm(t_com ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_t_com)

m_n_def <- aovperm(n_def ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_def)

m_n_pulp <- aovperm(n_pulp ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_pulp)


install.packages('devtools')
library(devtools)
install_github("pmartinezarbizu/pairwiseAdonis/pairwiseAdonis") 
library(pairwiseAdonis)
n_abeb <- Data_Acoustic.Exp_Final$n_abeb
pair.mod<-pairwise.adonis(Data_Acoustic.Exp_Final$n_abeb,factors=Data_Acoustic.Exp_Final$Treatment, perm = 999)
pair.mod


library(dplyr)
library(tidyr)

DV <- Data_Acoustic.Exp_Final %>%
  dplyr::select(Name, Sex, Treatment)

DV$M <- Data_Acoustic.Exp_Final %>%
  dplyr::select(-Name, -Sex, -Treatment, -ID) %>%
  as.matrix()

glimpse(DV)
View(DV)
DV$M

fit_mixed <- aov(M ~ Treatment * Sex , DV)

colnames(DV$M)

library(emmeans)
rm_levels <- list(Name = c("M02","M03","M06","M08","M10","M09","M11","M04","M07","M12","F15","F03","F10","F14","F08","F09","F13","F11","F17","F04"))
rg <- ref_grid(fit_mixed, mult.levs = rm_levels)
rg <- ref_grid(fit_mixed)
rg
em_ <- emmeans(rg, ~ Treatment * Sex)
em_

c_ <- contrast(em_, "pairwise", by = "Name")
c_


###Referência para análise de pares: https://blog.msbstats.info/posts/2019-05-09-bootstraping-rm-contrasts/ 