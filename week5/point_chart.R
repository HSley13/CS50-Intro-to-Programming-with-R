base::load("candy.RData")

p <- ggplot2::ggplot(candy, aes(x = price_percentile, y = sugar_percentile)) +
    ggplot2::geom_point() + # nolint
    ggplot2::geom_jitter(color = "darkorchid", fill = "orchid", shape = 21, size = 2) + # nolint
    ggplot2::labs(x = "Price", y = "Sugar", title = "Price and Sugar") +
    ggplot2::theme_bw()

ggplot2::ggsave("point_chart.png", plot = p, width = 1200, height = 900, units = "px") # nolint
