zipfile <- tempfile("sentiment_sentences")

download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00331/sentiment%20labelled%20sentences.zip",
              zipfile)

target_files <- list(
  amazon = "sentiment labelled sentences/amazon_cells_labelled.txt",
  imdb = "sentiment labelled sentences/imdb_labelled.txt",
  yelp = "sentiment labelled sentences/yelp_labelled.txt"
)

getData <- function(targetFile, zipfile){
  read.delim(unz(zipfile, targetFile), 
             header=FALSE, 
             col.names=c("Text", "Rating"),
             quote="",
             stringsAsFactors=FALSE)
}


dataset_list <- lapply(target_files, getData, zipfile)

