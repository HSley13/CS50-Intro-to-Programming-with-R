file <- read.table("tests.tsv", header = TRUE, sep = "\t")

file$gender <- factor(file$gender, levels = c(0, 1, 2, 3), labels = c("Unanswered", "Male", "Female", "Other")) # nolint

file$extroversion <- round((rowSums(file[, c("E1", "E2", "E3")], na.rm = TRUE) / 15), 2) # nolint

file$neuroticism <- round((rowSums(file[, c("N1", "N2", "N3")], na.rm = TRUE) / 15), 2) # nolint

file$agreeableness <- round((rowSums(file[, c("A1", "A2", "A3")], na.rm = TRUE) / 15), 2) # nolint

file$conscientiousness <- round((rowSums(file[, c("C1", "C2", "C3")], na.rm = TRUE) / 15), 2) # nolint

file$openness <- round((rowSums(file[, c("O1", "O2", "O3")], na.rm = TRUE) / 15), 2) # nolint

write.csv(file, "analysis.csv", row.names = FALSE)
