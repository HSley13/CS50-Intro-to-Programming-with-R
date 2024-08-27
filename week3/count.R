get_votes <- function(prompt = "Enter votes: ") {
    repeat{ # nolint
        votes <- suppressWarnings(as.integer(readline(prompt))) # nolint
        if (!is.na(votes)) {
            return(votes) # nolint
        } # nolint
    } # nolint
}

total <- 0

for (user in c("Mario", "Peach", "Bowser")) {
    votes <- get_votes(paste0(user, ": ")) # nolint
    total <- total + votes
}

cat("Total votes:", total)
