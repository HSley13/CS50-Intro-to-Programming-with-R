Mario <- as.integer(readline("Enter Mario's vote: "))
Peach <- as.integer(readline("Enter Peach's vote: "))
Bowser <- as.integer(readline("Enter Bowser's vote: "))

total <- sum(Mario, Peach, Bowser)

print(paste("Total votes:", total))
