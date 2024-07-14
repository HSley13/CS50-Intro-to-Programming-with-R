file <- read.csv(readline("Enter a .cvs file: "))

print(nrow(file))

min(file$time)
max(file$time)

sum(file$time)
