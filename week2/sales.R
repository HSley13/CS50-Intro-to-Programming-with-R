Q1 <- read.csv("Q1.csv") 
Q1$quarter <- "Q1" 
dplyr::glimpse(Q1)

Q2 <- read.csv("Q2.csv") 
Q2$quarter <- "Q2" 
dplyr::glimpse(Q2)

Q3 <- read.csv("Q3.csv") 
Q3$quarter <- "Q3" 
dplyr::glimpse(Q3)

Q4 <- read.csv("Q4.csv") 
Q4$quarter <- "Q4" 
dplyr::glimpse(Q4)

# The rbind() function works only if the data frames have the same (name and number) of columns #nolint
sales <- rbind(Q1, Q2, Q3, Q4)
dplyr::glimpse(sales)

sales$value <- ifelse(sales$sale_amount > 100, "Hight Value", "Regular")
dplyr::glimpse(sales)

# View(sales)
