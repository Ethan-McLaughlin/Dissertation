#Necessary Tokens
library(textclean)
library(readxl)
DataClean <- read_xlsx("DATA")
#Cleaning the Text and removing excess Tokens
DataClean$no1 <-gsub("@","", RedditWSBTrain3$title) #remove @
DataClean$no2 <- gsub("#","",RedditWSBTrain3$no1) #remove 
DataClean$no3 <-  gsub("http\\s+", "", RedditWSBTrain3$no2)
DataClean$no4 <- tolower(RedditWSBTrain3$no3) #lowercase
DataClean$no4.5 <- gsub("⬆️", "up ", RedditWSBTrain3$no4)
DataClean$no4.75 <- gsub("⬇️", "down ", RedditWSBTrain3$no4.5)
DataClean$no5 <- gsub("[^\x01-\x7F]", "", RedditWSBTrain3$no4.75) #removes emojis
DataClean$no6 <-gsub("", "'", RedditWSBTrain3$no5)
DataClean$no7 <- gsub("=", "", RedditWSBTrain3$no6)
DataClean$no8 <- gsub(">","",RedditWSBTrain3$no7)
DataClean$no9 <-gsub("<","", RedditWSBTrain3$no8)
DataClean$no10 <-gsub("","", RedditWSBTrain3$no9)
DataClean$no11 <- gsub("","", RedditWSBTrain3$no10)
DataClean$no12 <- gsub("","", RedditWSBTrain3$no11)
DataClean$no13 <- gsub("|","", RedditWSBTrain3$no12)
DataClean$no14 <- gsub("","", RedditWSBTrain3$no13)
DataClean$no15 <- gsub("-&gt;", " to ", RedditWSBTrain3$no14)
DataClean$no16 <- gsub("&", "and ", RedditWSBTrain3$no15)
DataClean$no17 <- gsub("http[^[:space:]]*", "", RedditWSBTrain3$no16)
DataClean$no18 <- gsub("r/","", RedditWSBTrain3$no17)
DataClean$no19 <- gsub("yolo", "you only live once", RedditWSBTrain3$no18)
DataClean$no20 <- gsub("amp;utm[^[:space:]]*", "", RedditWSBTrain3$no19)
DataClean$no21 <- gsub("amp;context[^[:space:]]*","", RedditWSBTrain3$no20)
DataClean$no22 <- gsub("*", "", RedditWSBTrain3$no21)
DataClean$no23 <- gsub("~", "", RedditWSBTrain3$no22)
DataClean$Cleanedtext<- gsub("u/", "", RedditWSBTrain3$no23)
DataCleanTrainC <- DataClean[-c(2, 4:24, 26:30)] #Remove Excess Columns
DataCleanTrainc1 <- DataCleanTrainC[ grep("*i am a bot", RedditWSBTrainC$Cleanedtext, invert = TRUE) , ] #Remove bot messages
write_xlsx(DataCleanTrainc1, "Cleaned.xlsx")