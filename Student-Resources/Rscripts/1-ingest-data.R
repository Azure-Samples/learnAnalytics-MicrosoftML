library(MicrosoftML) # Machine Learning Package
suppressPackageStartupMessages(library(data.table))# cuz damn it reads fast
options(stringsAsFactors = FALSE)


# import imdb data --------------------------------------------------------

imdb_dir <- file.path("/home", system("whoami", intern = TRUE), "aclImdb")

read_reviews <- function(path, sentiment) {
  
  reviews <- lapply(list.files(path, full.names = T), readr::read_lines)
  reviews_df <- data.frame(review = as.vector(unlist(reviews)))

  reviews_df$sentiment <- sentiment
  names(reviews_df)[1] <- 'review'
  
  return(reviews_df)
  
}

make_df <- function(path = "train") {
  
  pos_files <- paste(path, "pos/", sep = "/")
  train_positive <- read_reviews(pos_files, 1)
  
  neg_files <- paste(path, "neg/", sep = "/")
  train_negative <- read_reviews(neg_files, 0)
  
  train_df <- rbind(train_positive, train_negative)
  
}


# training sets -----------------------------------------------------------

train_df <- make_df(file.path(imdb_dir, "train/"))



# test sets ---------------------------------------------------------------

test_df <- make_df(file.path(imdb_dir, "test/"))

head(train_df)
table(train_df$sentiment)



# Save to XDF -------------------------------------------------------------

library(dplyrXdf)
to_xdf <- function(df, name) {
  
  rxDataStep(inData = .,
             outFile = paste0(
               "Student-Resources/data/imdb-",
               name, ".xdf"
             ))
  
}

train_xdf <- train_df %>% to_xdf("train")
test_xdf <- test_df %>% to_xdf("test")

train_xdf %>% group_by(sentiment) %>% tally %>% as.data.frame
