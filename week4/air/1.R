air0 <- utils::read.csv("air.csv")

air <- air0 |>
    dplyr::rename( # nolint
        state = State, # nolint
        county = State.County,
        pollutant = POLLUTANT,
        emissions = Emissions..Tons.,
        level_1 = SCC.LEVEL.1,
        level_2 = SCC.LEVEL.2,
        level_3 = SCC.LEVEL.3,
        level_4 = SCC.LEVEL.4
    ) |> # nolint
    dplyr::select(c(state, county, pollutant, emissions, level_1, level_2, level_3, level_4)) # nolint

base::save(air, file = "air.RData")

utils::View(air)
