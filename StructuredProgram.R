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



# Use CTRL SHIFT R to get the bar
# Getting Input -----------------------------------------------------------
# CODE SNIPPET FUN
my_fun <- function(x=5) {
  z <- 5 + runif(1)
  return(z)
}

my_fun()

# try using m_bar
######################################
# Try using m_sec
# section label ------------------------------
# Load Libraries ------------------------------

# try m_head for set up of a new script
# -----------------------------------
# tells what this new script is about
# 25 Mar 2020
# EMD
# -----------------------------------

# try out cool new function snippet
# -----------------------------------
# FUNCTION trial_funct  
# description: one line explanation here
# inputs: just x=5 for now
# outputs: real number
#####################################
trial_funct  <- function(x=5) {

# Function body

return("Checking...trial_funct  ")

} # end of trial_funct  
# -----------------------------------
trial_funct()

