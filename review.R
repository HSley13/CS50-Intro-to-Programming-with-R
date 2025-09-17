# Find first number divisible by 7 and 9
x <- 1
repeat {
  if (x %% 7 == 0 && x %% 9 == 0) {
    base::print(base::paste(x, "is divisible by both 7 and 9"))
    break
  }
  x <- x + 1
}

# Print squares of numbers 1 to 5
for (i in 1:5) {
  base::print(i^2)
}

# Square all elements in a vector (better than for loop)
numbers <- 1:5
squared <- numbers^2
base::print(squared)

# Countdown from 5
x <- 5
while (x > 0) {
  base::print(base::paste("Countdown:", x))
  x <- x - 1
}

# Stop when we find the first even number
for (i in 1:10) {
  if (i %% 2 == 0) {
    base::print(base::paste("First even number found:", i))
    break
  }
}

# Print only odd numbers
for (i in 1:10) {
  if (i %% 2 == 0) next
  base::print(i)
}

# Simulate 5 dice rolls
dice_rolls <- base::replicate(5, base::sample(1:6, 1))
base::print(dice_rolls)

# Calculate row means
m <- base::matrix(1:9, nrow = 3)
base::print(m)
row_means <- base::apply(m, 1, base::mean)
col_sums <- base::apply(m, 2, base::sum)
squared <- base::apply(m, 2, function(x) x^2)
base::print(row_means)
base::print(col_sums)
base::print(squared)

# Get lengths of list elements
my_list <- base::list(a = 1:3, b = 4:9)
my_list$a
my_list$b[2]
lengths <- base::lapply(my_list, base::length)
base::print(lengths)

# Create sequence from 1:2, 1:3, 1:4
base::mapply(base::seq, from = 1, to = 2:4)
# Vectorized paste with different separators
base::mapply(base::paste, 1:3, c("a", "b", "c"), MoreArgs = base::list(sep = "-"))

# Create sample data
# tapply
base::set.seed(123)
students <- base::data.frame(
  class = base::rep(c("A", "B", "C"), each = 5),
  score = base::c(
    stats::rnorm(5, mean = 80, sd = 5), # Class A
    stats::rnorm(5, mean = 75, sd = 7), # Class B
    stats::rnorm(5, mean = 85, sd = 4)
  ) # Class C
)
base::print(students)
result <- base::tapply(
  students$score, students$class,
  function(x) base::c(mean = base::mean(x), sd = stats::sd(x))
)
base::print(result)

# Basic scatter plot
graphics::plot(
  x = mtcars$wt, y = mtcars$mpg,
  main = "Car Weight vs MPG",
  xlab = "Weight (1000 lbs)",
  ylab = "Miles per Gallon",
  pch = 19, col = "blue"
)
graphics::abline(stats::lm(mpg ~ wt, data = mtcars), col = "red")

# Scatter plot with ggplot2
ggplot2::ggplot(mtcars, ggplot2::aes(x = wt, y = mpg)) +
  ggplot2::geom_point(ggplot2::aes(color = base::factor(cyl)), size = 3) +
  ggplot2::geom_smooth(method = "lm", se = FALSE) +
  ggplot2::labs(
    title = "MPG vs Weight by Cylinders",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon"
  ) +
  ggplot2::theme_bw()

# Basic histogram
graphics::hist(mtcars$mpg,
  breaks = 10,
  col = "gray",
  main = "Distribution of MPG",
  xlab = "Miles per Gallon"
)

# Histogram with ggplot2
ggplot2::ggplot(mtcars, ggplot2::aes(mpg)) +
  ggplot2::geom_histogram(bins = 10, fill = "gray", color = "black") +
  ggplot2::labs(
    title = "Distribution of MPG Values",
    x = "Miles per Gallon",
    y = "Count"
  ) +
  ggplot2::theme_bw()

# Basic boxplot
graphics::boxplot(mpg ~ cyl,
  data = mtcars,
  main = "MPG by Number of Cylinders",
  xlab = "Cylinders",
  ylab = "Miles per Gallon",
  col = grDevices::rainbow(3)
)

# Boxplot with ggplot2
ggplot2::ggplot(mtcars, ggplot2::aes(base::factor(cyl), mpg)) +
  ggplot2::geom_boxplot(fill = base::c("red", "green", "blue")) +
  ggplot2::labs(
    title = "MPG Distribution by Cylinders",
    x = "Number of Cylinders",
    y = "Miles per Gallon"
  ) +
  ggplot2::theme_bw()

# Basic barplot
cyl_counts <- base::table(mtcars$cyl)
graphics::barplot(cyl_counts,
  main = "Number of Cars by Cylinders",
  xlab = "Number of Cylinders",
  ylab = "Count",
  col = base::c("red", "green", "blue"),
  border = "black"
)

# Basic barplot with ggplot2
ggplot2::ggplot(mtcars, ggplot2::aes(base::factor(cyl))) +
  ggplot2::geom_bar(fill = base::c("red", "green", "blue")) +
  ggplot2::labs(
    title = "Count of Cars by Cylinders",
    x = "Number of Cylinders",
    y = "Count"
  ) +
  ggplot2::theme_bw()

# Basic pie chart
graphics::pie(cyl_counts,
  main = "proportion of cars by cylinders",
  col = base::c("red", "green", "blue"),
  labels = base::paste(base::names(cyl_counts), "cylinders:", cyl_counts)
)
