Mario <- as.integer(readline("Enter Votes for Mario: "))
Peach <- as.integer(readline("Enter Votes for Peach: "))
Bowser <- as.integer(readline("Enter Votes for Bowser: "))

total <- sum(Mario, Peach, Bowser)

print(paste("Total votes:", total))