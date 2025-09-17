chicks <- read.csv("chicks.csv")
chicks <- subset(chicks, !is.na(weight))

feed_options <- unique(chicks$feed)
formatted_options <- paste0(1:length(feed_options), ". ", feed_options)

feed_choice <- -1  # Initialize with invalid value to enter loop

while(TRUE) {
  # Display menu
  cat("----- OPTIONS -----\n")
  cat(formatted_options, sep = "\n")
  cat("0. Exit\n")
  
  # Get user input
  feed_choice <- as.integer(readline(paste0("Enter an option from 1 to ", length(feed_options), " or 0 to exit: ")))
  
  # Check for exit condition
  if (feed_choice == 0) {
    cat("Exiting...\n")
    break
  }
  
  # Validate input
  if (is.na(feed_choice) || feed_choice < 1 || feed_choice > length(feed_options)) {
    cat("Invalid choice. Please try again.\n\n")
    next
  }
  
  # Process valid choice
  selected_feed <- feed_options[feed_choice]
  cat("\nSelected feed:", selected_feed, "\n")
  print(subset(chicks, feed == selected_feed))
  cat("\n")
}
