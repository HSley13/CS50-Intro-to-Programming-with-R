books <- read.csv("books.csv")
View(books)

authors <- read.csv("authors.csv")
View(authors)

writer_book <- subset(books, author == "Mia Morgan")
writer_answers <- paste("The Writer is looking for:", writer_book$title)

musician_book <- subset(books, (year == 1613) & (topic == "Music"))
musician_answers <- paste("The Musician is looking for:", musician_book$title) # nolint

traveler_book <- subset(books, (author == "Lysandra Silverleaf" | author == "Elena Petrova") & (year == 1775)) # nolint
traveler_answers <- paste("The Traveler is looking for:", traveler_book$title) # nolint

painter_book <- subset(books, pages > 200 & pages < 300 & (year == 1990 | year == 1992)) # nolint
painter_answers <- paste("The Painter is looking for:", painter_book$title) # nolint

scientist_book <- subset(books, grepl("Quantum Mechanics", title))
scientist_answer <- paste("The Scientist is looking for:", scientist_book$title)

author_filter <- subset(authors, hometown == "Zenthia")
teacher_book <- subset(books, (author %in% author_filter$author) & (topic == "Education") & (year >= 1770 & year <= 1780)) # nolint
teacher_answer <- paste("The Teacher is looking for:", teacher_book$title)

answers <- paste(writer_answers, musician_answers, traveler_answers, painter_answers, scientist_answer, teacher_answer, sep = "\n") # nolint
writeLines(answers, "answers.txt")
