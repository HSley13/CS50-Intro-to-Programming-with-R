url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/non-voters/nonvoters_data.csv"

voters <- read.csv(url)
View(voters)

# output the number of rows and columns respectively
nrow(voters)
ncol(voters)

# output all the category a voter can be
voters$voter_category

#output the different unique value a voter can be
unique(voters$voter_category)

voters$Q22
unique(voters$Q22)

voters$Q21
unique(voters$Q21)

# like unique but better and ordered
factor(
  voters$Q21,
  labels = c("YES", "NO", "UNSURE/UNDECIDED"),
  exclude = c(-1)
  )
