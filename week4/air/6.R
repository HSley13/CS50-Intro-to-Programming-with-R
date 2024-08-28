base::load("air.RData")

air$emissions <- base::suppressWarnings(as.double(air$emissions))

air <- air |>
    group_by(pollutant) |>
    summarize(emissions = sum(emissions)) |>
    ungroup() |>
    arrange(desc(emissions))

base::save(air, file = "6.RData")

utils::View(air)
