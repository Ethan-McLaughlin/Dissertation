#This is how the data was collected
#Tweet Collection
library(rtweet)
DisTweets <- search_tweets("stocK OR \"FTSE 100\" OR SP500 OR finance OR \"wall street bets\" OR WSB OR #stocks OR \"stock market news\" OR \"stock market\" OR \"day trading\" OR DJ30 OR Russell2000", n= 40000, type = "mixed", include_rts = FALSE, retryonratelimit = TRUE, lang="en")
#REDDIT API
library("RedditExtractoR")
DisR59WSB <- get_reddit(subreddit="wallstreetbets", page_threshold =10)
DisR59Stocks <- get_reddit(subreddit="stocks", page_threshold =10)  
DisR59Inv <- get_reddit(subreddit="investing", page_threshold =10)
#Write as an Excel or CSV Document
library(readxl)
library(writexl)
write_xlsx(DisTweet, "Document")
Write.csv(DisRWSB, "Document")
Write.csv(DisStock, "Documents")