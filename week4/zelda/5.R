base::load("zelda.RData")

zelda <- zelda |>
    dplyr::filter(stringr::str_detect(producers, ", ")) |> # nolint it works because the producers' name are separated by a coma
    dplyr::group_by(title) |>
    dplyr::slice_min(year) |>
    dplyr::arrange(year, title, system)

base::save(zelda, file = "5.RData")

utils::View(zelda)
