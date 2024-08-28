base::load("zelda.RData")

zelda <- zelda |>
    dplyr::filter(stringr::str_detect(producers, "Shigeru Miyamoto")) |> # nolint
    dplyr::group_by(title) |> # nolint
    dplyr::slice_min(year) |>
    dplyr::ungroup() |>
    dplyr::arrange(year, title, system)

base::save(zelda, file = "4.RData")

utils::View(zelda)
