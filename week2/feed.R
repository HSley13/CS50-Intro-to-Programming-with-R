chicks <- read.csv("chicks.csv")
chicks <- subset(chicks, !is.na(weight))

feed_options <- unique(chicks$feed)
feed_options

formatted_options <- paste0(1:length(feed_options), ". ", feed_options) # nolint

cat(formatted_options, sep = "\n")

feed_choice <- as.integer(readline(paste0("Enter an option from 1 to ", length(feed_options), ": "))) # nolint

if (feed_choice < 1 || feed_choice > 6) {
    cat("Invalid Choice") # nolint
} else {
    selected_feed <- feed_options[feed_choice] # nolint
    print(subset(chicks, feed == selected_feed)) # nolint
}
