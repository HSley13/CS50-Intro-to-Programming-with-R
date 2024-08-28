base::load("air.RData")

air$emissions <- base::suppressWarnings(as.numeric(air$emissions))

air <- air |>
    dplyr::filter(!is.na(emissions)) |> # nolint
    dplyr::filter(county == "OR - Washington") # nolint

air <- as_tibble(air)

base::save(air, file = "3.RData")

utils::View(air)
