Q1 <- read.csv("Q1.csv") # nolint
Q1$quarter <- "Q1" # nolint

Q2 <- read.csv("Q2.csv") # nolint
Q2$quarter <- "Q2" # nolint

Q3 <- read.csv("Q3.csv") # nolint
Q3$quarter <- "Q3" # nolint

Q4 <- read.csv("Q4.csv") # nolint
Q4$quarter <- "Q4" # nolint


# The rbind() function works only if the data frames have the same (name and number) of columns #nolint
sales <- rbind(Q1, Q2, Q3, Q4)

sales$value <- ifelse(sales$sale_amount > 100, "Hight Value", "Regular")

View(sales)
