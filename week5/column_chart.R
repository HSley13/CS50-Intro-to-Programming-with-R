votes <- utils::read.csv("votes.csv")

p <- ggplot2::ggplot(votes, ggplot2::aes(x = candidate, y = votes)) +
  ggplot2::geom_col(ggplot2::aes(fill = candidate)) + # nolint
  ggplot2::scale_y_continuous(limits = c(0, 250)) +
  ggplot2::labs(x = "Candidate", y = "Votes", title = "Election Results") +
  ggplot2::theme_bw()

ggplot2::ggsave("column_chart.png", plot = p, width = 1200, height = 900, units = "px") # nolint
