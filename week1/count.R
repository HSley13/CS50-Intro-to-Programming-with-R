Mario <- as.integer(readline("Enter Votes for Mario: ")) # nolint
Peach <- as.integer(readline("Enter Votes for Peach: ")) # nolint
Bowser <- as.integer(readline("Enter Votes for Bowser: ")) # nolint

total <- sum(Mario, Peach, Bowser)

print(paste("Total votes:", total))
