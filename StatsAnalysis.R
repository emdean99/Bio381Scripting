# Statistical analysis in R
# 17 January 2021
# EMD
#--------------------------
library(tidyverse)

# data frame construction for regression analysis
n <- 50 # number of observations (rows)

var_A <- runif(n) # random uniform (independent)
var_B <- runif(n) # random uniform (dependent)
var_C <- 5.5 + var_A*10 # a noise linear relationship with var_A

ID <- 1:n

reg_data <- data.frame(ID, var_A, var_B, var_C)
head(reg_data)
str(reg_data)

# regression analysis in R
reg_model <- lm(var_B~var_A, data=reg_data)
print(reg_model)
str(reg_model)
head(reg_model$residuals) # contains residuals

# summary has the elements that we need
summary(reg_model)

z <- unlist(summary(reg_model))

reg_stats <- list(intercept = z$coefficients1, 
                  slope = z$coefficients2, 
                  intercept_p = z$coefficients7,
                  slope_p=z$coefficients8,
                  r2=z$r.squared)
print(reg_stats)
reg_stats$r2
reg_stats[[5]]
reg_stats[5] # no this is just a list item

reg_plot <- ggplot(reg_data) + 
            aes(x=var_A, y=var_B) + 
            geom_point() + 
            stat_smooth(method=lm,se=0.99) # default se = 0.95
print(reg_plot)
ggsave(filename="RegressionPlot.pdf",
       plot=reg_plot,
       device="pdf")


# data frame

n_groups <- 3 # number of treatment groups
n_name <- c('control', 'Treat1', 'Treat2') # names of treatment groups
n_size <- c(12, 17, 9) # sample sizes
n_mean <- c(40, 41, 60) # mean responses
n_sd <- c(5,5,5) # Standard deviation of each group

ID <- 1:sum(n_size) # create unique id

res_var <- c(rnorm(n=n_size[1],mean=n_mean[1], sd=n_sd[1]),
             rnorm(n=n_size[2],mean=n_mean[2], sd=n_sd[2]),
             rnorm(n=n_size[3],mean=n_mean[3], sd=n_sd[3]))
trt_group <- rep(n_name, n_size)
ano_data <- data.frame(ID,trt_group,res_var)
head(ano_data)

# analysis of variance in R 
#(one way so it could be a t test if there were two groups)
ano_model <- aov(res_var~trt_group,data=ano_data)
print(ano_model)
z <- summary(ano_model)
print(z)
flat_out <- unlist(z)
ano_stats <- list(f_ratio <- unlist(z)[7], 
                  f_pval <- unlist(z)[9])
print(ano_stats)

# basic ggplot of anova data
ano_plot <- ggplot(ano_data) + aes(x=trt_group, y=res_var) +
  geom_boxplot()
print(ano_plot)
ggsave(filename='ANOVAPlot.pdf',
       plot=ano_plot,
       device = 'pdf')

ggplot(lreg_data) +
  aes(x=x,y=y) +
  geom_point() +
  stat_smooth(method=glm,
              method.args = list(family=binomial))

# Logistic Regression

# construct data frame for logistic regression
x_var <- sort(rgamma(n=200,shape=5,scale=5))
y_var <- sample(rep(c(1,0),each=100),prob=seq_len(200))
lreg_data <- data.frame(ID=1:200, xVar=x_var, yVar=y_var)
head(lreg_data)

# logistic regression analysis
lreg_model <- glm(yVar ~ xVar, 
                  data=lreg_data,
                  family=binomial(link=logit))
summary(lreg_model)
summary(lreg_model)$coefficients

# logistical regression plot
lreg_plot <- ggplot(lreg_data) +
  aes(x=xVar, y=yVar) +
  geom_point() +
  stat_smooth(method=glm,
              method.args=list(family=binomial))
print(lreg_plot)

# contingency data are counts for different classifications

vec_1 <- c(50,66,22)
vec_2 <- c(120,22,30)
data_matrix <- rbind(vec_1,vec_2)
rownames(data_matrix) <- c('Cold', 'Warm')
colnames(data_matrix) <- c('Species1', 'Species2', 'Species3')
print(data_matrix)

# statistical analysis of contingency data
print(chisq.test(data_matrix))

# plotting contingency data
mosaicplot(x=data_matrix,
           col=c('goldenrod', 'grey', 'black'),
           shade = FALSE)

barplot(height=data_matrix,
        beside=TRUE,
        col=c("cornflowerblue","tomato"))

d_frame <- as.data.frame(data_matrix)
head(d_frame)
d_frae <- cbind(d_frame,list(Treatment=c('Cold','Warm')))
head(d_frae)                 
d_frame <- gather(d_frame,
                  key = Species,
                  Species1:Species3,
                  value=Counts)
head(d_frame)

contingency_graph <- ggplot(d_frame,aes(x=Species, y=Counts, fill=Treatment)) + 
  geom_bar(stat='identity',
           position = 'dodge',
           color = I('black')) +
  scale_fill_manual(values=c('cornflowerblue','tomato'))
           
