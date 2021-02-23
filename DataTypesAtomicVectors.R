# Data types and atomic vectors
# 23 Feb 20201
# EMD
# -------------------------------

# Using the assignment operator

x <- 3 # preferred assignment operator
y = 4 # legal but should only be used in functions
y = y + 1.1
print(y)
y <- y + 1.1

# conventions for naming of variables
z <- 3 # begin variable name with lower case
plantHeight <- 10 # option "camelcase"
plant.Height <- 11 # avoid periods in variable names
plant_height <- 12 # snake case - preferred
. <- 6.6 # reserve peiod for a generic holding variable

# one dimensional atomic vectors
# the combine function
z <- c(3.2,5,5,6)
print(z)
typeof(z)
is.numeric(z)
is.character(z)

# c() always "flattens" to an atomic vector
z <- c(c(3,4),c(5,6))
print(z)

# character strings bracketed by single or double quotes

z <- c("perch", 'bass', 'trout')
print(z)
z <- c("This is only 'one' character string", 
       'a second')
print(z)
is.character(z)
 # building logicals
# Boolean, not with quotes, all caps
z <- c(TRUE, TRUE, FALSE) # don't abbreviate 
typeof(z)
is.integer(z)

# Length
length(z)
typeof(z)

# Type 
z <- c(1.1,2,3.3)
typeof(z)
is.numeric(z)
as.character(z) # coerces a vector to another type
store_z <- as.character(z)
typeof(store_z)

# Names
z <- runif(5)

# names are optional attribute not initially assigned
names(z)
print(z)

# add names after vector is created
names(z) <- c('chow', 'pug', 'beagle',
              'greyhound', 'akita')
print(z)

# add names when variable is built (quotes are optional at this point)
z_2 <- c(gold=3.3,silver=10,lead=2)
print(z_2)

# reset names
names(z_2) <- NULL
print(z_2)

# names can be added for only a few elements
# names do not have to be distinct, but often are
names(z_2) <- c('copper', 'zinc')
print(z_2)

# using brackets to specify particular elements of an atomic vector

z <- c(10,12,15)
z[2] # Specifies second element only
z[c(1,3)] # grab slots 1 and 3
z[3] <- 100
print(z)

# special elements in a vector

# NA to indicate missing values
z[3] <- NA
typeof(z)
length(z)
typeof(z[3]) # what is the type of the third element?

z1 <- NA 
typeof(z1) #what is the type of this NA?

print(z)

is.na(z) # logical operator to find missing values
mean(z) # will not work because of missing values
!is.na(z) # will find elements that are NOT missing
mean(!is.na(z)) #wrong because calculating on TRUE FALSE
mean(z[!is.na(z)]) #correct way to eliminate NA


# NaN, -InF, and InF from numeric division
z <- 0/0
print(z)
typeof(z)
z <- 1/0
print(z)
typeof(z)
z <- -1/0
print(z)
typeof(z)

# NULL is an object that is nothing
# a reserved word in R
z <- NULL
typeof(z)
length(z)
is.null(z)

# Coercion

# All elements of an atomic vector must be of 
# the same type. What happens if they are not?

a <- c(2, 2.0)
typeof(a)

# if elements are of different types
# R coerces them to a common type
# Logical -> Integer -> Double -> Character

a <- c(2,3, '3')
print(a)
a <- c(1,2.2,'l')
print(a)

# use this 'mistake' and coercian for powerful computing

a <- runif(10)
print(a)

# comparison operators yield a logical result
a > 0.50

# conduct math operations on this vector of logical
# true/false values

# how many elements in the vector are >0.5?
sum(a > 0.5)

# what proportion of vector values are  > 0.5?
sum(a > 0.5)/length(a)

mean(a > 0.5)

# qualifying exam question in biology
# Approximately what proportion of observations
#drawn from a standard normal distributiuon (0,1) are larger than 2.0)

mean((rnorm(10000)) > 2.0)

# vectorization

z <- c(10,20,30)
z + 1
z <- 10
z + 1

#corresponding elements in each vector are combined
z <- c(10,20,30)
y <- c(1,2,3)
z + y

y^2

# more complex vectorized calculations
10 + 3*y + 2*y^2

# recycling
# what if vector lengths are not equal?

z <- c(10,20,30)
x <- c(1,2)

z + x

X <- 1
z + x
