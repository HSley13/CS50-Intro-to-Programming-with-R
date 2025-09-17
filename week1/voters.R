url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/non-voters/nonvoters_data.csv" # nolint
voters <- read.csv(url)
# View(voters)

# output the number of rows and columns respectively
nrow(voters)
# [1] 5836

ncol(voters)
# [1] 119

# rownames(voters)
# colnames(voters)

# output all the category a voter can be
voters$voter_category

# output the different unique value a voter can be
unique(voters$voter_category)
# [1] "always"       "sporadic"     "rarely/never"

voters$Q22
unique(voters$Q22)
# [1] NA  7  6  2 -1  1  4  5  3

voters$Q21
unique(voters$Q21)
# [1]  1  2  3 -1

# like unique but better and ordered
factor(
    voters$Q21, 
    levels = c(1, 2, 3),
    labels = c("YES", "NO", "UNSURE/UNDECIDED"),
    exclude = c(-1)
)
