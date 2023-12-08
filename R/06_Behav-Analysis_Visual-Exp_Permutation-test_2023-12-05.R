## Permutation ANOVA
library(permuco)

# maintenance behaviors 

m_n_trec <- aovperm(n_trec ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_trec)

boxplot(n_trec~Treatment, col = c("green", "red", "blue", "orange", "yellow"), xlab="Treatment", ylab= "Frequeny of feather settling", labels="Frequency of feather settling in each treatment", data = Data_Visual.Exp_Final)

ggplot(Data_Visual.Exp_Final, aes(y = n_trec, x = Treatment)) +
  geom_bar(stat = "identity", fill = "tomato")+
  xlab("Treatment") + 
  ylab("Frequeny of feather settling") 

m_n_abeb <- aovperm(n_abeb ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_abeb)

m_n_limb <- aovperm(n_limb ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_limb)

# alert behavior

m_t_obs <- aovperm(t_obs ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_t_obs)

boxplot(t_obs~Treatment, col = c("green", "red", "blue", "orange", "yellow"), xlab="Treatment", ylab= "Frequeny of vigilance", labels="Frequency of vigilance in each treatment", data = Data_Visual.Exp_Final)
ggplot(Data_Visual.Exp_Final, aes(y = t_obs, x = Treatment)) +
  geom_bar(stat = "identity", fill = "tomato")+
  xlab("Treatment") + 
  ylab("Frequeny of vigilance") 

m_n_pulo <- aovperm(n_pulo ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_pulo)

m_n_estp <- aovperm(n_estp ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_estp)

# Other behaviors with great variability in PCA analysis

m_t_com <- aovperm(t_com ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_t_com)

m_n_pulp <- aovperm(n_pulp ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_pulp)

m_n_vooc <- aovperm(n_vooc ~ Treatment*Sex+Error(Name/Treatment), data = Data_Visual.Exp_Final, np = 1000, method = NULL, type = "permutation")
summary(m_n_vooc)
