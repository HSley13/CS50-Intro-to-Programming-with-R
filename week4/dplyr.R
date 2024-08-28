hurricanes <- utils::read.csv("hurricanes.csv")

utils::View(hurricanes)

# arrange them in desc order and then get the head
hurricanes |>
    dplyr::group_by(year) |> # nolint
    dplyr::arrange(desc(wind)) |>
    dplyr::slice_head()

# or just get the max after ordering them
hurricanes |>
    dplyr::group_by(year) |> # nolint
    dplyr::slice_max(order_by = wind) |>
    dplyr::filter(year >= 1980 & year <= 1990)

# using the summarize function
hurricanes |>
    dplyr::group_by(year) |> # nolint
    dplyr::summarize(hurricanes = n())
