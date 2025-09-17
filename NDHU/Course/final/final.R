if (!base::requireNamespace("rpart.plot", quietly = TRUE)) {
  utils::install.packages("rpart.plot")
}
if (!base::requireNamespace("ggplot2", quietly = TRUE)) {
  utils::install.packages("ggplot2")
}
library(rpart.plot)
library(ggplot2)

# -------------------------------
# Question 1: Decision Tree for Loan Approval
# -------------------------------

# Create a loan approval dataset
loan_data <- base::data.frame(
  Age = base::c(base::rep("Young", 5), base::rep("Middle", 5), base::rep("Old", 5)), # Age groups repeated
  Job = base::c(
    "No", "No", "Yes", "Yes", "No", # Job status: Yes/No
    "No", "No", "Yes", "No", "No",
    "No", "No", "Yes", "Yes", "No"
  ),
  House = base::c(
    "No", "No", "No", "Yes", "No", # House ownership: Yes/No
    "No", "No", "Yes", "Yes", "Yes",
    "Yes", "Yes", "No", "No", "No"
  ),
  Credit = base::c(
    "Fair", "Good", "Good", "Fair", "Fair", # Credit rating: Fair, Good, VeryGood, Excellent
    "Fair", "Good", "Good", "Excellent", "Excellent",
    "VeryGood", "Good", "Good", "VeryGood", "Fair"
  ),
  Approved = base::c(
    "No", "No", "Yes", "Yes", "No", # Approval result: Yes/No
    "No", "No", "Yes", "Yes", "Yes",
    "Yes", "Yes", "Yes", "Yes", "No"
  )
)

# Train a decision tree model using the rpart package
# Target variable: Approved (Yes/No)
# Features: Age, Job, House, Credit
tree_model <- rpart::rpart(
  Approved ~ Age + Job + House + Credit,
  data = loan_data,
  method = "class" # Use classification mode (since Approved is categorical)
)

# Visualize the trained decision tree
rpart.plot::rpart.plot(tree_model)

# Predict the approval outcome for a new case:
# A young person, no job, no house, but with good credit
new_case <- base::data.frame(Age = "Young", Job = "No", House = "No", Credit = "Good")

# Perform prediction using the trained decision tree
prediction <- stats::predict(tree_model, new_case, type = "class")

# Print the prediction result
base::print(base::paste("Loan approval prediction:", prediction))


# -------------------------------
# Question 2: Hypertension Classification
# -------------------------------

# Read in the dataset of patients from 'Dataset.csv'
# This file should contain columns: ID (patient ID), SBP (systolic blood pressure)
Hyper <- utils::read.csv("Dataset.csv")

# Add a new column called 'Hypertension':
# Set it to 1 if SBP > 140 (high blood pressure), otherwise 0
Hyper$Hypertension <- base::ifelse(Hyper$SBP > 140, 1, 0)

# Print the entire updated dataset, which now has 3 columns:
# ID, SBP, and Hypertension
base::print(Hyper)

# Count and print the number of hypertensive patients
# This sums up all values in the Hypertension column (1 = hypertensive)
hypertension_count <- base::sum(Hyper$Hypertension, na.rm = TRUE)
base::print(base::paste("Number of hypertensive patients:", hypertension_count))

# -------------------------------
# Question 3: Word Frequency Analysis of Elon Musk Interview
# -------------------------------

# Read in the entire text file containing the interview, convert all text to lowercase
lines <- base::tolower(base::readLines("Elon_Musk_interview.txt", warn = FALSE))

# Split text into words using regular expressions to break on non-word characters
tokens <- base::unlist(base::strsplit(lines, "\\W+"))

# Remove empty strings that may result from splitting
tokens <- tokens[tokens != ""]

# Count how many times each word appears using a table
# Then sort the table from most frequent to least
word_table <- base::sort(base::table(tokens), decreasing = TRUE)

# Extract the top 6 most frequent words from the table
top_words <- utils::head(word_table, 6)

# Convert the top 6 words and their frequencies into a data frame
top_words_df <- base::data.frame(
  Word = base::names(top_words),
  Frequency = base::as.integer(top_words)
)

# Print the data frame containing the top 6 words
base::print(top_words_df)

# Create a bar chart using ggplot2 to visualize the top 6 most frequent words
p <- ggplot2::ggplot(top_words_df, ggplot2::aes(x = stats::reorder(Word, -Frequency), y = Frequency)) +
  ggplot2::geom_bar(stat = "identity", fill = "steelblue") + # Bar plot with custom color
  ggplot2::labs(
    title = "Top 6 Most Frequent Words in Interview",
    x = "Word",
    y = "Frequency"
  ) +
  ggplot2::theme_bw() # Use a clean black-and-white theme

# Save the plot as a PNG file
ggplot2::ggsave("top_words.png", p, width = 8, height = 6, units = "in")
