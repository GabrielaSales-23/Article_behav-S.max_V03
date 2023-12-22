#PERMANOVA 

#PCA 
library(Factoshiny)

View(Data_Visual.Exp)

Data<- scale(Data_Visual.Exp[5:15]) #applying scale transformation recommended for PCA analyses with data with variables in different metrics 
Data.p <- bind_cols(Data_Visual.Exp[,c("ID","Name", "Sex","Treatment")], Data)
Data.pca = Data.p %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data.pca)

general_pca<- PCAshiny(Data.pca)

## besides maintanence and alert behaviors, t_rel, t_com and n_pulp have great contribute to variability 
