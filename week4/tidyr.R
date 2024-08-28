students <- utils::read.csv("students.csv")
utils::View(students)

students <- tidyr::pivot_wider(students, id_cols = student, names_from = attribute, values_from = value) # nolint
utils::View(students)

students$GPA <- as.numeric(students$GPA)

students |>
    dplyr::group_by(major) |> # nolint
    dplyr::summarize(GPA = mean(GPA))
