                        # a.	Load CSV in R by skipping second row
rm(list=ls()) # remove all the objects
setwd('C:/Users/Priyank/Desktop/kannu/DATASET')
getwd()
df=(read.csv("IMDB_data.csv",header=T)[-2,])
temp=(read.csv("IMDB_data.csv",header=T))
colnames(df)
str(df)
dim(df)
head(df,10)
head(df)
tail(df)
tail(df,10)
#b.	Extract the unique genres and its count and store in data frame with index key. 	 	
# counting frequency of each unique value of Genre with table function

df$Genre = factor(df$Genre)
unique_Genre_with_count = table(df$Genre)

#counting total unique values
length_of_unique_genre = length(unique(df$Genre))

#making dataframe of Genre with index
df1 = data.frame(index = (1:length_of_unique_genre),
                             unique_Genre_with_count)
colnames(df1)[2:3] = c("Genre", "Count")
                       #c. Converting the required data type.
df1$Count=as.factor(df1$Count)
str(df1)
                       # Binning and converting data types
df$imdbRating = as.numeric(df$imdbRating)

 df$imdbRatingcat[df$imdbRating >=10 & df$imdbRating <= 50]="Bad Movie"

 df$imdbRatingcat[df$imdbRating >=51 & df$imdbRating <= 80]="Good Movie"

 df$imdbRatingcat[df$imdbRating >80]="Awesome Movie"

 
                       #d.	Sort the genre by its name

 df=df[order(df$Genre),]# In ascending order
 #df=df[order(-df$Genre),] In descending order
# e.	Create new variable whose values should be square of difference between imdbrating and imdbvotes
 #df$imdbVotes = as.numeric(as.character(df$imdbVotes))
 #df$imdbRating = as.numeric(as.character(df$imdbRating))
 df['Difference']=(df$imdbVotes-df$imdbRating)^2
 #df['(R-V)^2'] = (df$imdbRating - df$imdbVotes)^2
 