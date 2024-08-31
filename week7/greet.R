base::library(ducksay)

name <- base::readline("What's ur name? ")

greeting <- ducksay(base::paste("Hello,", name))

base::cat(greeting)
