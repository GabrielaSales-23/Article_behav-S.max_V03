## Permutation ANOVA
library(permuco)

# maintenance behaviors 

m_n_trec <- aovperm(n_trec ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_trec)

m_n_abeb <- aovperm(n_abeb ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_abeb)

# ploting
Data_Acoustic.Exp$Treatment <- factor(Data_Acoustic.Exp$Treatment, 
                                            levels = c("100", "90", "75", "50", "0"))
boxplot(n_abeb~Treatment, col = c("green", "blue","red", "orange", "yellow"), xlab="Treatment", ylab= "Frequeny of bill opening", labels="Frequency of bill opening in each treatment", data = Data_Acoustic.Exp)

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

m_n_vooc <- aovperm(n_vooc ~ Treatment*Sex+Error(Name/Treatment), data = Data_Acoustic.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_vooc)
