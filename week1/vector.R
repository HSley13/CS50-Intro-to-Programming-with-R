# Simple vector creation
words <- c("It's", "a", "Beautiful", "day")
# [1] "It's"      "a"         "Beautiful" "day"      

# Vector Repetition
rep(words, times = 2)
# [1] "It's"      "a"         "Beautiful" "day"       "It's"     
# [6] "a"         "Beautiful" "day"      

# Vector element repetition
rep(words, each = 3)
#  [1] "It's"      "It's"      "It's"      "a"         "a"        
#  [6] "a"         "Beautiful" "Beautiful" "Beautiful" "day"      
# [11] "day"       "day"      

# from 1 to 10 ascending order
numbers <- 1:10
#  [1]  1  2  3  4  5  6  7  8  9 10

# sequence in the format u want
seq(from = 10, to = 1)
#  [1] 10  9  8  7  6  5  4  3  2  1

# increasing by 2
seq(from = 1, to = 10, by = 2)
# [1] 1 3 5 7 9

# sequence of 3 element which are evenly spaced together
seq(from = 1, to = 10, length.out = 3)
# [1]  1.0  5.5 10.0
