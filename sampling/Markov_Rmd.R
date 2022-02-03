twosam <- function(y1, y2) {
    n1 <- length(y1)
    n2 <- length(y2)
    yb1 <- mean(y1)
    yb2 <- mean(y2)
    s1 <- var(y1)
    s2 <- var(y2)
    s <- ((n1 - 1) * s1 + (n2 - 1) * s2) / (n1 + n2 - 2)
    tst <- (yb1 - yb2) / sqrt(s * (1 / n1 + 1 / n2))
    tst
}



group1 <- rnorm(100)
group2 <- rnorm(100, mean = .1)

test <- twosam(group1, group2)
test2 <- t.test(group1, group2)

# cmd <- 'bash -c ". ~/R_code/bind.bash"'
# cat(cmd)
# system(cmd)
