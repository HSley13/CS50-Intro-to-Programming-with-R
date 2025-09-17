base::load("zelda.RData")

zelda <- zelda |>
  dplyr::group_by(year) |> # nolint
  dplyr::summarize(releases = dplyr::n()) |>
  dplyr::ungroup() |>
  dplyr::arrange(desc(releases))
zelda

base::save(zelda, file = "2.RData")
vd(zelda)
