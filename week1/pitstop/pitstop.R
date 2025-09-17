file <- read.csv(readline("Enter a .cvs file: "))

print(nrow(file))
# [1] 28

min(file$time)
# [1] 1.94

max(file$time)
# [1] 11.05

sum(file$time)
# [1] 98.53
