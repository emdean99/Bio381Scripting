# Data structure comparisons, and data curation
# 09 March, 2021
# EMD
# -----------------------

# Distinctions between lists and matrices

# Create a matrix and a data frame with the same structure

z_mat <- matrix(data=1:30,ncol=3,byrow=TRUE)
z_dframe <- as.data.frame(z_mat)

str(z_mat) # atomic vector in two dimensions
str(z_dframe) # list with 3 integer values

head(z_dframe) # note automatic variable name
head(z_mat)
colnames(z_mat) <- c('V1','V2','V3')

#element referencing is the same in both
z_mat[3,3]
z_dframe[3,3]

# so is row referencing
z_mat[3,]
z_dframe[3,]

# column numbers also same
z_mat[,3]
z_dframe[,3]

# One difference when calling by names
z_mat[,'V3']
z_dframe[,'V3']
z_dframe$V3

# What happens if we reference one 1 dimension?
z_mat[3] # gives third element
z_dframe[3] # selects third column
