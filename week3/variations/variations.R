random_character <- function() {
    sample(letters, 1) # Randomly sample one letter from the vector of letters 
}

# Function to print a random sequence of specified length
print_sequence <- function(length) {
    for (i in seq_len(length)) { # Use seq_len to iterate from 1 to length 
        cat(random_character()) # Print the character 
        Sys.sleep(0.25) # Pause for 0.25 seconds 
    } 
}

print_sequence(20)
