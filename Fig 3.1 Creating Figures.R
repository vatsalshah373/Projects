# Chapter - 3 Data Exploration and Visualization
install.packages(c("GGally", "ggmap", "mosaic", "treemap"))
housing.df <- read.csv("BostonHousing.csv")
head(housing.df, 9)
## scatter plot with axes names
plot(housing.df$MEDV ~ housing.df$LSTAT, xlab = "MEDV", ylab = "LSTAT")

# alternative plot with ggplot
library(ggplot2)
ggplot(housing.df) + geom_point(aes(x = LSTAT, y = MEDV), colour = "navy", alpha = 0.7)

## barchart of CHAS vs. mean MEDV
# compute mean MEDV per CHAS = (0, 1)
data.for.plot <- aggregate(housing.df$MEDV, by = list(housing.df$CHAS), FUN = mean)
names(data.for.plot) <- c("CHAS", "MeanMEDV")
barplot(data.for.plot$MeanMEDV,  names.arg = data.for.plot$CHAS, 
        xlab = "CHAS", ylab = "Avg. MEDV")

# alternative plot with ggplot
ggplot(data.for.plot) + geom_bar(aes(x = CHAS, y = MeanMEDV), stat = "identity") 

## barchart of CHAS vs. % CAT.MEDV
data.for.plot <- aggregate(housing.df$CAT..MEDV, by = list(housing.df$CHAS), FUN = mean)
names(data.for.plot) <- c("CHAS", "MeanCATMEDV")
barplot(data.for.plot$MeanCATMEDV * 100,  names.arg = data.for.plot$CHAS, 
        xlab = "CHAS", ylab = "% of CAT.MEDV")

# alternative plot with ggplot
ggplot(data.for.plot) + geom_bar(aes(x = as.factor(CHAS), y = MeanCATMEDV), stat = "identity")

# End of Fig. 3.1

