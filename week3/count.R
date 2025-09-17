get_votes <- function(prompt = "Enter votes: ") {
    repeat{ 
        votes <- suppressWarnings(as.integer(readline(prompt))) 
        if (!is.na(votes)) {
            return(votes) 
        } 
    } 
}

total <- 0

for (user in c("Mario", "Peach", "Bowser")) {
    votes <- get_votes(paste0(user, ": ")) 
    total <- total + votes
}

cat("Total votes:", total)

matrice0 <- matrix(c(1,2,3,4,5,6,7,8), nrow=4, byrow=TRUE)
colnames(matrice0) <- c("Col 1", "Col 2")
rownames(matrice0) <- c("Row 1", "Row 2", "Row 3", "Row 4")

lm_model <- lm(mpg ~ wt, data = mtcars)
summary(lm_model)

