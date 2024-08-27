flavor_preference <- readline()
caffeine_preference <- readline()

flavor_preference <- toupper(flavor_preference)
caffeine_preference <- toupper(caffeine_preference)

if (flavor_preference != "LIGHT" && flavor_preference != "BOLD") {
    print("Enter either 'Light' or 'Bold' for flavor.")
} else if (caffeine_preference != "YES" && caffeine_preference != "NO") {
    print("Enter either 'Yes' or 'No' for caffeine.")
} else {
    if (flavor_preference == "LIGHT" && caffeine_preference == "YES") {
        print("green tea.")
    } else if (flavor_preference == "BOLD" && caffeine_preference == "YES") {
        print("black tea.")
    } else if (flavor_preference == "LIGHT" && caffeine_preference == "NO") {
        print("chamomile tea.")
    } else if (flavor_preference == "BOLD" && caffeine_preference == "NO") {
        print("rooibos tea.")
    }
}
