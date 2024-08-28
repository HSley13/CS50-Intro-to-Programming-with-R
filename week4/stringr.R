shows <- utils::read.csv("shows.csv")
utils::View(shows)

shows$show <- shows$show |>
    stringr::str_trim() |> # nolint
    stringr::str_squish() |>
    stringr::str_to_title()

shows$show[stringr::str_detect(shows$show, "Avatar")] <- "Avatar: The Last Airbender" # nolint

shows |>
    dplyr::group_by(show) |> # nolint
    dplyr::summarize(votes = n()) |>
    dplyr::ungroup() |>
    dplyr::arrange(desc(votes))
