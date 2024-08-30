average <- function(x) {
    if (base::any(base::is.na(x))) { # nolint
        base::warning(" `x` contains one or more NA values") # nolint
        return(NA)
    } # nolint

    if (!is.numeric(x)) { # nolint
        base::stop(" `x` must be a numeric vector.") # nolint
    } # nolint

    base::mean(x) # nolint
}
