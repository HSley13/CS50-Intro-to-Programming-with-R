get_input <- function(prompt) {
    cat(prompt) # nolint
    return(trimws(readline()))
}

cuisine_preference <- get_input("Cuisine (Italian, Mexican, or Japanese): ")
meal_preference <- get_input("Meal (Lunch or Dinner): ")

cuisine_preference <- toupper(cuisine_preference)
meal_preference <- toupper(meal_preference)

if (cuisine_preference != "ITALIAN" && cuisine_preference != "MEXICAN" && cuisine_preference != "JAPANESE") { # nolint
    cat("Please enter 'Italian', 'Mexican', or 'Japanese' for cuisine.\n") # nolint
} else if (meal_preference != "LUNCH" && meal_preference != "DINNER") { # nolint
    cat("Please enter 'Lunch' or 'Dinner' for the meal.\n") # nolint
} else { # nolint
    if (cuisine_preference == "ITALIAN" && meal_preference == "LUNCH") { # nolint
        cat("For lunch, you might enjoy a Caprese Salad or a Margherita Pizza.\n") # nolint
    } else if (cuisine_preference == "ITALIAN" && meal_preference == "DINNER") { # nolint
        cat("For dinner, you might enjoy a Spaghetti Carbonara or a Lasagna.\n") # nolint
    } else if (cuisine_preference == "MEXICAN" && meal_preference == "LUNCH") { # nolint
        cat("For lunch, you might enjoy Tacos or a Burrito.\n") # nolint
    } else if (cuisine_preference == "MEXICAN" && meal_preference == "DINNER") { # nolint
        cat("For dinner, you might enjoy Enchiladas or a Quesadilla.\n") # nolint
    } else if (cuisine_preference == "JAPANESE" && meal_preference == "LUNCH") { # nolint
        cat("For lunch, you might enjoy Sushi or a Bento Box.\n") # nolint
    } else if (cuisine_preference == "JAPANESE" && meal_preference == "DINNER") { # nolint
        cat("For dinner, you might enjoy Ramen or Tempura.\n") # nolint
    } # nolint
}
