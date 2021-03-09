# Lecture 10
# March 9th
# EMD
#_____________________________________

#create an atomic vector with missing values

z <- c(10,20,NA,NA,50)
complete.cases(z) # gives boolean vector
z[complete.cases(z)] # sweep out NA values
which(!complete.cases(z))

# sweeping out rows with missing values in a matrix
m <- matrix(1:20,nrow=5) #good idea to make the matrix not a square
m
m[1,1] <- NA
m[5,4] <- NA
m

# eliminate rows with missing values
m[complete.cases(m),]

m[complete.cases(m[,c(1,2)]) , ] # drop row 1
m[complete.cases(m[,c(2,3)]) , ] # no drops
m[complete.cases(m[,c(3,4)]) , ] # drops row 5
m[complete.cases(m[,c(1,4)]) , ] # drops rows 1 and 5

# Subsetting Matrices and data frames

m <- matrix(data=1:12, nrow=3)
dimnames(m) <- list(paste('Species',LETTERS[1:nrow(m)],sep=''),
                    paste('Site', 1:ncol(m),sep=''))
m

# Subet based on elements
m[1:2,3:4]
m[c('SpeciesA','SpeciesB'),c('Site1','Site2')]

m[1:2,]
m[,2:4]

# use logicals for more complex subsetting
colSums(m) > 15
m[,colSums(m) > 15]

# select all rows for which row total is 22
m[rowSums(m)==22,]

# select for not relation
m[!rowSums(m)==22,]

# choose all rows for which number for site 1 < 3
# and choose all columns for which number of species 
# A < 5

m[, 'Site1'] < 3
m[m[, 'Site1']<3,]

# Set up logical for columns
m['SpeciesA',] < 5
m[m['SpeciesA',] < 5]