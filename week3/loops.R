i <- 3

# iterates at least once
repeat{
    cat("quack!\n")
    i <- i - 1
    if (i == 0) {
        break
    } else {
        next
    }
}

# iterates if the condition is meant
j <- 1
while (j <= 3) {
    cat("quack!\n") # nolint
    j <- j + 1
}

# iterates over the elements of a vector
for (i in 1:10) {
    cat("quack!\n") # nolint
}
