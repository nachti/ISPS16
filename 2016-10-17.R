##### R-Script for catching up with R
##### Gerhard Nachtmann
##### 20161017

### logical vector
lv <- c(TRUE, TRUE, FALSE, rep(TRUE, 7))
# lv[7:9] <- c(FALSE, FALSE)
mode(lv)
sum(lv)
sum(lv)/length(lv)

### integer
iv <- c(2L, 5L, as.integer(seq(2, 16, by = 2)))
mode(iv)
1:7
is.integer(iv)
seq()

### double (numeric)
dv <- numeric(10)
set.seed(1)
dv <- c(seq(2, 16, by = 2.5), rnorm(4))
rnorm(10, 5, 0.2)
rnorm(10, 5, 0.2)
set.seed(10)
rnorm(10, 5, 0.2)
rnorm(10, 5, 0.2)
dv

### character vector
cv <- c("sdf", rep("SLU", 3))
cv
letters[7:9]
cv <- letters[iv]
sample(LETTERS, 30, replace = TRUE)
mode(cv)

### combine it
t1 <- c(cv, iv)
is.character(c(cv, iv))
t1[c(2, 15)]
t1[c(2, 15)] <- NA

iv1 <- (NA_real_)
mode(NA)
mode(NA_character_)

### list
vector(mode = "list", length = 3)
l1 <- list(cv, iv, dv)
length(l1)
l1[[2]][2]
class(l1)
l1[2]
class(l1[2])
length(l1[2])
l1[[2]]
class(l1[[2]])
length(l1[[2]])
unlist(l1)

l2 <- list(x = l1, y = runif(10))
length(l2[["x"]])
l2[["x"]]
l2[[1]]
names(l2)

##### Coffee now :-) #####

### Questions
## Komma = .
2.5
## list workspace: ls()
ls()

### Your turn: create a list l3 where 
### x is a vector from 1 to 15 and
### y is a vector from 10 to 1

l3 <- list(x = 1:15, y = 10:1)
l3

list(x = seq(1, 15), y = rev(1:10))
rev(letters)
unlist(l1[-1])

### data.frame
length(iv)
length(cv)
stopifnot(length(iv) == length(cv))
# stopifnot(length(iv) == 15)
df1 <- data.frame(x = iv, y = cv,
                  stringsAsFactors = FALSE)
df1
cv[2] <- "x"
cv
df1
df1[2, 2]
str(df1)

df2 <- data.frame(iv, cv, dv, lv)
df2
str(df2)
df2[2:3, 2]
df2[5, 2:4]
df2[5, ]
df2[ ,2]
df2[-5, ]
df2[6, 2]
names(df2)
is.list(df2)
class(df2)
df2[[2]]
df2[[2]] == df2[, 2]
all(df2[[2]] == df2[, 2])
sum(df2[[2]] != df2[, 2])
all(df2[[2]] == factor(cv))
all(df2[[2]] == cv)
all.equal(df2[[2]], df2[, 2])
str(df2)
df2$cv

### special values
t2 <- dv
t2[5] <- NA
t2[9] <- 0
t2
summary(t2)
sum(t2)
sum(dv)
sum(t2, na.rm = TRUE)
sum(t2[-5])
12 / t2
0 / 0
t3 <- 12 / t2
mean(t3, na.rm = TRUE)
median(t3, na.rm = TRUE)
t4 <- NULL
is.null(NULL)
length(NULL)
length(NA)
c(t4, iv)
length(c(t4, iv))
c(NA, iv)
length(c(NA, iv))

##### Afternoon
subset(df2, cv == "b")
subset(df2, iv > 8)
subset(df2, lv)
df2[!lv, ]

seq(0, 20, by = 0.5)
round(seq(0, 20, by = 0.5))
mean(seq(0, 20, by = 0.5))
mean(round(seq(0, 20, by = 0.5)))
round(rnorm(10), 2)
round(rnorm(10), digits = 2) # not needed
round(digits = 2, x = rnorm(10))
ceiling(seq(0, 20, by = 0.5))
ceiling(325.3)
floor(seq(0, 20, by = 0.5))

paste(cv, 3)
paste(cv, 3, sep = "-")
paste(cv, 3, sep = "")
paste0(cv, 3)
paste0("run", 1:10)
paste0("b", 0:5, collapse = "+")

seq_along(cv)
seq_len(5)
seq_len(length(cv)) # redundant

### functions
summary(df2) # generic
unclass(df2$cv)

2^(0:10)
(1:10)*4

foo <- function(){
  cat("Hello SLU\n")
}

foo()
foo

foo1 <- function(x){
  cat(paste("Hello", x, "\n"))
}

foo1("Haleh")
foo1(4)
foo1(1:4)
foo1(c("Laura", "Haleh"))

foo2 <- function(x = "Ruben"){
  writeLines(paste0("Hello ", x, "!"))
}

foo2(c("Laura", "Haleh"))
foo2()

### 1 inch = 2.54 cm
### inch2cm
inch2cm <- function(x){
  # stopifnot(is.numeric(x))
  if(!is.numeric(x)) {
    stop(paste(x, "is not numeric!"))
  }
  res <- x * 2.54
  res
}

inch2cm(1:10)
# inch2cm("a")

data(trees)
trees[,1]
inch2cm(trees[,1])
trees$Girth_cm <- inch2cm(trees[,1])
head(trees)

### loops
s1 <- function(x){
  res <- 0
  for(i in seq_along(x)){
    res <- res + x[i]
  }
  res
}

s1(3:4)
sum(3:4)

s2 <- function(x){
  res <- 0
  i <- 1
  while(i <= length(x)){
    res <- res + x[i]
    i <- i + 1
  }
  res
}

s2(3:4)

lapply(l1, length)
lapply(l1[2:3], mean)
unlist(lapply(l1[2:3], mean))
sapply(l1[2:3], mean)
lapply(l1[2:3], inch2cm)

