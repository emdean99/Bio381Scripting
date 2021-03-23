# Sample program to illustrate structured programming with functions.
# 23 March 2021
# EMD
#-------------------------------------------------------------------
# Preliminaries
library(ggplot2)
set.seed(99)
source("MyFunctions.R")

#-------------------------
# global variables
antFile <- "antcountydata.csv"
xCol <- 7 # latitudinal center of each county
yCol <- 5 # number of ant species
#-------------------------
# Program Body

# Construct Data Frame
temp_1 <- get_data(file_name = antFile) 

x <- temp_1[,xCol] # extract predictor
y <- temp_1[,yCol] # extract response variable

# fit regression model
temp_2 <- calculate_stuff(x_var=x,y_var=y)

# extract residuals
temp_3 <- summarize_output(temp_2)

graph_results(x_var=x,y_var=y)

print(temp_3) # print residuals

print(temp_2) # print model summary
