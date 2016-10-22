##### R-Script to install packages used in our course
##### Gerhard Nachtmann
##### 20161022
##### maybe not complete
packages <- c("ggplot2", "microbenchmark", "data.table", "Rcpp",
              "shiny", "RNetLogo", "rJava", "igraph",
              "rmarkdown", "knitr", "roxygen2", "devtools")
## install the packages
install.packages(packages, dep  = TRUE)

