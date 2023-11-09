library(here)

Dados_Acoustic.Exp <- read.table(here("Data", "Processed", "01_Behavioral-Data_Acoustic-Exp.txt"), header=T)

## Exploração dos dados
View(Dados_Acoustic.Exp)
head(Dados_Acoustic.Exp)
summary(Dados_Acoustic.Exp)

library(dplyr)
glimpse(Dados_Acoustic.Exp)

Dados_Acoustic.Exp$Treatment <- as.character(Dados_Acoustic.Exp$Treatment)
Dados_Acoustic.Exp$ID <- as.character(Dados_Acoustic.Exp$ID)
