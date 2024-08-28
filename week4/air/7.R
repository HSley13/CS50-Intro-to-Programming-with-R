base::load("air.RData")

air <- air |>
    rename(source = level_1) |>
    group_by(source) |>
    group_by(pollutant, .add = TRUE) |>
    summarize(emissions = sum(emissions)) |>
    ungroup() |>
    arrange(source, pollutant)

base::save(air, file = "7.RData")
