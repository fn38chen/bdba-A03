# Dataset Links
# https://bb-app02.ict.eur.nl/bbcswebdav/pid-179436-dt-content-rid-567048_1/courses/BMME012-16/whiskies.txt

# Load packages 
library(data.table)
library(ggplot2)

# Assignment

# 6.1 Conceptual ####
# [Q1] ####
# [Q1](a) ####
# [Q1](b) ####
# [Q1](c) ####
# [Q2] ####

# 6.2 Applied ####
# [Q3] ####
#--- Load the package
library("twitteR")

#----------------------------------------------------------
# Authentication using Ouath
#----------------------------------------------------------

consumer_key        <- "KZP7gvkPInzuWlVrrs8LciXvl"
consumer_secret     <- "Y8ov2XrLcnALCRVszSHofaQJ2vkmO8sQG6ojnhYJM1tPbslzsz"
access_token        <- "752914709670686720-Q9AE1fkjd6aZhqAiMiyvX2xBTWKoj6n"
access_token_secret <- "KNgyyCc6Ys6vIMDhGIGYiW9Fmk5oaJROS580hBt4AL2qw"

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_token_secret)

#----------------------------------------------------------
# Get tweets 
#----------------------------------------------------------
TweetIndiedev <- searchTwitter('#indiedev', since="2017-04-02", until="2017-04-04",n=1000)
TweetOnlinemarketing <- searchTwitter('#onlinemarketing', since="2017-04-02", until="2017-04-04",n=1000)

#--- Check structure of myTweets 
##Removing re-tweets
pureSetIndiedev <- strip_retweets(TweetIndiedev,
                    strip_manual=TRUE,
                    strip_mt=TRUE)

pureSetOnlinemarketing <- strip_retweets(TweetOnlinemarketing,
                    strip_manual=TRUE,
                    strip_mt=TRUE)

?strip_retweets


##Store Tweets in a data frame
dt.PureSetIndiedev <- twListToDF(pureSetIndiedev)
dt.PureSetOnlinemarketing <- twListToDF(pureSetOnlinemarketing)

View(dt.PureSetIndiedev)
View(dt.PureSetOnlinemarketing)

colnames(dt.PureSetIndiedev)
colnames(dt.PureSetOnlinemarketing

nrow(dt.PureSetIndiedev)
nrow(dt.PureSetOnlinemarketing)

str(dt.PureSetIndiedev)
str(dt.PureSetOnlinemarketing)


# [Q3](a) ####
# [Q3](b) ####
# [Q4] ####



# Data source 
# https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data
# Data Documentation
# https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.names
dt.wine <- fread("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", header = FALSE)

# [Q4](a) ####
# [Q4](b) ####

