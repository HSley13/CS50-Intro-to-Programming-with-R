votes <- read.table(
    "votes.csv", 
    header = TRUE,
    sep = ","
) 

# or just use
# votes <- read.csv("votes.csv") 
#   candidate poll mail
# 1     Mario   37   63
# 2     Peach   43  107
# 3    Bowser   84   36

# view the cvs file as a table
View(votes)

# it returns a vector of which single can be accessed using [] notation
votes$poll
# [1] 37 43 84

# its first element
votes$poll[1]
# [1] 37


sum(votes$poll)
# [1] 164

sum(votes$mail)
# [1] 206

# sum of the sum of the vectors
sum(votes$poll, votes$mail)
# [1] 370

# sum of the vectors, element wise
votes$total <- votes$mail + votes$poll
# [1] 100 150 120

rownames(votes)
# [1] "1" "2" "3"

colnames(votes)
# [1] "candidate" "poll"      "mail"      "total"    

write.csv(votes, "total.csv", row.names = FALSE)
