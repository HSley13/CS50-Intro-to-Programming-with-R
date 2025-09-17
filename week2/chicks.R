library(dplyr)

chicks <- read.csv("chicks.csv")
dplyr::glimpse(chicks)
# Rows: 18
# Columns: 3
#    chick      feed weight
# 1      1    casein    368
# 2      2    casein    390
# 3      3    casein    379
# 4      4      fava    179
# 5      5      fava    160
# 6      6      fava    136
# 7      7   linseed     NA
# 8      8   linseed    229
# 9      9   linseed     NA
# 10    10  meatmeal    325
# 11    11  meatmeal     NA
# 12    12  meatmeal     NA
# 13    13   soybean    243
# 14    14   soybean    230
# 15    15   soybean    248
# 16    16 sunflower    423
# 17    17 sunflower    340
# 18    18 sunflower     NA

# View(chicks)

round(mean(chicks$weight, na.rm = TRUE), 2)
# [1] 280.77

casein_chicks <- chicks[c(1:3), ]
#   chick   feed weight
# 1     1 casein    368
# 2     2 casein    390
# 3     3 casein    379

round(mean(casein_chicks$weight), 2)
# [1] 379

# returns the indexes where the feed column has casein
casein_filter <- chicks$feed == "casein"
#  [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE

# return the row of those indexes as a vector
casein_chicks <- chicks[casein_filter, ]
#   chick   feed weight
# 1     1 casein    368
# 2     2 casein    390
# 3     3 casein    379

# return rounded mean value for the weight
round(mean(casein_chicks$weight, na.rm = TRUE), 2)
# [1] 379

which(is.na(chicks$weight))
# [1]  7  9 11 12 18

!is.na(chicks$weight)
#  [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE
# [12] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE

# remove all the NA values in the table according the weight column
# now when calculating the mean, the na.rm won't be needed
chicks <- chicks[!is.na(chicks$weight), ]
#    chick      feed weight
# 1      1    casein    368
# 2      2    casein    390
# 3      3    casein    379
# 4      4      fava    179
# 5      5      fava    160
# 6      6      fava    136
# 8      8   linseed    229
# 10    10  meatmeal    325
# 13    13   soybean    243
# 14    14   soybean    230
# 15    15   soybean    248
# 16    16 sunflower    423
# 17    17 sunflower    340
# View(chicks)

# remove all the NA values in the table according the weight column
chicks <- subset(chicks, !is.na(weight))
#    chick      feed weight
# 1      1    casein    368
# 2      2    casein    390
# 3      3    casein    379
# 4      4      fava    179
# 5      5      fava    160
# 6      6      fava    136
# 8      8   linseed    229
# 10    10  meatmeal    325
# 13    13   soybean    243
# 14    14   soybean    230
# 15    15   soybean    248
# 16    16 sunflower    423
# 17    17 sunflower    340
# View(chicks)

soybean_chicks <- subset(chicks, feed == "soybean")
#    chick    feed weight
# 13    13 soybean    243
# 14    14 soybean    230
# 15    15 soybean    248
# View(soybean_chicks)

# Important to reset the rownames after taking a subset from it
rownames(chicks) <- NULL
# NULL
rownames(chicks)
