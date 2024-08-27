flavor_preference <- readline()
caffeine_preference <- readline()

flavor_preference <- toupper(flavor_preference)
caffeine_preference <- toupper(caffeine_preference)

if (flavor_preference != "LIGHT" && flavor_preference != "BOLD") { # nolint
    print("Enter either 'Light' or 'Bold' for flavor.") # nolint
} else if (caffeine_preference != "YES" && caffeine_preference != "NO") { # nolint
    print("Enter either 'Yes' or 'No' for caffeine.") # nolint
} else { # nolint
    if (flavor_preference == "LIGHT" && caffeine_preference == "YES") { # nolint
        print("green tea.") # nolint
    } else if (flavor_preference == "BOLD" && caffeine_preference == "YES") { # nolint
        print("black tea.") # nolint
    } else if (flavor_preference == "LIGHT" && caffeine_preference == "NO") { # nolint
        print("chamomile tea.") # nolint
    } else if (flavor_preference == "BOLD" && caffeine_preference == "NO") { # nolint
        print("rooibos tea.") # nolint
    } # nolint
}
