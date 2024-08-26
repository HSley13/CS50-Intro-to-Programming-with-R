# or just use read.csv, then remove the sep and header arguments
votes <- read.table(
    "votes.csv", # nolint
    header = TRUE,
    sep = ","
) # nolint: indentation_linter.

# or just using
# votes <- read.csv("votes.csv") # nolint

# view the cvs file as a table
View(votes)

# it returns a vector of which single can be accessed using [] notation
votes$poll

# its first element
votes$poll[1]

sum(votes$poll)
sum(votes$mail)

# sum of the sum of the vectors
sum(votes$poll, votes$mail)

# sum of the vectors element wise
votes$total <- votes$mail + votes$poll

rownames(votes)
colnames(votes)

write.csv(votes, "total.csv", row.names = FALSE)
