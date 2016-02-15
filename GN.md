# Some topics by GN

## R Installation


## IDE: Rstudio


## Data structures


## Subsetting


## Data I/O / Database connection


## tidy data

http://vita.had.co.nz/papers/tidy-data.html
http://blog.rstudio.org/2014/07/22/introducing-tidyr/

## reshape(2)



## data.table

data.table package extends data.frame especially for large data.
It is quite fast due to optimized code.
https://github.com/Rdatatable/data.table/wiki

## dplyr

dplyr is an R-package for data manipulation.
http://www.r-bloggers.com/data-manipulation-with-dplyr/


## Profiling

Make your code better (faster).


## shiny (demonstration)

R goes interactive - accessible via web.
http://shiny.rstudio.com/


## bash / batchjobs (demonstration)

For simulations it's recommended to use batchjobs instead of
interactive sessions. They can run while you do other things.

### Rscript (/usr/bin/Rscript)

Can be included in your *.R file (header) or executed directly.

Example:
```bash
Rscript -e 'rmarkdown::render("GN.md", "html_document")'
```


## Makefile (GNU make)

Makefiles can help you to build output from source files using
dependencies. E.g. it's possible to run several *.R files and/or
create a report from an *.Rmd file.

https://en.wikipedia.org/wiki/Makefile


## loops (implicit/explicit)

Explicit: *for*, *while*
Implicit: *lapply* and friends, which are much faster

## Rcpp


## R packages (structure, why?, Roxygen)

Roxygen is a documentation system for R-packages. It allows you
to document the source code within the *.R file and generate an
*.Rd file afterwards.


## visualization (ggplot2)

Grammar of graphics

## Reproducible research (Rmarkdown, knitr, pandoc, LaTeX)

The integration of R-code in markdown or LaTeX documents is easy
using *knitr* and *rmarkdown* for reproducible research.

*pandoc* can convert many file formats into others.

Using this framework, it's possible to get different output files
(e.g. HTML and PDF) from the same input file.

YAML headers are convenient for that.


## Code sharing / version control: git / github

Git is a revision control system for software development.
https://en.wikipedia.org/wiki/Git_%28software%29

Github is an online platform for projects using git.
https://guides.github.com/activities/hello-world/

If you share your code, others can use and improve it.
