
# https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example/5963610#5963610
# from #R https://web.libera.chat

a <- structure(list(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), Sepal.Width = c(
    3.5,
    3, 3.2, 3.1
), Petal.Length = c(1.4, 1.4, 1.3, 1.5), Petal.Width = c(
    0.2,
    0.2, 0.2, 0.2
), Species = structure(c(2L, 1L, 1L, 1L), .Label = c(
    "setosa",
    "versicolor", "virginica"
), class = "factor")), row.names = c(
    NA,
    10L
), class = "data.frame")

a <- rnorm(20)
b <- rnorm(20)
c <- rnorm(10)
d <- rnorm(10)
e <- c(c, d)

data.frame(e, c, d)

set.seed(42) ## for sake of reproducibility
n <- 6
dat <- data.frame(
    id = 1:n,
    date = seq.Date(as.Date("2020-12-26"), as.Date("2020-12-31"), "day"),
    group = rep(LETTERS[1:2], n / 2),
    age = sample(18:30, n, replace = TRUE),
    type = factor(paste("type", 1:n)),
    x = rnorm(n)
)
dat

test <- rnorm(n)
test
