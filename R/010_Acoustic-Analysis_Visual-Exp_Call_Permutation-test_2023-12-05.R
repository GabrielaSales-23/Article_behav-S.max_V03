library(here)
Call_Data_Visual_Exp <- read.table(here("Data", "Processed", "07_Acoustic-Data_Visual-Exp_Call-frequency.txt"), header=T)

View(Call_Data_Visual_Exp)

library(dplyr)
glimpse(Call_Data_Visual_Exp)
Call_Data_Visual_Exp$Treatment <- as.character(Call_Data_Visual_Exp$Treatment)

library(permuco)
m_Freq75 <- aovperm(Freq75~Treatment*Sex+(Name/Treatment), np = 999, data=Call_Data_Visual_Exp)
m_Freq75

m_Freq25 <- aovperm(Freq25~Treatment*Sex+(Name/Treatment), np = 999, data=Call_Data_Visual_Exp)
m_Freq25

m_PeakFreq <- aovperm(PeakFreq~Treatment*Sex+(Name/Treatment), np = 999, data=Call_Data_Visual_Exp, type = "permutation")
m_PeakFreq
