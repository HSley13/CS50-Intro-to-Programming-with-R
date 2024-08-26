temps <- c(60, 55, 50, 60, 60, 55, 65, 60, 60)

# concatenating a matrix out of the vector by precising the nrow and ncol
weather <- matrix(temps, nrow = 3, ncol = 3)

# first row of the matrix
weather[1, ]
# first col of the matrix
weather[, 1]
# first element of the matrix
weather[1, 1]

temps_3D <- c(60, 55, 50, 60, 60, 55, 65, 60, 60, 55, 50, 50, 60, 55, 50, 65, 60, 55, 55, 50, 50, 55, 55, 50, 55, 55, 55) # nolint

weather_3D <- array(temps_3D, dim = c(3, 3, 3)) # nolint

# first matrix in the 3D array
weather_3D[, , 1]
# second matrix in the 3D array
weather_3D[, , 2]
# third matrix in the 3D array
weather_3D[, , 3]
