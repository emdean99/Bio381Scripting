# Matrices, lists, data frames
# 3 March 2021
# EMD
#-------------------------------
# Preliminaries
library(ggplot2)

# matrix is built from an atomic vector
m <- matrix(data=1:12,nrow=4,ncol=3)
print(m)

m <- matrix(data=1:12,nrow=4)
print(m)

# Fill one row at a time
m <- matrix(data=1:12,nrow=4,byrow=TRUE)
print(m)

# use function dim to see dimensions
dim(m)

# matrix dimensions can be changed (must be correct size)
dim(m) <- c(6,2)
print(m)
dim(m) <- c(4,3)
print(m)

# get the row and column numbers separately
nrow(m)
ncol(m)

# note that length of matrix is referring to atomic vector
length(m)

#add names
rownames(m) <- c('a','b','c','d')
print(m)
colnames(m) <- LETTERS[1:ncol(m)]
rownames(m) <- letters[nrow(m):1]
print(m)

# specify row element
# print row 2, column 3
print(m[2,3])

# subset an entire row or column by leaving other dimension blank
# print row 2, showing all columns
print(m[2,])
# print column 3, showing all rows
print(m[,3])

# print everything
print(m)
print(m[,])
print(m[])

rownames(m) <- paste('Species', LETTERS[1:nrow(m)], sep='')
colnames(m) <- paste('Site', 1:ncol(m), sep='')
print(m)

dimnames(m) <- list(paste('Species', LETTERS[1:nrow(m)], sep=''),paste('Site', 1:ncol(m), sep=''))
print(m)

# transpose a matrix with t()
m_transpose <- t(m)
print(m_transpose)

# add a row to a matrix with the rbind() function
m_transpose <- rbind(m_transpose, c(10,20,30,40))
print(m_transpose)

# Fix the label
rownames(m_transpose)
rownames(m_transpose)[4] <- 'myfix'
print(m_transpose)

# Access indicidual rows and columns by their names
m_transpose['myfix', 'SpeciesC']

# add columns to matric with cbind function
SpeciesE <- c(13,2,0,1)
m_transpose <- cbind(m_transpose,SpeciesE)
print(m_transpose)

# easy to convert back to an atomic vector
my_vec <- as.vector(m_transpose)
print(my_vec)

# lists are an atomic vector, but
# it can hold objects of different types

my_list <- list(1:10, matrix(1:8,nrow=4,byrow=TRUE),
                letters[1:3],pi)
str(my_list)
print(my_list)

# using single brackets [] does not give contents,
# it just gives the list item!

my_list[4]
my_list[4] - 3
# if a list has 10 elements, it is like a train with 10 cars
# contents of the 5th car, [[5]]
# [c(4,5,6)] creates a little train with cars, 4, 5, and 6
my_list[[4]] - 3

# one double bracket is called, individual elements
# can be accessed in the usual way
my_list[[2]]
my_list[[2]][4,1]

#

my_list2 <- list(tester=FALSE,little_m=matrix(1:9,nrow=3))
print(my_list2)
# the named elements in a list can be accessed with the dollar sign prefix

my_list2$little_m[2,3]
my_list2$little_m[]
my_list2$little_m[2,]
my_list2$little_m[2]

# the unlist unfunction put everything into a single atomic vector
unrolled <- unlist(my_list2)
print(unrolled)

# output from linear model is a list with info we need

y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var,y=y_var)

# look at output from model
print(my_model)
summary(my_model)
str(summary(my_model))

# pull out what we need
summary(my_model)$coefficients
str(summary(my_model)$coefficients)
stats <- summary(my_model)$coefficients
stats['x_var','Pr(>|t|)']
stats[2,4]

# Let's get our number using unlist

u <- unlist(summary(my_model))
my_pval <- u$coefficients8

# data frame is a list of equal-lengthed atomic vectors

var_a <- 1:12
var_b <- rep(c('Con', 'LowN', 'HighN'), each=4)
var_c <- runif(12)

d_frame <- data.frame(var_a,var_b,var_c)
str(d_frame)
print(d_frame)

# add another row with rbind
# make sure you add it as a list with each named
# item corresponding to a column
new_data <- list(var_a=13,var_b='HighN',var_c=0.6687)
d_frame <- rbind(d_frame,new_data)
str(d_frame)
tail(d_frame)

# adding a column is simpler
var_d <- runif(13)
d_frame <- cbind(d_frame,var_d)
str(d_frame)

# more concise and elegant addition of a column

d_frame$var_e <- 13:1
str(d_frame)
head(d_frame)
d_frame$var_f <- rnorm(12)
d_frame$var_f <- c(rnorm(12),NA)
tail(d_frame)

