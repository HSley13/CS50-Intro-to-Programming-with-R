# or just use read.csv, then remove the sep and header arguments
votes <- read.table(
              "votes.csv",
              sep = ",",
              header = TRUEm
              )

# view the cvs file as a table
View(votes)

# it returns a vector of which single can be accessed using [] notation
votes$poll

# its first element 
votes$poll[1]

sum(votes$poll)
sum(votes$mail)

votes$total <- votes$mail + votes$poll

rownames(votes)
colnames(votes)

write.csv(votes, "totol.csv", row.names = FALSE)
