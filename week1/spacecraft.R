spacecraft <- data.frame(
  row.names = c("voyager 1", "voyager 2", "pioneer 10"), # nolint
  distance = c(163, 136, 80),
  type = c("probe 1", "probe 2", "probe 3")
)

spacecraft
view(spacecraft)

spacecraft$name
spacecraft$distance

spacecraft[1]
#            distance
# voyager 1       163
# voyager 2       136
# pioneer 10       80

spacecraft[2]
#               type
# voyager 1  probe 1
# voyager 2  probe 2
# pioneer 10 probe 3

spacecraft[[1]]
# [1] 163 136  80

spacecraft[[2]]
# [1] "probe 1" "probe 2" "probe 3"

spacecraft[, 1]
# [1] 163 136  80

spacecraft[, 2]
# [1] "probe 1" "probe 2" "probe 3"

spacecraft[1, ]
#           distance    type
# voyager 1      163 probe 1

spacecraft[2, ]
#           distance    type
# voyager 2      136 probe 2
