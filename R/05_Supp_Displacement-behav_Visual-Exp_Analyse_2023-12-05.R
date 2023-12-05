#PERMANOVA 

##Generating a data frame with categorical variables

grups <- Data_Visual.Exp_Final[,c("ID","Name","Sex","Treatment")]

mod.geral<- adonis2(Transf.behaviors~Treatment*Sex, data=grups,strata=grups$Name, perm=1000, method = "euclidean")
mod.geral

#PCA 
library(Factoshiny)

View(Data_Visual.Exp)

Data<- scale(Data_Visual.Exp[5:14]) #applying scale transformation recommended for PCA analyses with data with variables in different metrics 
Data.p <- bind_cols(Data_Visual.Exp[,c("ID","Name", "Sex","Treatment")], Data)
Data.pca = Data.p %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data.pca)

general_pca<- PCAshiny(Data.pca)

## besides maintanence and alert behaviors, t_rel, t_com and n_pulp have great contribute to variability 

#PERMANOVA maintanance behaviors

mod.man<-adonis2(behav_man~Treatment*Sex, data=grups,strata=grups$Name, perm=1000, method = "euclidean")
mod.man

#PCA maintenance behaviors
Data_man<- scale(Data_Visual.Exp[,c("n_limb","n_abeb","n_trec")])
Data_man <- bind_cols(Data_Visual.Exp[,c("ID","Name", "Sex","Treatment")], Data_man)
Data_man.pca = Data_man %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data_man.pca)

ManutencaoS.pca <- PCAshiny(Data_man.pca)

#PERMANOVA alert behaviors

mod.ale<-adonis2(behav_alert~Treatment*Sex, data=grups, strata=grups$Name, perm=1000, method="euclidean")
mod.ale

#PCA alert behaviors
Data_alert <- scale(Data_Visual.Exp[,c("t_obs","n_pulo","n_estp")])
Data_alert <- bind_cols(Data_Visual.Exp[,c("ID","Name", "Sex","Treatment")], Data_alert)
Data_alert.pca = Data_alert %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data_alert.pca)

alert.pca <- PCAshiny(Data_alert.pca)
