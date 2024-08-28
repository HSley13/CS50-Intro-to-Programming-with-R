utils::View(storms)

# We can do it by passing normal arguments to the parameter lists
storms1 <- dplyr::select(storms, !c(lat, long, pressure, ends_with("diameter")))
utils::View(storms1)
storms2 <- dplyr::filter(storms2, status == "hurricane")
utils::View(storms2)

# Or just use Pip(previous one becomes the first argument of the second one) which is modern approach #nolint
# almost like pipelines in mongoDB
# |> or %>%
hurricanes <- storms |>
    dplyr::select(!c(lat, long, pressure, ends_with("diameter"))) |>
    stats::filter(status == "hurricane") |>
    dplyr::arrange(desc(wind), name) |>
    dplyr::distinct(name, year, .keep_all = TRUE)

hurricanes |>
    dplyr::select(c(year, name, wind)) |>
    utils::write.csv("hurricanes.csv", row.names = FALSE)
