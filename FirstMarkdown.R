# Don't forget to start with comments!
# Preliminaries
library(ggplot2)

pred <- 1:10 #Vector of 10 integers
res <- runif(10) # Random Uniform Values

# Print the random numbers
print(res)

#plot the graph
qplot(x=pred,y=res)

