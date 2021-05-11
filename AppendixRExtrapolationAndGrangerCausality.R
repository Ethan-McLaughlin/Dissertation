#The data was extrapolated for the Granger Test for reasons mentioned with the Dissertation

#Extrapolate Data
install.packages("imputeTS")
library("imputeTS")
model <- read_xlsx("Input.xlsx")
model2 <- na_interpolation(model2, option="linear")
write_xlsx(model3,"Output.xlsx")
install.packages("ggpubr")
library("ggpubr")
cor.test(model[10], model[,15], method=c("pearson"))
#granger causality
install.packages("lmtest")
library(lmtest)
model3 <- read_xlsx("Data.xlsx")
grangertest(model3[,15],model3[,5], order=1)
#  Results were recorded onto an excel document straight from the console
