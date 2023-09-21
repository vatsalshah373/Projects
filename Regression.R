# Data Partitioning
set.seed(1)

# -------------------------------------------------------------
## 1. Partitioning into training (60%) and validation (40%)
# randomly sample 60% of the row IDs for training; the remaining 40% serve as validation
# Note that dim(housing.df)[1] will give the number of rows in the dataset

train.rows <- sample(row.names(housing.df), dim(housing.df)[1]*0.6) 
train.data <- housing.df[train.rows,] 
dim(train.data)

# assign row IDs that are not already in the training set, into validation

valid.rows <- setdiff(rownames(housing.df), train.rows)
valid.data <- housing.df[valid.rows,]


# Regression

##Table 2.11 - Fit regression model on training data
reg <- lm(MEDV ~ ., data = housing.df, subset = train.rows) # removed Tax variable
tr.res <- data.frame(train.data$MEDV, reg$fitted.values, reg$residuals)
head(tr.res)

pred <- predict(reg, newdata = valid.data)
vl.res <- data.frame(valid.data$MEDV, pred, residuals = valid.data$MEDV - pred)
head(vl.res)
