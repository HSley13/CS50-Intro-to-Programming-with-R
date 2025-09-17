votes <- read.csv("votes.csv")
#        poll mail
# Mario    37   63
# Peach    43  107
# Bowser   84   36
dplyr::glimpse(votes)
# View(votes)

# counting the number of votes for each candidate
total <- c()
for (candidate in rownames(votes)) {
    total[candidate] <- sum(votes[candidate, ]) 

    # if I don't want a name but just the sum 
    # total <- c(total, sum(votes[candidate])) 
}

# View(total)

# counting the number of votes per column
total2 <- c()
for (method in colnames(votes)) {
    total2[method] <- sum(votes[, method]) 
}

# View(total2)
# we could just use the APPLY function to do all the work instead of using loops

# MARGIN = 1 == rows 
total3 <- apply(votes, MARGIN = 1, FUN = sum)
#  Mario  Peach Bowser 
#    100    150    120 
sort(total3, decreasing = TRUE)
#  Peach Bowser  Mario 
#    150    120    100 

# MARGIN = 2 == columns 
total4 <- apply(votes, MARGIN = 2, FUN = sum)
# poll mail 
#  164  206 
sort(total4, decreasing = TRUE)
# mail poll 
#  206  164 
