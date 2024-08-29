base::load("anita.RData")

p <- ggplot2::ggplot(anita, aes(x = timestamp, y = wind)) +
    ggplot2::geom_line(linetype = 1, linewidth = 0.5) + # nolint
    ggplot2::geom_point(color = "darkorchid", size = 2) +
    ggplot2::geom_hline(yintercept = 65, linetype = 3) +
    ggplot2::labs(x = "Timestamp", y = "Wind Speed (knots)", title = "Hurricane Anita Evolution") + # nolint
    ggplot2::theme_bw()

ggplot2::ggsave("line_chart.png", plot = p, width = 1200, height = 900, units = "px") # nolint
