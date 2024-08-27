votes <- read.csv("votes.csv")
View(votes)

# counting the number of votes for each candidate
total <- c()
for (candidate in rownames(votes)) {
    total[candidate] <- sum(votes[candidate, ]) # nolint

    # if I don't want a name but just the sum # nolint
    # total <- c(total, sum(votes[candidate])) # nolint
}

View(total)

# counting the number of votes per column
total2 <- c()
for (method in colnames(votes)) {
    total2[method] <- sum(votes[, method]) # nolint
}

View(total2)

# we could just use the APPLY function to do all the work instead of using loops

# MARGIN = 1 == rows #nolint
total3 <- apply(votes, MARGIN = 1, FUN = sum)
sort(total3, decreasing = TRUE)

# MARGIN = 2 == columns #nolint
total4 <- apply(votes, MARGIN = 2, FUN = sum)
sort(total4, decreasing = TRUE)
