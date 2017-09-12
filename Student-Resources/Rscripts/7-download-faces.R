# /usr/bin/R

fn <- "http://archive.ics.uci.edu/ml/machine-learning-databases/faces-mld/faces.tar.gz"
download.file(fn, destfile="Student-Resources/data/faces.tar.gz")
untar("Student-Resources/data/faces.tar.gz", exdir = "Student-Resources/data/")

