students <- utils::read.csv("students.csv")
#    student attribute            value
# 1    Mario     major       Statistics
# 2    Mario       GPA              3.5
# 3    Peach     major Computer Science
# 4    Peach       GPA                4
# 5   Bowser     major     Data Science
# 6   Bowser       GPA              3.7
# 7    Daisy     major     Data Science
# 8    Daisy       GPA              3.9
# 9    Luigi     major Computer Science
# 10   Luigi       GPA              3.0
# 11  Nabbit     major       Statistics
# 12  Nabbit       GPA              2.5
vd(students)


students <- tidyr::pivot_wider(students, id_cols = student, names_from = attribute, values_from = value) # nolint
# # A tibble: 6 × 3
#   student major            GPA
#   <chr>   <chr>            <chr>
# 1 Mario   Statistics       3.5
# 2 Peach   Computer Science 4
# 3 Bowser  Data Science     3.7
# 4 Daisy   Data Science     3.9
# 5 Luigi   Computer Science 3.0
# 6 Nabbit  Statistics       2.5
vd(students)

students$GPA <- as.numeric(students$GPA)
# [1] 3.5 4.0 3.7 3.9 3.0 2.5

students <- students |>
  dplyr::group_by(major) |> # nolint
  dplyr::summarize(GPA = mean(GPA))
# # A tibble: 3 × 2
#   major              GPA
#   <chr>            <dbl>
# 1 Computer Science   3.5
# 2 Data Science       3.8
# 3 Statistics         3
