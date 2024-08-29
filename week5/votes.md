---
title : "Votes Analysis"
Author: "Sley HORTES"
output: html_document
---

# CS50R

## Data Visualization

Here I'm gonna include some _electoral data_ for **Mario** and **his friends.**

### Loading Library


``` r
library(ggplot2)
```

### Loading data

``` r
votes <- utils::read.csv("votes.csv")
```

### Displaying data

``` r
ggplot2::ggplot(votes, aes(x = candidate, y = votes)) +
    ggplot2::geom_col(aes(fill = candidate)) + # nolint
    ggplot2::scale_fill_viridis_d("Candidate") +
    ggplot2::scale_y_continuous(limits = c(0, 250)) +
    ggplot2::labs(x = "Candidate", y = "Votes", title = "Election Results") +
    ggplot2::theme_bw()
```

![plot of chunk unnamed-chunk-3](votes-figure/unnamed-chunk-3-1.png)


### Conclusion
In the end, Mario received 100 votes, Peach received 200 votes and Bowser received 150 votes. 
