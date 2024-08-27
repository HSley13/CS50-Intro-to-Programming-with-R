bus <- read.csv("bus.csv")
rail <- read.csv("rail.csv")

bus$reliability <- bus$numerator / bus$denominator
rail$reliability <- rail$numerator / rail$denominator

bus_peak <- subset(bus, peak == "PEAK")
bus_off_peak <- subset(bus, peak == "OFF_PEAK")

rail_peak <- subset(rail, peak == "PEAK")
rail_off_peak <- subset(rail, peak == "OFF_PEAK")

value <- readline("Enter a value: ")

numeric_value <- suppressWarnings(as.numeric(value))

if (!is.na(numeric_value)) {
    if (numeric_value %in% bus_peak$route) { # nolint
        peak_set <- subset(bus_peak, route == numeric_value) # nolint
        peak_mean <- round(mean(peak_set$reliability, na.rm = TRUE) * 100, 0) # nolint

        print(paste0("On time ", peak_mean, "% of the time during peak hours.")) # nolint
    } else { # nolint
        cat("Route not found in bus peak data.\n") # nolint
    } # nolint

    if (numeric_value %in% bus_off_peak$route) { # nolint
        off_peak_set <- subset(bus_off_peak, route == numeric_value) # nolint
        off_peak_mean <- round(mean(off_peak_set$reliability, na.rm = TRUE) * 100, 0) # nolint

        print(paste0("On time ", off_peak_mean, "% of the time during off-peak hours.")) # nolint
    } else { # nolint
        cat("Route not found in bus off-peak data.\n") # nolint
    } # nolint
} else {
    if (value %in% rail_peak$route) { # nolint
        peak_set <- subset(rail_peak, route == value) # nolint
        peak_mean <- round(mean(peak_set$reliability, na.rm = TRUE) * 100, 0) # nolint

        print(paste0("On time ", peak_mean, "% of the time during peak hours.")) # nolint
    } else { # nolint
        cat("Route not found in rail peak data.\n") # nolint
    } # nolint

    if (value %in% rail_off_peak$route) { # nolint
        off_peak_set <- subset(rail_off_peak, route == value) # nolint
        off_peak_mean <- round(mean(off_peak_set$reliability, na.rm = TRUE) * 100, 0) # nolint

        print(paste0("On time ", off_peak_mean, "% of the time during off-peak hours.")) # nolint
    } else { # nolint
        cat("Route not found in rail off-peak data.\n") # nolint
    } # nolint
}
