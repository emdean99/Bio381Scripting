# Probability distributions
# March 11 2021
# EMD
#-----------------------------------
library(ggplot2)
library(MASS)

# Poisson
# Discrete X >= 0 (integer)
# Random events ('hits') occur at a constant rate
# (in a fixed time period or sampling area)
# lambda = average rate of the event

# "d" function for probability density
hits <- 0:10
my_vec <- dpois(x=hits,lambda = 1)
qplot(x=hits, 
      y=my_vec, 
      geom="col", 
      color=I('black'), fill=I('goldenrod'))

hits <- 0:10
my_vec <- dpois(x=hits,lambda = 2)
qplot(x=hits, 
      y=my_vec, 
      geom="col", 
      color=I('black'), fill=I('goldenrod'))

hits <- 0:15
my_vec <- dpois(x=hits,lambda = 6)
qplot(x=hits, 
      y=my_vec, 
      geom="col", 
      color=I('black'), fill=I('goldenrod'))

hits <- 0:15
my_vec <- dpois(x=hits,lambda = .2)
qplot(x=hits, 
      y=my_vec, 
      geom="col", 
      color=I('black'), fill=I('goldenrod'))
sum(my_vec)

dpois(x=0,lambda=2.2)


# "p" function
# genereates cumulative probability density

hits <- 0:10
my_vec <- ppois(q=hits, lambda = 2)
qplot(x=hits, 
      y=my_vec, 
      geom="col", 
      color=I('black'), fill=I('goldenrod'))

# what is the probability that a single trail will yield a value of <= 1

ppois(q=1, lambda = 2)

# we could answer this using dpois
p_0 <- dpois(x=0, lambda = 2)
print(p_0)
p_1 <- dpois(x=1, lambda = 2)
print(p_1)
p_1 + p_0

# 'q' function is the inverse of P
# what is the number of hits corresponding to 50% of the probability mass in a poisson distribution with lambda = 2.5?

qpois(p=0.5, lambda = 2.5)
qplot(x=0:10,y=dpois(x=0:10,lambda=2.5),
      geom = "col", 
      color=I("black"), 
      fill=I("goldenrod"))

ppois(q=2,lambda=2.5)

# 'r' function generates random variates for the parameters of a distribution

ran_pois <- rpois(n=1000,lambda=2.5)
qplot(x=ran_pois,
      color=I("black"),
      fill=I("goldenrod"))
# For real or similated data, we can use quantile function
quantile(x=ran_pois,probs=c(0.025,0.975))

# binomial
# p = probability of a dichotomous outcome 
# size = number of trials
# x = possible outcomes
# outcome x is bound between 0 and number of trials

# use "d" binom for density function
hits <- 0:10
my_vec <- dbinom(x=hits, size = 10, prob = 0.8)
qplot(x=0:10,
      y=my_vec,
      geom='col',
      color=I('black'),
      fill=I('goldenrod'))

my_coins <- rbinom(n=50, size=100, prob=0.6)
qplot(x=my_coins,
      color=I('black'),
      fill=I('goldenrod'))

# negative binomial: number of failures 
# expected before reaching a number of sucesses
# in a set of binomial trials. measure of "waiting times"

# alternatively, can specify mu = mean, and 
# size = dispersion parameter (smaller values are more dispersed)

# negative binomial is similar to the poisson
# but more heterogenous

neg_bin <- rnbinom(n=1000,size=10,mu=5)
qplot(neg_bin,color=I('black'),fill=I('goldenrod'))

neg_bin <- rnbinom(n=1000,size=0.1,mu=5)
qplot(neg_bin,color=I('black'),fill=I('goldenrod'))

neg_bin <- rnbinom(n=1000,size=100,mu=5)
qplot(neg_bin,color=I('black'),fill=I('goldenrod'))

# uniform
# parameters for minimum and maximum

qplot(x=runif(n=100,min=0,max=5),
      color=I('black'),
      fill=I('goldenrod'))

qplot(x=runif(n=10000,min=0,max=5),
      color=I('black'),
      fill=I('goldenrod'))

# normal, gaussian
my_norm <- rnorm(n=1000,mean=100,sd=2)
qplot(x=my_norm,
      color=I('black'),
      fill=I('goldenrod'))
summary(my_norm)

# problem if mean is small but must be greater than 0
my_norm <- rnorm(n=100,mean=1,sd=2)
qplot(x=my_norm,
      color=I('black'),
      fill=I('goldenrod'))
summary(my_norm)

no_zeros <- my_norm[my_norm>0]
qplot(x=no_zeros,
      color=I('black'),
      fill=I('goldenrod'))
summary(no_zeros)

# gamma distribution
# continuous positive, bounded only at zero
# shape, scale

my_gamma <- rgamma(n=100, shape = 100, scale = 10)
qplot(x=my_gamma,
      color=I('black'),
      fill=I('goldenrod'))

# mean = shape * scale
# variance = shape * scale^2

# beta distribution
# continuous, but bounded between 0 and 1,
# shape1 and shape2
# beta can be treated as the distribution 
# of probability values for estimating a binomial process # successes/#trials
# successes/(#successes + #failures)
# shape1 = number of successes + 1
# shape2 = number of failures + 1

#no data
my_beta <- rbeta(n=1000, shape1=1, shape2=1)
qplot(x=my_beta,
      color=I('black'),
      fill=I('goldenrod'))

# suppose 7 heads and 3 tails
my_beta <- rbeta(n=1000, shape1=8, shape2=4)
qplot(x=my_beta,
      color=I('black'),
      fill=I('goldenrod'))

# suppose 70 heads and 30 tails
my_beta <- rbeta(n=1000, shape1=71, shape2=31)
qplot(x=my_beta,
      color=I('black'),
      fill=I('goldenrod'))

# suppose we toss a coin once
my_beta <- rbeta(n=1000, shape1=2, shape2=1)
qplot(x=my_beta,
      color=I('black'),
      fill=I('goldenrod'))

# parameters less than 1.0 give3 a bimodal
# distribution with the beta
# suppose 70 heads and 30 tails
my_beta <- rbeta(n=1000, shape1=0.21, shape2=0.1)
qplot(x=my_beta,
      color=I('black'),
      fill=I('goldenrod'))


# p(data|hypothesis)

#p(data|parameters) # goodness of fit test

# p(parameters|data) # maximize this probability

# maximum likelihood estimators of the paramters

library(MASS)
data <- c(0,0,0,0,0,0,1,1,1,2)
z <- fitdistr(data,'poisson')
print(z)
sim_data <- rpois(n=10,lambda = z$estimate['lambda'])
head(sim_data)

# 1. Select a statistical distribution that is appropriate for the data.
# 2. use fitdistr() function to find maximum likelihood estimates of the distribution parameters
# 3. use those parameters to visualize the probability density function ('d' family) and/or simulate additional data to use for other things

# Empirical example

frog_data <- c(30.15, 26.3, 27.5,
               22.9, 27.8, 26.2)
z <- fitdistr(frog_data, "normal")
print(z)

# plot density function for the normal data with these parameters and annotate with original data points

x <- 0:50
p_density <- dnorm(x=x, 
                mean = z$estimate['mean'],
                sd=z$estimate['sd'])
qplot(x,p_density,geom="line") + 
  annotate(geom='point',x=frog_data,y=0.001)

# do the same for gamma distribution
p_density <- dgamma(x=x, 
                   shape = z$estimate['shape'],
                   rate = z$estimate['rate'])
qplot(x,p_density,geom="line") + annotate(geom='point',x=frog_data,y=0.001, color="red")

# Empirical example + weird outlier

outlier <- 0.05
frog_data <- c(30.15, 26.3, 27.5,
               22.9, 27.8, 26.2)
frog_data <- c(frog_data, outlier)
z <- fitdistr(frog_data, "normal")
print(z)

x <- 0:50
p_density <- dnorm(x=x, 
                   mean = z$estimate['mean'],
                   sd=z$estimate['sd'])
qplot(x,p_density,geom="line") + 
  annotate(geom='point',x=frog_data,y=0.001)

# do the same for the gama
z <- fitdistr(frog_data, "gamma")
print(z)

p_density <- dgamma(x=x, 
                    shape = z$estimate['shape'],
                    rate = z$estimate['rate'])
qplot(x,p_density,geom="line") + annotate(geom='point',x=frog_data,
                                          y=0.001, color="red")

