zelda <- utils::read.csv("zelda.csv")
vd(zelda)

zelda <- tidyr::pivot_wider(zelda, id_cols = c(title, release), names_from = role, values_from = names) |> # nolint
  tidyr::separate(release, into = c("year", "system"), sep = " - ") |> # nolint
  dplyr::rename_with(tolower) # nolint

zelda$year <- base::suppressWarnings(base::as.numeric(zelda$year))

base::save(zelda, file = "zelda.RData")
