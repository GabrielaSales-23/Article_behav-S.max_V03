#PERMANOVA GERAL

##Generating a data frame with categorical variables

grups <- Data_Acoustic.Exp_Final[,c("ID","Name","Sex","Treatment")]

mod.geral<- adonis(Transf.behaviors~Treatment*Sex, data=grups,strata=grups$Name, perm=1000, method = "euclidean")
mod.geral

#PERMANOVA manuten??o

mod.man<-adonis(behav_man~Treatment*Sex, data=grups,strata=grups$Name, perm=1000, method = "euclidean")
mod.man

##Friedman de cada comportamento de manuten??o sozinho

limp<-behav_man$t_limp
Treatment<-Data_Acoustic.Exp_Final[1:100,c("Tratamento")]
Name<-Data_Acoustic.Exp_Final[1:100,c("Name")]
testeFriedman.limp <- friedman.test(
  y = limp, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.limp

limb<-behav_man$n_limb
testeFriedman.limb <- friedman.test(
  y = limb, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.limb

abeb<-behav.man$n_abeb
testeFriedman.abeb <- friedman.test(
  y = abeb, 
  groups = Treatment, 
  blocks = Name
) 
testeFriedman.abeb ##p significativo por isso o teste abaixo para ver onde foi a diferen?a
friedman_effsize(Data_Acoustic.Exp_Final,
                 n_abeb ~ Treatment| ID)

library(FSA)
library(ggplot2)
dunnTest(abeb, Treatment,
         method = "bonferroni")
boxplot(abeb~Treatment, col = c("green", "red", "blue", "orange", "black"), xlab="Treatment", ylab="Frequency of bill opneing behavior", labels="Frequency of bill opening behavior in each treatment")
ggplot(Data_Acoustic.Exp_Final, aes(y = n_abeb, x = Treatment)) +
  geom_bar(stat = "identity", fill = "tomato")+
  xlab("Treatment") + 
  ylab("Frequency of bill opening behavior") 

trec<-behav.man$n_trec
testeFriedman.trec <- friedman.test(
  y = trec, 
  groups = Treatment, 
  blocks = Name
) 
testeFriedman.trec ##p significativo significativo por isso o teste abaixo para ver onde foi a diferen?a
friedman_effsize(Data_Acoustic.Exp_Final,
                 n_trec ~ Treatment| ID)
result_trec = wilcox.test(n_trec ~ Treatment,
                     data = Data_Acoustic.Exp_Final,
                     paired = TRUE)
library(FSA)
dunnTest(trec, Treatment,
         method = "bonferroni")

boxplot(trec~Treatment, col = c("green", "red", "blue", "orange", "black"), xlab="Treatment", ylab= "Frequeny of feather settling", labels="Frequency of feather settling in each treatment")
ggplot(bicbeh, aes(y = n_trec, x = Treatment)) +
  geom_bar(stat = "identity", fill = "tomato")+
  xlab("Treatment") + 
  ylab("Frequeny of feather settling") 

#PERMANOVA alert

mod.ale<-adonis(behav_alert~Treatment*Sex, data=grups, strata=grups$Name, perm=1000, method="euclidean")
mod.ale

##Friedman for each alert behavior
empg<-behav_alert$n_empg
testeFriedman.empg <- friedman.test(
  y = empg, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.empg

obs<-behav_alert$t_obs
testeFriedman.obs <- friedman.test(
  y = obs, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.obs

pulo<-behav_alert$n_pulo
testeFriedman.pulo <- friedman.test(
  y = pulo, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.pulo

estp<-behav_alert$n_estp
testeFriedman.estp <- friedman.test(
  y = estp, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.estp

#PERMANOVA Ingestion/egestion

mod.alim<-adonis(behav_alim~Treatment*Sex, data=grups, strata=grups$Name, perm=1000, method="euclidean")
mod.alim

##Friedman de cada comportamento de alimenta??o

def<-behav_alim$n_def
testeFriedman.def <- friedman.test(
  y = def, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.def

com<-behav_alim$t_com
testeFriedman.com <- friedman.test(
  y = com, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.com

#Friedman of interaction behavior

testeFriedman.int <- friedman.test(
  y = behav_int, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.int

#Friedman of resting behavior

testeFriedman.desc <- friedman.test(
  y = behav_desc, 
  groups = Treatment, 
  blocks = Name
)
testeFriedman.desc

#PCA 
install.packages("Factoshiny")
library(Factoshiny)

View(Data_Acoustic.Exp)

Data<- scale(Data_Acoustic.Exp[5:18]) #applying scale transformation recommended for PCA analyses with data in different metrics 
Data.p <- bind_cols(Data_Acoustic.Exp[,c("ID","Name", "Sex","Treartment")], Data)
Data.pca = Data.p %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data.pca)

general_pca<- PCAshiny(Data.pca)

#PCA maintenance behaviors
Data_man<- scale(Data_Acoustic.Exp[,c("t_limp","n_limb","n_abeb","n_trec")])
Data_man <- bind_cols(Data_Acoustic.Exp[,c("ID","Name", "Sex","Treatment")], Data_man)
Data_man.pca = Data_man %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data_man.pca)

ManutencaoS.pca <- PCAshiny(Dados.pca)

#PCA alert behaviors
Data_alert <- scale(Data_Acoustic.Exp[,c("n_empg","t_obs","n_pulo","n_estp")])
Data_alert <- bind_cols(Data_Acoustic.Exp[,c("ID","Name", "Sex","Treatment")], Data_alert)
Data_alert.pca = Data_alert %>% mutate(ID = NULL, Name=NULL, Sex=NULL)
View(Data_alert.pca)

alert.pca <- PCAshiny(Data_alert.pca)
