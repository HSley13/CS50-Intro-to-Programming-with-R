if (!base::requireNamespace("ggplot2", quietly = TRUE)) {
  utils::install.packages("ggplot2")
}
library(ggplot2)

# Define the magic ball simulation function
magic_ball_simulation <- function(trials = 100000, grid_size = 9, verbose = TRUE) {
  win <- 0 # Counter for wins
  loss <- 0 # Counter for losses
  results <- base::character(trials) # Vector to store result labels ("Win" or "Loss")

  # Create a vector of possible board positions (e.g., 1 to 9)
  board_positions <- 1:grid_size

  # Perform the simulation for the specified number of trials
  for (i in base::seq_len(trials)) {
    # Randomly select 3 winning positions and 3 ball positions
    winning_positions <- base::sample(board_positions, 3)
    ball_positions <- base::sample(board_positions, 3)

    # If all 3 positions match (regardless of order), it's a win
    if (base::setequal(winning_positions, ball_positions)) {
      win <- win + 1
      results[i] <- "Win"
    } else {
      loss <- loss + 1
      results[i] <- "Loss"
    }
  }

  # Summarize the result counts
  result_summary <- base::as.data.frame(base::table(Result = results))

  base::cat("=== Magic Ball Simulation Report ===\n")
  base::print(result_summary)

  # Create a bar plot to visualize win/loss frequencies
  p <- ggplot2::ggplot(result_summary, ggplot2::aes(x = Result, y = Freq, fill = Result)) +
    ggplot2::geom_bar(stat = "identity", width = 0.5) +
    ggplot2::geom_text(ggplot2::aes(label = Freq), vjust = -0.3, size = 2) +
    ggplot2::scale_fill_manual(values = c("Win" = "cyan", "Loss" = "gray")) +
    ggplot2::labs(
      title = "Magic Ball: Win vs Loss (Simulation Results)",
      x = "Result",
      y = "Frequency"
    ) +
    ggplot2::theme_bw()

  # Return the ggplot object
  return(p)
}

# Run the simulation
magic_ball_simulation()
