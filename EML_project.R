library(EML)

library(here)

#------------ Metadata of "01_Behavioral-Data_Acoustic-Exp.txt" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "02_Metadados_Behav-Analysis_Acoustic-Exp.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "09_Metadados_Acoustic-Exp_levels.txt"), sep = "\t", header = T)

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

#------------ Metadata of "03_Behavioral-Data_Visual-Exp" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "04_Metadados_Behav-Analysis_Visual-Exp.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "010_Metadados_Visual-Exp_levels.txt"), sep = "\t", header = T)

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "character","factor", "factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "03_Behavioral-Data_Visual-Exp.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "03_Behavioral-Data_Visual-Exp.txt",
  entityDescription = "Behavioral data of the visual treatment experiment",
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
title <- "Behavioral data of Sporophila maximiliani during visual information quality experiment"

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
write_eml(eml, here::here("data", "eml_03_Behavioral-Data_Visual-Exp.xml"))
eml_validate(here::here("data", "eml_03_Behavioral-Data_Visual-Exp.xml"))

#------------ Metadata of "05_Acoustic-Data_Acoustic-Exp_Call-frequency" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "06_Metadados_Acoustic-Analysis_Acoustic-Exp_Call-frequency.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "09_Metadados_Acoustic-Exp_levels.txt"), sep = "\t", header = T)

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "factor", "factor", "numeric","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "05_Acoustic-Data_Acoustic-Exp_Call-frequency.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "05_Acoustic-Data_Acoustic-Exp_Call-frequency.txt",
  entityDescription = "Frequency (Hz) of the calls emited during acoustic treatment experiment",
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
title <- "Frequency (Hz) of Sporophila maximiliani calls during acoustic information quality experiment"

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
write_eml(eml, here::here("data", "eml_05_Acoustic-Data_Acoustic-Exp_Call-frequency.xml"))
eml_validate(here::here("data", "eml_05_Acoustic-Data_Acoustic-Exp_Call-frequency.xml"))

#------------ Metadata of "05_Acoustic-Data_Acoustic-Exp_Emission-rate" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "06_Metadados_Acoustic-Analysis_Acoustic-Exp_Emission-rate.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "09_Metadados_Acoustic-Exp_levels.txt"), sep = "\t", header = T)

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "factor", "factor", "numeric","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt",
  entityDescription = "Emission rate of the calls emited during acoustic treatment experiment",
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
title <- "Emission rate of Sporophila maximiliani calls during acoustic information quality experiment"

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
write_eml(eml, here::here("data", "eml_05_Acoustic-Data_Acoustic-Exp_Emission-rate.xml"))
eml_validate(here::here("data", "eml_05_Acoustic-Data_Acoustic-Exp_Emission-rate.xml"))

#------------ Metadata of "05_Acoustic-Data_Acoustic-Exp_Overlapping-calls" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "06_Metadados_Acoustic-Analysis_Acoustic-Exp_Overlapping-calls.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "09_Metadados_Acoustic-Exp_levels.txt"), sep = "\t", header = T)

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "factor", "factor","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "05_Acoustic-Data_Acoustic-Exp_Emission-rate.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "05_Acoustic-Data_Acoustic-Exp_Overlapping-calss.txt",
  entityDescription = "Analysis of calls emited over the playback during acoustic treatment experiment",
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
title <- "Call of Sporophila maximiliani overalapping the playback during acoustic information quality experiment"

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
write_eml(eml, here::here("data", "eml_05_Acoustic-Data_Acoustic-Exp_Overlapping-calls.xml"))
eml_validate(here::here("data", "eml_05_Acoustic-Data_Acoustic-Exp_Overlapping-calls.xml"))

#------------ Metadata of "Visual-Data_Acoustic-Exp_Call-frequency" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "08_Metadados_Acoustic-Analys_Visual-Exp_Calls-frequency.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "010_Metadados_Visual-Exp_levels.txt"), sep = "\t", header = T)

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "factor", "factor", "numeric","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "07_Acoustic-Data_Visual-Exp_Call-frequency.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "07_Acoustic-Data_Visual-Exp_Call-frequency.txt",
  entityDescription = "Frequency (Hz) of the calls emited during visual treatment experiment",
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
title <- "Frequency (Hz) of Sporophila maximiliani calls during visual information quality experiment"

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
write_eml(eml, here::here("data", "eml_07_Acoustic-Data_Visual-Exp_Call-frequency.xml"))
eml_validate(here::here("data", "eml_07_Acoustic-Data_Visual-Exp_Call-frequency.xml"))

#------------ Metadata of "07_Acoustic-Data_Visual-Exp_Emission-rate" ---------------------------

#Attributes list 
attributes <- read.table(here("Data", "Processed", "08_Metadados_Acoustic-Analys_Visual-Exp_Emission-rate.txt"), sep = "\t", header=T)
View(attributes)

##Levels of "Sex" and "Treatment" factors
factors <- read.table(here("Data", "Processed", "010_Metadados_Visual-Exp_levels.txt"), sep = "\t", header = T)

#joining list of attributes and levels
attributeList <- set_attributes(attributes, factors, col_classes = c("character", "factor", "factor", "numeric","numeric","numeric"))

#Physical information of the data frame
physical <- set_physical(here::here("data", "07_Acoustic-Data_Visual-Exp_Emission-rate.txt"))

#Joining attributeList and physical information
dataTable <- list(
  entityName = "07_Acoustic-Data_Visual-Exp_Emission-rate.txt",
  entityDescription = "Emission rate of the calls emited during visual treatment experiment",
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
title <- "Emission rate of Sporophila maximiliani calls during visual information quality experiment"

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
write_eml(eml, here::here("data", "eml_07_Acoustic-Data_Visual-Exp_Emission-rate.xml"))
eml_validate(here::here("data", "eml_07_Acoustic-Data_Visual-Exp_Emission-rate.xml"))
