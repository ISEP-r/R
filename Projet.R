#Analyse préliminaire : statistiques descriptives
#1

data <- read.csv("productivity.csv")
dim(data)
colSums(is.na(data))
