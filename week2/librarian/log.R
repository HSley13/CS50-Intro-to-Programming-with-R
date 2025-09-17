books <- read.csv("books.csv")
# View(books)

authors <- read.csv("authors.csv")
# View(authors)

writer_book <- subset(books, author == "Mia Morgan")
#                            title     author   topic year pages
# 36 Creating Memorable Characters Mia Morgan Writing 1802   492
writer_answers <- paste("The Writer is looking for:", writer_book$title)
# [1] "The Writer is looking for: Creating Memorable Characters"

musician_book <- subset(books, (year == 1613) & (topic == "Music"))
#                                       title    author topic year pages
# 296 The Evolution of Electronic Instruments Leo Green Music 1613   225
musician_answers <- paste("The Musician is looking for:", musician_book$title) 
# [1] "The Musician is looking for: The Evolution of Electronic Instruments"

traveler_book <- subset(books, (author == "Lysandra Silverleaf" | author == "Elena Petrova") & (year == 1775)) 
#              title              author  topic year pages
# 57 Forbidden Magic Lysandra Silverleaf Arcana 1775   382
traveler_answers <- paste("The Traveler is looking for:", traveler_book$title) 
# [1] "The Traveler is looking for: Forbidden Magic"

painter_book <- subset(books, pages > 200 & pages < 300 & (year == 1990 | year == 1992)) 
#                        title        author topic year pages
# 15 Artistry in Ancient Times Liam Peterson   Art 1992   268
painter_answers <- paste("The Painter is looking for:", painter_book$title) 
# [1] "The Painter is looking for: Artistry in Ancient Times"

scientist_book <- subset(books, grepl("Quantum Mechanics", title))
#                              title        author   topic year pages
# 97 Quantum Mechanics for Beginners Olivia Parker Science 1359   478
#                              title        author   topic year pages
# 97 Quantum Mechanics for Beginners Olivia Parker Science 1359   478
scientist_answer <- paste("The Scientist is looking for:", scientist_book$title)
# [1] "The Scientist is looking for: Quantum Mechanics for Beginners"

author_filter <- subset(authors, hometown == "Zenthia")
#          author hometown
# 142 Jack Parker  Zenthia
# 161  Kenji Sato  Zenthia
teacher_book <- subset(books, (author %in% author_filter$author) & (topic == "Education") & (year >= 1770 & year <= 1780)) 
#                         title      author     topic year pages
# 542 The Timeline of Education Jack Parker Education 1780   216
teacher_answer <- paste("The Teacher is looking for:", teacher_book$title)
# [1] "The Teacher is looking for: The Timeline of Education"

answers <- paste(writer_answers, musician_answers, traveler_answers, painter_answers, scientist_answer, teacher_answer, sep = "\n") 
# [1] "The Writer is looking for: Creating Memorable Characters\nThe Musician is looking for: The Evolution of Electronic Instruments\nThe Traveler is looking for: Forbidden Magic\nThe Painter is looking for: Artistry in Ancient Times\nThe Scientist is looking for: Quantum Mechanics for Beginners\nThe Teacher is looking for: The Timeline of Education"
writeLines(answers, "answers.txt")
