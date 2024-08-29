lyrics <- readr::read_file("./lyrics/your_man.txt")

lyrics <- lyrics |>
    stringr::str_to_lower() |> # nolint This isn't required but I did it cause 1 word might count as 2 if their capitalization differs
    stringr::str_replace_all("[[:punct:]]", "") |>
    stringr::str_squish() |>
    stringr::str_split("\\s+") |>
    base::unlist()

data <- data.frame(words = lyrics)

data <- data |>
    dplyr::group_by(words) |> # nolint
    dplyr::summarize(count = dplyr::n()) |>
    dplyr::filter(count > 1) |>
    dplyr::arrange(desc(count))

p <- ggplot2::ggplot(data, aes(x = words, y = count)) +
    ggplot2::geom_col(aes(fill = words), show.legend = FALSE) + # nolint
    ggplot2::scale_fill_viridis_d("words") +
    ggplot2::labs(x = "Words", y = "Count", title = "Lyrics Analysis") +
    ggplot2::theme_bw()

ggplot2::ggsave("lyrics.png", plot = p, width = 9000, height = 4000, units = "px") # nolint
