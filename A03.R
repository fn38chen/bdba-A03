# Dataset Links
# https://bb-app02.ict.eur.nl/bbcswebdav/pid-179436-dt-content-rid-567048_1/courses/BMME012-16/whiskies.txt

# Load packages 
library(data.table)
library(ggplot2)

# Assignment

# 6.1 Conceptual ####
# [Q1] ####
# [Q1](a) ####
# answer from the book ##
install.packages("ISLR")
library(ISLR)
set.seed(1)
dsc = scale(USArrests)
a = dist(dsc)^2
b = as.dist(1 - cor(t(dsc)))
summary(b/a)
# Question: do we have to do this exercise in paper or in R but manually for computation. 
# [Q1](b) ####



# [Q1](c) ####
# [Q2] ####

# 6.2 Applied ####
# [Q3] ####
#--- Load the package
library(twitteR)
library(tm)
library(wordcloud)
library(data.table)

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
############################ TINA QUESTION [Q3] START ###########################################
# ---------------------------------------------------------------------------------------------#

TweetIndiedev <- searchTwitter('#indiedev', since="2017-04-02", until="2017-04-04",n=1000)
<<<<<<< HEAD
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
=======
TweetLongtail <- searchTwitter('#longtail', since="2017-04-02", until="2017-04-04",n=1000)
TweetEV <- searchTwitter('#EV', since="2017-04-02", until="2017-04-04",n=1000)


#--- Check structure of myTweets 
TweetIndiedev
TweetLongtail
TweetEV

############################ TINA QUESTION [Q3] END ###########################################
# ---------------------------------------------------------------------------------------------#

############################ FANGNING QUESTION [Q3] START ###########################################
# ---------------------------------------------------------------------------------------------#

#--- Cleaning TweetEV
# Removing re-tweets

# Converting to Data.frame 
dsTweetEV <- twListToDF(TweetEV)
dt.EV <- as.data.table(dsTweetEV)
dt.EV <- dt.EV[, n_chr := nchar(dt.EV$text)]
hist(dt.EV$n_chr)

#--- Graphical Ilustrative relevant features for TweetEV 
library(ggplot2)
# EV WORD Cloud #####

# Query 
tweets <- searchTwitter("#EV", lang="en",n=1000, since="2017-04-02", until="2017-04-04")

# Clean up tweets 
tweets_text <- sapply(tweets, function(x) x$getText())

words <- Corpus(VectorSource(tweets_text)) # Get only the text of the tweet
words <- tm_map(words, function(x) # Create a corpus from tweets
  iconv(x, to="UTF-8", sub="byte")) 
words <- tm_map(words, function(x) # Remove emoji
  gsub("(f|ht)tp(s?)://(.*)[.][a-z]+","", x))
words <- tm_map(words, tolower) # All words lowercase
words <- tm_map(words, PlainTextDocument) # Get plain text
words <- tm_map(words, removePunctuation) # Remove punctuations
words <- tm_map(words, removeWords, stopwords("english")) # Remove stop words
words <- tm_map(words, removeNumbers) # Remove numbers
words <- tm_map(words, stripWhitespace) # Remove extra white spaces
words <- tm_map(words, removeWords, c("#EV")) # Remove specific "#EV"

# Building and output the 50 words most frequent used in a wordcloud
wordcloud(words$content[[1]], scale=c(5,0.5), 
          max.words=50,
          rot.per=0.20,
          colors=brewer.pal(8, "Dark2"))

# [Q3](b) ####
# User: ElectroMotiveLA

ElectroMotiveLATimeLine <- userTimeline("ElectroMotiveLA", n = 1000)

ElectroMotiveLATimeLine

str(ElectroMotiveLATimeLine[[5]])
ElectroMotiveLATimeLine[[5]]$getText()

dsElectroMotiveLATweets <- twListToDF(ElectroMotiveLATimeLine)
View(dsElectroMotiveLATweets)
dsElectroMotiveLATweets$text

summary(dsElectroMotiveLATweets)


############################ FANGNING QUESTION [Q3] END ###########################################
# ---------------------------------------------------------------------------------------------#

# [Q3](a) ####
# [Q3](b) ####


# [Q4] ####
library ("data.table")
# Data source # https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data
# Data Documentation
# https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.names
dt.wine <- fread("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", header = FALSE)

# Packages we require to do this exercise 
library("rpart")
library("rpart.plot")
library("cluster") 
library("ape")

# Setting names 
colnames(dt.wine) <- c('class','Alcohol','Malic acid','Ash', 'Alcalinity of ash', 'Magnesium', 'Total phenols', 'Flavanoids',
                       'Nonflavanoid phenols','Proanthocyanins','Color intensity','Hue','OD280/OD315 of diluted wines',
                        'Proline')

# According to the documentation of this dataset, all attributes are continuous
# [Q4](a) ####
summary(dt.wine)
str(dt.wine)
table(dt.wine$class)
View (dt.wine)

#Delete the class column as it is not needed in the analysis
dt.wine <- dt.wine[, class := NULL]

# Scale the variables used in our analysis
dt.wine2 <-  scale(dt.wine[,2:14])

str(dt.wine2)
View (dt.wine2)

############################ TIINA QUESTION [Q4] START ###########################################
# ---------------------------------------------------------------------------------------------#
############################ TIINA QUESTION [Q4] END ###########################################
# ---------------------------------------------------------------------------------------------#
############################ FANGNING QUESTION [Q4] START ###########################################
# ---------------------------------------------------------------------------------------------#
cluster_model3 <- kmeans(dt.wine2, 3, nstart=20) 

# Cluster Plot against 1st 2 principal components
clusplot(dt.wine2, cluster_model3$cluster, color=TRUE, 
         shade=TRUE, labels=2, lines=0)


lm(dt.wine)

# [Q4](b) #### 
# Add the cluster values to the original data set
dt.wine2<- data.frame(dt.wine2, 
                       cluster=as.factor(cluster_model3$cluster))

# Visualize the instances in the third cluster
#View(whiskies[whiskies$cluster == 3, ])

# A decision tree model to explain Cluster memberships
model_1 <- cluster ~ . 
tree1 <- rpart(model_1, 
             data = dt.wine2,
             method = "class", 
             parms=list(split="information"))


# Plot the decision tree
rpart.plot(tree1, box.col= c("pink","green","yellow","grey")[tree1$frame$yval], extra = 4)


############################ FANGNING QUESTION [Q4] END###########################################
# ---------------------------------------------------------------------------------------------#

# [Q4](b) ####

