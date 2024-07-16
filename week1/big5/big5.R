file <- read.table(
    "tests.tsv",
    sep = "\t",
    header = TRUE,
    
)

file$gender <- factor(
    file$gender,
    levels = c(0, 1, 2, 3),
    labels = c("Unanswered", "Male", "Female", "Other")
)

file$extroversion <- round((rowSums(file[, c("E1", "E2", "E3")], na.rm = TRUE) / 15), 2)

file$neuroticism <- round((rowSums(file[, c("N1", "N2", "N3")], na.rm = TRUE) / 15), 2)

file$agreeableness <- round((rowSums(file[, c("A1", "A2", "A3")], na.rm = TRUE) / 15), 2)

file$conscientiousness <- round((rowSums(file[, c("C1", "C2", "C3")], na.rm = TRUE) / 15), 2)

file$openness <- round((rowSums(file[, c("O1", "O2", "O3")], na.rm = TRUE) / 15), 2)

write.csv(file, "analysis.csv", row.names = FALSE)