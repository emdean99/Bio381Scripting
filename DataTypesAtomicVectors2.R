# Data types and atomic vectors - part 2
# 12 January 2021
# EMD

# Create atomic vector (avoid this)
z <- vector(mode="numeric",length=0)
print(z)
# add elements to it
z <- c(z,5)
head(z)
# this "dynamic sizing" is very slow!!

# predefine vecot length

#create a vector of 100 0s
z <- rep(0,100)
head(z)

# Vetter to start with NAs
z <- rep(NA,100)
typeof(z)
z[1] <- "Washington"
head(z)
typeof(z)

# efficiently create a large vector with names
my_vector <- runif(100)
my_names <- paste("Species",seq(1:length(my_vector)),  
                  sep="")
head(my_names)
names(my_vector) <- my_names
head(my_vector)

# using the rep function
rep(0.5,6)
rep(x=0.5,times=6) #give input names
rep(times=6,x=0.5) #order not important if names specified

my_vec <- c(1,2,3)
rep(x=my_vec,times=2)
rep(x=my_vec,each=2)
rep(x=my_vec,times=my_vec) # what does this do?
rep(x=my_vec,each=my_vec) # why?

#using seq
seq(from=2,to=4)
2:4 # very common in r programming
seq(from=2,to=4,by=0.5)
x <- seq(from=2,to=4,length=7)
my_vec <- seq(1:length(x))
my_vec
seq_along(x)
seq_len(5)

runif(5)
runif(n=3,min=100,max=103)

rnorm(6) #mean 0 sd 1
rnorm(n=6,mean=100,sd=30)

# Explore distributions by sampling and plotting
library(ggplot2) #do this at the start
z <- runif(1000)
qplot(z)

# using sample function
long_vec <- seq_len(10)
long_vec
sample(long_vec) # with no other parameters, this is just reorders the data
sample(long_vec,size=3) # specify a number, sampling without replacement
sample(long_vec,size=16) # too large
sample(long_vec,size=16,  
       replace=TRUE) # sampling with replacements

my_weights <- c(rep(20,5),rep(100,5)) # a set of non-zero positive weights )integers or real)
my_weights
sample(x=long_vec,replace=TRUE,prob=my_weights)
sample(x=long_vec,replace=FALSE,prob=my_weights)
sample(x=long_vec,replace=TRUE,prob=long_vec)

# subsetting atomc vectors

z <- c(3.1, 9.2, 1.3, 0.4, 7.5)

# positive index values
z[c(2,3)]
z[c(2,2,3,3)]

# negative index values to exclude elements
z[-c(2,3)]

# create a vector of logical elements to select 
# based on values

z < 3
z[z<3]

tester <- z < 3
print(tester)
z[tester]

# also have which function
which(z<3)

# use length to get positions relative to start
# and end of vector
# select everything but last two elements
z[-(length(z):(length(z)-1))]

# subset using named vector elements

names(z) <- letters[1:5]
z[c("b","c")]

# Relational Operators in R
# < less than
# > greater than
# <= less than or equal to
# >= greater than or equal to
# == equal to

# logical operators in R

# ! not
# & and (vector)
# | or (vector)
# xor(vec_a,vec_b) one or the other but not both
# && and (only for the first element)
# || or (only applies for the first element)

x <- 1:5
y <- c(1:3,7,7)

x == 2
x != 2

x == 7
x == 1
y == 7
x == 1 & y == 7
x == 1 | y == 7
x == 3 | y == 3
xor(x == 3, y == 3)
x == 3 && y == 3

# subscripting with missing values

set.seed(90)
z <- runif(10)
print(z)

z < 0.5 # create a logical vector
z[z < 0.5]
which(z < 0.5)
z[which(z < 0.5)]

# which behaves differently if there are NAs!!!!!!!!!!!!!!!
zD <- c(z,NA,NA) # contaminate it
zD[zD < 0.5] # NA values carried along!
z[which(z < 0.5)] # NA values are dropped!
