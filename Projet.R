#Analyse préliminaire : statistiques descriptives
#1

data <- read.csv("productivity.csv")
str(data)
colSums(is.na(data))
withoutNa=na.omit(data)
attach(withoutNa)
summary(actual_productivity)
cor(actual_productivity,team)
cor(actual_productivity,targeted_productivity)
cor(actual_productivity,smv)
cor(actual_productivity,wip)
cor(actual_productivity,over_time)
cor(actual_productivity,incentive)
cor(actual_productivity,idle_time)
