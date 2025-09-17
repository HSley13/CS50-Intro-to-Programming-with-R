names <- c("Alice", "Bob", "Charlie")

ages <- c(19, 45, 31)

people <- list(names, ages)

# View(people)

# accessing a single element  within the elements'list
people[[1]][1]
# [1] "Alice"
people[[1]][2]
# [1] "Bob"

people[[2]][1]
# [1] 19
people[[2]][2]
# [1] 45

# assigning names to our elements array
names(people) <- c("names", "ages")
# [1] "names" "ages"

people$names[1]

df <- data.frame(people)

# or just this
df <- data.frame(
  names = c("Alice", "Bob", "Charlie"),
  ages = c(19, 45, 31)
)

# View(df)
