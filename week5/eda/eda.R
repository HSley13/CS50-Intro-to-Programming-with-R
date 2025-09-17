library(ggplot2)
library(dplyr)
library(tidyr)
library(utils)
library(stats)
#------------------------------------------------- Data Loading ---------------------------------------------------------- #nolint
file <- utils::read.csv("cs_students.csv")
vd(file)

#------------------------------------------------- Gender distribution ---------------------------------------------------------- #nolint
gender_count <- file |>
  dplyr::group_by(Gender) |>
  dplyr::summarize(count = dplyr::n())

gender_count_plot <- ggplot2::ggplot(gender_count, ggplot2::aes(x = Gender, y = count)) +
  ggplot2::geom_col(ggplot2::aes(fill = Gender)) +
  ggplot2::scale_fill_viridis_d("Gender") +
  ggplot2::labs(x = "Gender", y = "count", title = "Gender distribution") +
  ggplot2::theme_bw()
gender_count_plot

ggplot2::ggsave("Gender_distribution.png", plot = gender_count_plot, width = 1200, height = 900, units = "px")

#------------------------------------------------- GPA distribution ---------------------------------------------------------- #nolint
gpa_count <- file |>
  dplyr::group_by(GPA) |>
  dplyr::summarize(count = dplyr::n())

gpa_count_plot <- ggplot2::ggplot(gpa_count, ggplot2::aes(x = GPA, y = count)) +
  ggplot2::geom_col(ggplot2::aes(fill = GPA)) +
  ggplot2::scale_fill_viridis_c("GPA") +
  ggplot2::labs(x = "GPA", y = "count", title = "GPA distribution") +
  ggplot2::theme_bw()

ggplot2::ggsave("GPA_distribution.png", plot = gpa_count_plot, width = 1200, height = 900, units = "px")

#------------------------------------------------- Interested Domain ---------------------------------------------------------- #nolint
domain_count <- file |>
  dplyr::group_by(Interested.Domain) |>
  dplyr::summarize(count = dplyr::n())

domain_count_plot <- ggplot2::ggplot(domain_count, ggplot2::aes(x = stats::reorder(Interested.Domain, -count), y = count)) +
  ggplot2::geom_col(ggplot2::aes(fill = Interested.Domain), show.legend = FALSE) +
  ggplot2::scale_fill_viridis_d("Interested.Domain") +
  ggplot2::labs(x = "Interested Domain", y = "count", title = "Interested Domain") +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1))

ggplot2::ggsave("Interested_Domain.png", plot = domain_count_plot, width = 2000, height = 1500, units = "px")

#------------------------------------------------- Project distribution ---------------------------------------------------------- #nolint
project_count <- file |>
  dplyr::group_by(Projects) |>
  dplyr::summarize(count = dplyr::n())

projects_count_plot <- ggplot2::ggplot(project_count, ggplot2::aes(x = stats::reorder(Projects, -count), y = count)) +
  ggplot2::geom_col(ggplot2::aes(fill = Projects), show.legend = FALSE) +
  ggplot2::scale_fill_viridis_d("Projects") +
  ggplot2::labs(x = "Projects", y = "count", title = "Projects") +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1))

ggplot2::ggsave("Projects.png", plot = projects_count_plot, width = 3000, height = 1500, units = "px")

#------------------------------------------------- Career distribution ---------------------------------------------------------- #nolint
career_count <- file |>
  dplyr::group_by(Future.Career) |>
  dplyr::summarize(count = dplyr::n())

career_count_plot <- ggplot2::ggplot(career_count, ggplot2::aes(x = stats::reorder(Future.Career, -count), y = count)) +
  ggplot2::geom_col(ggplot2::aes(fill = Future.Career), show.legend = FALSE) +
  ggplot2::scale_fill_viridis_d("Future.Career") +
  ggplot2::labs(x = "Future Career", y = "count", title = "Future Career") +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1))

ggplot2::ggsave("career.png", plot = career_count_plot, width = 3000, height = 1500, units = "px")

#------------------------------------------------- Programming Skills distribution ---------------------------------------------------------- #nolint
languages_long <- file |>
  dplyr::select(Python, SQL, Java) |>
  tidyr::pivot_longer(
    cols = Python:Java,
    names_to = "Language",
    values_to = "SkillLevel"
  ) |>
  dplyr::count(Language, SkillLevel)

languages_plot <- ggplot2::ggplot(languages_long, ggplot2::aes(x = Language, y = n, fill = SkillLevel)) +
  ggplot2::geom_col(position = "dodge") +
  ggplot2::labs(x = "Language", y = "Count", title = "Skill Levels by Programming Language") +
  ggplot2::scale_fill_viridis_d("SkillLevel") +
  ggplot2::theme_bw()

ggplot2::ggsave("languages.png", plot = languages_plot, width = 3000, height = 1500, units = "px")

#------------------------------------------------- Correlation of Gender and Skills ---------------------------------------------------------- #nolint
GenderSkills_long <- file |>
  dplyr::select(Gender, Python, SQL, Java) |>
  tidyr::pivot_longer(
    cols = -Gender,
    names_to = "Language",
    values_to = "SkillLevel"
  ) |>
  dplyr::count(Gender, Language, SkillLevel)

GenderSkills_plot <- GenderSkills_long |>
  ggplot2::ggplot(aes(
    x = Gender,
    y = n,
    fill = Language
  )) +
  ggplot2::geom_col(position = "dodge") +
  ggplot2::labs(
    x = "Gender",
    y = "Count",
    title = "Skill Levels by Gender"
  ) +
  ggplot2::scale_fill_viridis_d("Language") +
  ggplot2::theme_bw() +
  ggplot2::facet_wrap(~SkillLevel, nrow = 1)

ggplot2::ggsave("GenderSkills.png", plot = GenderSkills_plot, width = 3000, height = 2000, units = "px")
