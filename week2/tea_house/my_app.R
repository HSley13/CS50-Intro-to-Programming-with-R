get_input <- function(prompt) {
    cat(prompt) 
    return(trimws(readline()))
}

cuisine_preference <- get_input("Cuisine (Italian, Mexican, or Japanese): ")
meal_preference <- get_input("Meal (Lunch or Dinner): ")

cuisine_preference <- toupper(cuisine_preference)
meal_preference <- toupper(meal_preference)

if (cuisine_preference != "ITALIAN" && cuisine_preference != "MEXICAN" && cuisine_preference != "JAPANESE") { 
    cat("Please enter 'Italian', 'Mexican', or 'Japanese' for cuisine.\n") 
} else if (meal_preference != "LUNCH" && meal_preference != "DINNER") { 
    cat("Please enter 'Lunch' or 'Dinner' for the meal.\n") 
} else { 
    if (cuisine_preference == "ITALIAN" && meal_preference == "LUNCH") { 
        cat("For lunch, you might enjoy a Caprese Salad or a Margherita Pizza.\n") 
    } else if (cuisine_preference == "ITALIAN" && meal_preference == "DINNER") { 
        cat("For dinner, you might enjoy a Spaghetti Carbonara or a Lasagna.\n")
    } else if (cuisine_preference == "MEXICAN" && meal_preference == "LUNCH") {
        cat("For lunch, you might enjoy Tacos or a Burrito.\n") 
    } else if (cuisine_preference == "MEXICAN" && meal_preference == "DINNER") { 
        cat("For dinner, you might enjoy Enchiladas or a Quesadilla.\n")
    } else if (cuisine_preference == "JAPANESE" && meal_preference == "LUNCH") { 
        cat("For lunch, you might enjoy Sushi or a Bento Box.\n") 
    } else if (cuisine_preference == "JAPANESE" && meal_preference == "DINNER") { 
        cat("For dinner, you might enjoy Ramen or Tempura.\n") 
    } 
}
