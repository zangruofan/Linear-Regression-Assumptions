salary <- read.table("https://data.princeton.edu/wws509/datasets/salary.dat", 
                     header = TRUE)
salary <- na.omit(salary)
salary$sx <- as.factor(salary$sx)
salary$rk <- as.factor(salary$rk)
salary$dg <- as.factor(salary$dg)

set.seed(123)
train_ = sample(1:nrow(salary), size = 0.8*nrow(salary))
test_ = (-train_)
train_data <- salary[train_,]
test_data <- salary[test_,]

linear.model <- lm(sl~., data = train_data)

# The assumptions for linear regression are:
# Linearity: There must be a linear relationship between the outcome variable and the independent variables.
# Homoscedasticity: The variance of residual is the same for any value of X.
# Independence: Observations are independent of each other.
# Normality: For any fixed value of X, Y is normally distributed.

par(mfrow = c(2,2))
plot(linear.model, which = 1:4)

# The first plot depicts residuals versus fitted values. 
# It is useful for checking the assumption of linearity and homoscedasticity. 
# To assess the assumption of linearity we want to ensure that the residuals are not too far away from 0. 
# In other words, the red line should be fairly flat. 

# To assess the assumption of homoscedasticity we need to make sure that there is no pattern in the residuals 
# and that they are equally spread around the y = 0 line. 
# So, in our model, we consider that the assumptions of linearity and homoscedasticity hold.

# The normality assumption is evaluated using a QQ-plot by comparing the residuals to "ideal" normal observations. 
# Observations line well along the 45-degree line in the QQ-plot, so we may assume that normality holds here.

# The third plot is a scale-location plot, which is useful for checking the assumption of homoscedasticity. 
# In this plot we are checking to see if there is a pattern in the residuals. 
# So, in our model, we consider that the assumptions of homoscedasticity hold.

# The assumption of independence cannot be tested with diagnostic plots. 
# It is an assumption that we can only test by examining the study design.
