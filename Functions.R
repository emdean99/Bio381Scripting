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

#######################################################
# FUNCTION h_weighberg
# Calculates Hardy-Weinberg equilibrium values
# Input: an allele frequency p (0,1)
# output: p and and the frequencies of the 3 genotypes AA,AB,BB
#-----------------------------------------------------
h_weinberg <- function(p=runif(1)) {
  q <- 1 - p
  f_AA <- p^2
  f_AB <- 2*p*q
  f_BB <- q^2
  vec_out <- signif(c(p=p, AA=f_AA, AB=f_AB, BB=f_BB),
                    digits=3)
  return(vec_out)
}
#######################################################
h_weinberg() # try with default
h_weinberg(p=0.5) # pass value to the input parameter
print(p)
pp=.6
h_weinberg(p=pp)
p <- 0.7
h_weinberg(p)

# write functions with multiple return values
#######################################################
# FUNCTION h_weighberg2
# Calculates Hardy-Weinberg equilibrium values
# Input: an allele frequency p (0,1)
# output: p and and the frequencies of the 3 genotypes AA,AB,BB
#-----------------------------------------------------
h_weinberg2 <- function(p=runif(1)) {
  if (p > 1.0 | p < 0.0) {
    return('Function Failure: p must be >= 0 and <=1.0')
  } # end of if statement
  q <- 1 - p
  f_AA <- p^2
  f_AB <- 2*p*q
  f_BB <- q^2
  vec_out <- signif(c(p=p, AA=f_AA, AB=f_AB, BB=f_BB),
                    digits=3)
  return(vec_out)
} # end of HW function
#######################################################
h_weinberg2() # default
h_weinberg2(1.1) # gives message
z <- h_weinberg2(1.1)
print(z) # ugg, z contains error message



#######################################################
# FUNCTION h_weighberg3
# Calculates Hardy-Weinberg equilibrium values
# Input: an allele frequency p (0,1)
# output: p and and the frequencies of the 3 genotypes AA,AB,BB
#-----------------------------------------------------
h_weinberg3 <- function(p=runif(1)) {
  if (p > 1.0 | p < 0.0) {
    stop('Function Failure: p must be >= 0 and <=1.0')
  } # end of if statement
  q <- 1 - p
  f_AA <- p^2
  f_AB <- 2*p*q
  f_BB <- q^2
  vec_out <- signif(c(p=p, AA=f_AA, AB=f_AB, BB=f_BB),
                    digits=3)
  return(vec_out)
} # end of HW function
#######################################################

zz <- h_weinberg3(1.1)
print(zz)

# explore scoping and local variables
my_func <- function(a=3,b=4) {
  z <- a + b
  return(z)
}
my_func()

my_func_bad <- function(a=3) {
  z <- a + b
  return(z)
}
my_func_bad()
b <- 100
my_func_bad() # runs because b is in global

# fune to create variables localls

my_func_OK <- function(a=3) {
  bb <- 100
  z <- a + bb
  return(z)
}
my_func_OK()
print(bb)

##########################################
# FUNCTION fit_linear
# fits a simple linear regression line
# inputs: numeric vector of predictor(x) and response (y)
# outputs: slope and p-value
#-----------------------------------------
fit_linear <- function(x=runif(20), y=runif(20)) {
  my_model <- lm(y~x)
  my_out <- c(slope=summary(my_model)$coefficients[2,1],
              pval=summary(my_model)$coefficients[2,4])
  #plot(x=x,y=y) # quick and dirty plot to check output
  z <- ggplot2::qplot(x=x,y=y)
  plot(z)
  return(my_out)
}  
###########################################
fit_linear()

##########################################
# FUNCTION fit_linear2
# fits a simple linear regression line
# inputs: numeric vector of predictor(x) and response (y)
# outputs: slope and p-value
#-----------------------------------------
fit_linear2 <- function(p=NULL) {
  if(is.null(p)) {
    p <- list(x=runif(20), y=runif(20))
  } # end of input NULL case
  my_model <- lm(p$y~p$x)
  my_out <- c(slope=summary(my_model)$coefficients[2,1],
              pval=summary(my_model)$coefficients[2,4])
  #plot(x=x,y=y) # quick and dirty plot to check output
  z <- ggplot2::qplot(x=p$x,y=p$y)
  plot(z)
  return(my_out)
}  
###########################################
fit_linear2()
my_pars <- list(x=1:10, y=runif(10))
fit_linear2(my_pars)

z <- c(runif(99),NA)
mean(z) # doesnt work if NA is present
mean(z,na.rm=TRUE)
mean(z,na.rm=TRUE,trim=0.05) # trip off 5% of tails
my_pars <- list(x=z,na.rm=TRUE,trim=0.05)
do.call(mean,my_pars) # works for a function and a list of parameters