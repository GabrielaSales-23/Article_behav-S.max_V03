library(EML)

library(here)

#Attributes list 
attributes <- read.table(here("Data", "Processed", "02_Metadados_Behav-Analysis_Acoustic-Exp.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "09_Metadados_Acoustic-Exp_levels.txt"), sep = "\t", header = T)
View(factors)
factors <- factors[,c(1,3)]

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "character","factor", "factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "01_Behavioral-Data_Acoustic-Exp.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "01_Behavioral-Data_Acoustic-Exp.txt",
  entityDescription = "Behavioral data of the acoustic treatment experiment",
  physical = physical,
  attributeList = attributeList)

#Personal information
R_person <- person("Gabriela", "Santos","Sales", "gabisalessantos@gmail.com", "cre", 
                   c(ORCID = "0000-0002-9441-783X"))
Gabriela <- as_emld(R_person)
others <- c(as.person("Lara Louredo Leal"), as.person("Fausto Nomura"))
associatedParty <- as_emld(others)
associatedParty[[1]]$role <- "Researcher"
associatedParty[[2]]$role <- "Researcher"

UFG_address <- list(
  deliveryPoint = "Av. Esperança, s/n - Chacaras de Recreio Samambaia, 74690-900",
  city = "Goiania",
  administrativeArea = "GO",
  country = "Brazil")

publisher <- list(
  organizationName = "Universidade Federal de Goias",
  address = UFG_address)

contact <- 
  list(
    individualName = Gabriela$individualName,
    electronicMailAddress = Gabriela$electronicMailAddress,
    address = UFG_address,
    organizationName = "Universidade Federal de Goias",
    phone = "62-3521-1474")

#Title
title <- "Behavioral data of Sporophila maximiliani during acoustic information quality experiment"

#Joining information
dataset <- list(
  title = title,
  creator = Gabriela,
  associatedParty = associatedParty,
  contact = contact,
  dataTable = dataTable)

#Generating a uuid code
eml <- list(
  packageId = uuid::UUIDgenerate(),
  system = "uuid", # type of identifier
  dataset = dataset)                                                                

#Exporting EML
eml_validate(eml)
write_eml(eml, here::here("data", "eml_01_Behavioral-Data_Acoustic-Exp.xml"))
eml_validate(here::here("data", "eml_01_Behavioral-Data_Acoustic-Exp.xml"))
