library(errorist)

library(vscDebugger)
## .vsc.attach()

library(languageserver)
library(lintr)
# remotes::install_github("cran/expm")

library(expm) # used to compute matrix power

p <- t(matrix(c(
  c(0.5, 0.4, 0.1), c(0.3, 0.4, 0.3),
  c(0.2, 0.3, 0.5)
), nrow = 3))
# Check sum across = 1
apply(p, 1, sum) # nolint

# Definte initial probability vector
x0 <- c(0.1, 0.2, 0.7)
# Check sums to 1
sum(x0)

# pi_bru <- (p^100)[1, ]
pi_bru <- (p %^% 100)[1, ]
pi_bru
pi_bru - pi_bru %*% p

library(MASS)
# Get the eigenvectors of p, note: R returns right eigenvectors
r <- eigen(p)
rvec <- r$vectors
# left eigenvectors are the inverse of the right eigenvectors
lvec <- ginv(r$vectors)
# The eigenvalues
lam <- r$values
# Two ways of checking the spectral decomposition:
## Standard definition
rvec %*% diag(lam) %*% ginv(rvec)
