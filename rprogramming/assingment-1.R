x <- hw1_data

y <- is.na(x$Ozone)

table(y)

z <- x$Ozone[!y]

mean(z)


q <- hw1_data$Temp[hw1_data$Month == 6]

mean(q)


q1 <- hw1_data$Ozone[hw1_data$Month == 5]

q2 <- is.na(q1)

q3 <- q1[!q2]

max(q3)


h <- x$Solar.R[x$Ozone > 31 & x$Temp > 90]

h1 <- is.na(h)

h2 <- h[!h1]

mean(h2)

h

mean(h$Solar.R)
