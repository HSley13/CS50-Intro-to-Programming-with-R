# Read data and create a named list
year20 <- read.csv("2020.csv")
year21 <- read.csv("2021.csv")
year22 <- read.csv("2022.csv")
year23 <- read.csv("2023.csv")
year24 <- read.csv("2024.csv")

years <- list("2020" = year20, "2021" = year21, "2022" = year22, "2023" = year23, "2024" = year24) # nolint

# Function to calculate happiness
calculate_happiness <- function(year) {
    year_values <- year[, -1] # Exclude the first column (country names) # nolint
    happiness <- apply(year_values, MARGIN = 1, FUN = sum) # Sum across rows
    new_table <- data.frame(Country = year$country, Happiness = happiness) # Create a new data frame # nolint
    return(new_table)
}

# Get user input
country <- trimws(readline("Country: "))

# Loop through the named list
for (year_name in names(years)) {
    year_data <- years[[year_name]] # nolint

    if (country %in% year_data$country) { # Check if country exists in the current year's data # nolint
        new_table <- calculate_happiness(year_data) # Calculate happiness # nolint
        country_row <- subset(new_table, Country == country) # Filter for the selected country # nolint
        cat(paste0(year_name, ": ", round(country_row$Happiness, 2), "\n")) # Print result # nolint
    } else { # nolint
        cat(paste0(year_name, ": ", "unavailable", "\n")) # Notify if country is unavailable # nolint
    } # nolint
}
