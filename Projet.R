#Analyse préliminaire : statistiques descriptives
#1

data <- read.csv("productivity.csv")
str(data)
#2
colSums(is.na(data))
#3
withoutNa=na.omit(data)
#4
summary(data$actual_productivity)
#5
cor(actual_productivity,team)
cor(actual_productivity,targeted_productivity)
cor(actual_productivity,smv)
cor(actual_productivity,wip)
cor(actual_productivity,over_time)
cor(actual_productivity,incentive)
cor(actual_productivity,idle_time)







#Analyse en Composantes Principales (ACP)
#6
#方差小的成分可能含有影响样本差异的重要信息，降维丢弃可能对后续数据处理有影响。
#7
apply(data[, c("team", "targeted_productivity", "smv", "wip",
               "over_time", "incentive", "idle_time", 
               "idle_men", "no_of_style_change", "no_of_workers",
               "actual_productivity")], 2, var)

#8
dat <- data[, c("targeted_productivity", "smv", "over_time",
                "incentive", "no_of_workers", "actual_productivity")]
dat.pca <- prcomp(dat, center = TRUE, scale. = TRUE)
dat.pca
summary(dat.pca)
plot(dat.pca$x, main="after PCA")
biplot(dat.pca)
#9
library("factoextra")
fviz_pca_var(dat.pca, col.var = "black")
#10
d <- summary(dat.pca)
PVE <- d$importance[2,]
PVE.cum <- d$importance[3,]
barplot(PVE, ylab="Percentage of variance explained")
barplot(PVE.cum, ylab="Cumulative percentage of variance explained")
