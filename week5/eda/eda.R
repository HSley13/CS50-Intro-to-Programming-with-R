file <- utils::read.csv("cs_students.csv")
utils::View(file)

#------------------------------------------------- Data Description ---------------------------------------------------------- #nolint
# table <- base::data.frame(
#     row.names = c(Age, GPA, Python, SQL, Java),

# )

#------------------------------------------------- Gender distribution ---------------------------------------------------------- #nolint
gender_count <- file |>
    dplyr::group_by(Gender) |> # nolint
    dplyr::summarize(count = dplyr::n())

gender_count_plot <- ggplot2::ggplot(gender_count, aes(x = Gender, y = count)) +
    ggplot2::geom_col(aes(fill = Gender)) + # nolint
    ggplot2::scale_fill_viridis_d("Gender") +
    ggplot2::labs(x = "Gender", y = "count", title = "Gender distribution") +
    ggplot2::theme_bw()

ggplot2::ggsave("Gender_distribution.png", plot = gender_count_plot, width = 1200, height = 900, units = "px") # nolint

#------------------------------------------------- GPA distribution ---------------------------------------------------------- #nolint
gpa_count <- file |>
    dplyr::group_by(GPA) |> # nolint
    dplyr::summarize(count = dplyr::n())

gpa_count_plot <- ggplot2::ggplot(gpa_count, aes(x = GPA, y = count)) +
    ggplot2::geom_col(aes(fill = GPA)) + # nolint
    ggplot2::scale_fill_viridis_c("GPA") +
    ggplot2::labs(x = "GPA", y = "count", title = "GPA distribution") +
    ggplot2::theme_bw()

ggplot2::ggsave("GPA_distribution.png", plot = gpa_count_plot, width = 1200, height = 900, units = "px") # nolint

#------------------------------------------------- Interested Domain ---------------------------------------------------------- #nolint
domain_count <- file |>
    dplyr::group_by(Interested.Domain) |> # nolint
    dplyr::summarize(count = dplyr::n())

domain_count_plot <- ggplot2::ggplot(domain_count, aes(x = stats::reorder(Interested.Domain, -count), y = count)) + # nolint
    ggplot2::geom_col(aes(fill = Interested.Domain), show.legend = FALSE) + # nolint
    ggplot2::scale_fill_viridis_d("Interested.Domain") +
    ggplot2::labs(x = "Interested Domain", y = "count", title = "Interested Domain") + # nolint
    ggplot2::theme_bw() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)) # nolint

ggplot2::ggsave("Interested_Domain.png", plot = domain_count_plot, width = 2000, height = 1500, units = "px") # nolint

#------------------------------------------------- Project distribution ---------------------------------------------------------- #nolint
project_count <- file |>
    dplyr::group_by(Projects) |> # nolint
    dplyr::summarize(count = dplyr::n())

projects_count_plot <- ggplot2::ggplot(project_count, aes(x = stats::reorder(Projects, -count), y = count)) + # nolint
    ggplot2::geom_col(aes(fill = Projects), show.legend = FALSE) + # nolint
    ggplot2::scale_fill_viridis_d("Projects") +
    ggplot2::labs(x = "Projects", y = "count", title = "Projects") + # nolint
    ggplot2::theme_bw() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)) # nolint

ggplot2::ggsave("Projects.png", plot = projects_count_plot, width = 3000, height = 1500, units = "px") # nolint

#------------------------------------------------- Career distribution ---------------------------------------------------------- #nolint
career_count <- file |>
    dplyr::group_by(Future.Career) |> # nolint
    dplyr::summarize(count = dplyr::n())

career_count_plot <- ggplot2::ggplot(career_count, aes(x = stats::reorder(Future.Career, -count), y = count)) + # nolint
    ggplot2::geom_col(aes(fill = Future.Career), show.legend = FALSE) + # nolint
    ggplot2::scale_fill_viridis_d("Future.Career") +
    ggplot2::labs(x = "Future Career", y = "count", title = "Future Career") + # nolint
    ggplot2::theme_bw() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1)) # nolint

ggplot2::ggsave("career.png", plot = career_count_plot, width = 3000, height = 1500, units = "px") # nolint

#------------------------------------------------- Programming Skills distribution ---------------------------------------------------------- #nolint
languages <- data.frame(
    Language = c("Python", "SQL", "Java"), # nolint
    Strong = c(sum(file$Python == "Strong"), sum(file$SQL == "Strong"), sum(file$Java == "Strong")), # nolint
    Average = c(sum(file$Python == "Average"), sum(file$SQL == "Average"), sum(file$Java == "Average")), # nolint
    Weak = c(sum(file$Python == "Weak"), sum(file$SQL == "Weak"), sum(file$Java == "Weak")) # nolint
) # nolint

languages_long <- tidyr::pivot_longer(languages, cols = Strong:Weak, names_to = "Skill", values_to = "Count") # nolint

languages_plot <- ggplot2::ggplot(languages_long, aes(x = Language, y = Count, fill = Skill)) + # nolint
    ggplot2::geom_col(position = "dodge") + # nolint
    ggplot2::labs(x = "Language", y = "Count", title = "Skill Levels by Programming Language") + # nolint
    ggplot2::theme_bw()

ggplot2::ggsave("languages.png", plot = languages_plot, width = 3000, height = 1500, units = "px") # nolint

#------------------------------------------------- Correlation of Gender and Skills ---------------------------------------------------------- #nolint

GenderSkills <- data.frame( # nolint
    Gender = c("Male", "Male", "Male", "Female", "Female", "Female"), # nolint
    SkillLevel = c("Strong", "Average", "Weak", "Strong", "Average", "Weak"), # nolint
    Python = c(
        sum(file$Gender == "Male" & file$Python == "Strong"), # nolint
        sum(file$Gender == "Male" & file$Python == "Average"),
        sum(file$Gender == "Male" & file$Python == "Weak"),
        sum(file$Gender == "Female" & file$Python == "Strong"),
        sum(file$Gender == "Female" & file$Python == "Average"),
        sum(file$Gender == "Female" & file$Python == "Weak")
    ), # nolint
    SQL = c(
        sum(file$Gender == "Male" & file$SQL == "Strong"), # nolint
        sum(file$Gender == "Male" & file$SQL == "Average"),
        sum(file$Gender == "Male" & file$SQL == "Weak"),
        sum(file$Gender == "Female" & file$SQL == "Strong"),
        sum(file$Gender == "Female" & file$SQL == "Average"),
        sum(file$Gender == "Female" & file$SQL == "Weak")
    ), # nolint
    Java = c(
        sum(file$Gender == "Male" & file$Java == "Strong"), # nolint
        sum(file$Gender == "Male" & file$Java == "Average"),
        sum(file$Gender == "Male" & file$Java == "Weak"),
        sum(file$Gender == "Female" & file$Java == "Strong"),
        sum(file$Gender == "Female" & file$Java == "Average"),
        sum(file$Gender == "Female" & file$Java == "Weak")
    ) # nolint
)

GenderSkills_long <- tidyr::pivot_longer(GenderSkills, cols = Python:Java, names_to = "languages", values_to = "Count") # nolint

GenderSkills_plot <- ggplot2::ggplot(GenderSkills_long, aes(x = Gender, y = Count, fill = languages)) + # nolint
    ggplot2::geom_col(position = "dodge") + # nolint
    ggplot2::labs(x = "Gender", y = "Count", title = "Skill Levels by Gender") + # nolint
    ggplot2::theme_bw()

ggplot2::ggsave("GenderSkills.png", plot = GenderSkills_plot, width = 3000, height = 2000, units = "px") # nolint
