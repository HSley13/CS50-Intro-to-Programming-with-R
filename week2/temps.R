load("temps.RData")

# returns a vector minus the elements 2, 4, 7 (remove outliers)
temps[-c(2, 4, 7)]

# logical (return true or false)
temps[1] < 0

# returns a vector which has true or false for each element
temps < 0

# returns the index at which the condition is true
which(temps < 0)

# returns the outliers' indexes
which(temps < 0 | temps > 60)

# returns the outliers' value
temps[which(temps < 0 | temps > 60)]

# remove all the outliers
filter <- !(temps < 0 | temps > 60)
temps <- temps[filter]

no_outliers <- temps[!(temps < 0 | temps > 60)]
#  [1] 15 20 33 43 38 26 31 35 14 24 39 28 18 12  5 35 26 44 21  7 14 14 31
# [24] 35  5 16 19 27
outliers <- temps[(temps < 0 | temps > 60)]
# [1] -15 -20  65

save(no_outliers, file = "no_outliers.RData")
save(outliers, file = "outliers.RData")

# returns true if there's any outlier
any(temps < 0 | temps > 60)
# [1] TRUE

# returns true if all of them are outliers
all(temps < 0 | temps > 60)
# [1] FALSE
