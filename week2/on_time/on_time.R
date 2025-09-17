bus <- read.csv("bus.csv")
dplyr::glimpse(bus)

rail <- read.csv("rail.csv")
dplyr::glimpse(rail)

unique(bus$year)
# [1] 2023

unique(bus$month)
#  [1]  1  2  3  4  5  6  7  8  9 10 11 12

unique(bus$day)
#  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
# [24] 24 25 26 27 28 29 30 31

unique(bus$mode)
# [1] "Bus"

# random values
# unique(bus$route)

unique(bus$peak)
# [1] "OFF_PEAK" "PEAK"    

# random values
# unique(bus$numerator)

# random values
# unique(bus$denominator)


bus$reliability <- bus$numerator / bus$denominator
rail$reliability <- rail$numerator / rail$denominator

bus_peak <- subset(bus, peak == "peak")
bus_off_peak <- subset(bus, peak == "off_peak")

rail_peak <- subset(rail, peak == "peak")
rail_off_peak <- subset(rail, peak == "off_peak")

value <- readline("enter a value: ")

numeric_value <- suppressWarnings(as.numeric(value))

if (!is.na(numeric_value)) {
    if (numeric_value %in% bus_peak$route) { 
        peak_set <- subset(bus_peak, route == numeric_value) 
        peak_mean <- round(mean(peak_set$reliability, na.rm = true) * 100, 0) 

        print(paste0("on time ", peak_mean, "% of the time during peak hours."))
    } else { 
        cat("route not found in bus peak data.\n") 
    } 

    if (numeric_value %in% bus_off_peak$route) { 
        off_peak_set <- subset(bus_off_peak, route == numeric_value) 
        off_peak_mean <- round(mean(off_peak_set$reliability, na.rm = true) * 100, 0) 

        print(paste0("on time ", off_peak_mean, "% of the time during off-peak hours.")) 
    } else { 
        cat("Route not found in bus off-peak data.\n") 
    } 
} else {
    if (value %in% rail_peak$route) { 
        peak_set <- subset(rail_peak, route == value) 
        peak_mean <- round(mean(peak_set$reliability, na.rm = TRUE) * 100, 0) 

        print(paste0("On time ", peak_mean, "% of the time during peak hours.")) 
    } else { 
        cat("Route not found in rail peak data.\n") 
    } 

    if (value %in% rail_off_peak$route) { 
        off_peak_set <- subset(rail_off_peak, route == value) 
        off_peak_mean <- round(mean(off_peak_set$reliability, na.rm = TRUE) * 100, 0) 

        print(paste0("On time ", off_peak_mean, "% of the time during off-peak hours."))
    } else { 
        cat("Route not found in rail off-peak data.\n") 
    } 
}
