chicks <- read.csv("chicks.csv")

View(chicks)

round(mean(chicks$weight, na.rm = TRUE), 2)

casein_chicks <- chicks[c(1:3), ]
round(mean(casein_chicks$weight), 2)

# returns the indexes where the feed column has casein
filter <- chicks$feed == "casein"

# return the row of those indexes as a vector
casein_chicks <- chicks[filter, ]

# return rounded mean value for the weight
round(mean(casein_chicks$weight, na.rm = TRUE), 2)

which(is.na(chicks$weight))

!is.na(chicks$weight)

# remove all the NA values in the table according the weight column
# now when calculating the mean, the na.rm won't be needed
chicks <- chicks[!is.na(chicks$weight), ]
View(chicks)

# remove all the NA values in the table according the weight column
chicks <- subset(chicks, !is.na(weight))
View(chicks)

soybean_chicks <- subset(chicks, feed == "soybean")
View(soybean_chicks)

# Important to reset the rownames after taking a subset from it
rownames(chicks) <- NULL
rownames(chicks)
