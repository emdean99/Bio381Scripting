# Functions
# 18 March 2021
# EMD
#-----------------------
library(ggplot2) 

sum(2,3) # "prefix" function
2 + 3 # an :operator" is actually a function
`+`(3,2) # the operator is an "infix" function

y <- 3
print(y)
`<-`(yy,3) # another "infix" function
print(yy)


# to see the contents of a function, print it
print(read.table)

sd # prints contents of a function
sd(c(3,2)) # calls function with parameters
sd() # call function with default values for parameters


