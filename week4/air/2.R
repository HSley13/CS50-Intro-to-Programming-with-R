base::load("air.RData")

air$emissions <- base::suppressWarnings(as.numeric(air$emissions))

air <- air |>
    dplyr::filter(!is.na(emissions)) |> # nolint
    dplyr::arrange(desc(emissions)) # nolint

air <- as_tibble(air)

base::save(air, file = "2.RData")

utils::View(air)
