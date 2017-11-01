## set CRAN to latest
r <- getOption('repos')
mran_date <- Sys.Date() - 1
r[["CRAN"]] <- paste0("https://mran.revolutionanalytics.com/snapshot/", mran_date)
options(repos = r)

## install CRAN packages
reg_pkgs <- c("tidyverse",
              "scales", 
              "foreach",
              "ggrepel",
              "maps", "scales", "foreach", "devtools")
pks_missing <- reg_pkgs[!(reg_pkgs %in% installed.packages()[, 1])]
install.packages(c(pks_missing, 'knitr', 'formatR', 'rmarkdown', 'curl', 'httr'))

## install github packages
dev_pkgs <- c("RevolutionAnalytics/dplyrXdf", "jbkunst/d3wordcloud")
dev_names <- c("dplyrXdf", "d3wordcloud")
dev_pkgs <- dev_pkgs[!(dev_names %in% installed.packages()[, 1])]

devtools::install_github(dev_pkgs)

pkgs <- c(reg_pkgs, dev_names)
Map(packageVersion, pkgs)
