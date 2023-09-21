# Chapter - 3 Data Exploration and Visualization
install.packages(c("GGally", "ggmap", "mosaic", "treemap"))
summary(housing.df$INDUS) # Now we have 10 NA's

# replace dataFrame with your data.
# is.na() returns a Boolean (TRUE/FALSE) output indicating the location of missing
# values. 
# multiplying the Boolean value by 1 converts the output into binary (0/1).
# heatmap(1 * is.na(dataFrame), Rowv = NA, Colv = NA)

heatmap(1 * is.na(housing.df), Rowv = NA, Colv = NA)
housing.df<-na.omit(housing.df)

# ------------------validated ----------------------------------
