calculate_growth_rate <- function(years, visitors) {
    # TODO: Calculate yearly growth of visitors # nolint
    first_year <- years[1]
    first_year_visitors <- visitors[1]

    # The first year should be NA cause we don't its previous year data
    growth_rate <- c(NA) # nolint
    for (i in 2:length(visitors)) {
        rate <- (visitors[i] - first_year_visitors) / (years[i] - first_year) # nolint
        growth_rate <- c(growth_rate, rate) # nolint
    } # nolint

    result <- data.frame(Year = years, Visitors = visitors, GrowthRate = growth_rate) # nolint
}

predict_visitors <- function(years, visitors, year) {
    # TODO: Predict visitors in given year # nolint
    growth_rate <- calculate_growth_rate(years, visitors) # nolint

    latest_year <- growth_rate[nrow(growth_rate), ] # nolint

    predicted_visitors <- latest_year$Visitors + (latest_year$GrowthRate * (year - latest_year$Year)) # nolint
    predicted_visitors <- round(predicted_visitors, 2)
}

visitors <- read.csv("visitors.csv")

year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
