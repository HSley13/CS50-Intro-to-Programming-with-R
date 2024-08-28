base::load("zelda.RData")

zelda <- zelda |>
    dplyr::group_by(title) |> # nolint
    dplyr::filter(year == min(year)) |>
    # dplyr::slice_min(year) we can also use the slice_min cause it takes the min of all the years #nolint
    dplyr::arrange(year, title, system)

base::save(zelda, file = "3.RData")

utils::View(zelda)
