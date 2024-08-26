spacecraft <- data.frame(
    row.names = c("Voyager 1", "Voyager 2", "Pioneer 10"), # nolint
    distance = c(163, 136, 80),
    type = c("Probe 1", "Probe 2", "Probe 3")
)

View(spacecraft)

spacecraft$name
spacecraft$distance

# Subset 1 of the Data frame
spacecraft[1]

# Col vector 1
spacecraft[[1]]
spacecraft[, 1]

# Row vector 1
spacecraft[1, ]
