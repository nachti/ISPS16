##### R-Script for data.table introduction
##### Gerhard Nachtmann
##### 20161020

### data.table example
library(data.table)
library(microbenchmark)

data(iris)
head(iris)
str(iris)
class(iris)

## create data.table object
idt <- as.data.table(iris)
idt
class(idt)

idt$Species
## data.frame style
idt$val <- rnorm(nrow(idt))
idt

## data.table style
idt[, group := rep(letters[1:5], each = 30)]
idt
## "-" means decreasing order
setorder(idt, Sepal.Length, -Sepal.Width)
idt

## data.frame style
idt[idt$group == "d", ]

setkey(idt, group)
idt
## after setting key do a binary search
idt[J("d"), ]

## binary search in data.table should be faster for large
## datasets but is slower here :-(
microbenchmark(df = idt[idt$group == "d", ],
               dt = idt["d", ])

setkey(idt, Species)
idt
## after setting key
idt[!J("setosa"), ]
## add mean by species to original dataset
idt[, gm := mean(Sepal.Length), by = Species]
idt

## create new object containing just the species means
idtm <- idt[, list(gm = mean(Sepal.Length)),
            by = Species]
idtm

## the same for species and group
## .() is an abbreviation for list() in data.table
idt1 <- idt[, list(gm = mean(Sepal.Length)),
      by = .(Species, group)]
idt1

## show species mean ans species sum
idt[, list(gm = mean(Sepal.Length),
           gs = sum(Sepal.Length)),
    by = Species]

## add various variables
idt[, c("vat2", "sth") := .(runif(150), rnorm(150))]
idt

## remove it again
idt[, c("vat2", "sth") := NULL]
idt

