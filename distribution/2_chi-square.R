# Display the Chi-squared distributions with
#  1, 2, 4, 8, 16, and 32 degrees of freedom.

x <- seq(0, 40, length = 200)
x
hx <- rep(0, 200)
hx

degf <- c(1, 2, 4, 8, 16, 32)
colors <- c("red", "orange", "green", "blue", "black", "violet")
labels <- c("df=1", "df=2", "df=4", "df=8", "df=16", "df=32")

plot(x, hx,
    type = "n", lty = 2, lwd = 2, xlab = "x value",
    ylab = "Density", ylim = c(0, 0.7), xlim = c(0, 40), las = 1,
    xaxp = c(0, 40, 10),
    main = "Chi-Squared Distribution \n 1, 2, 4, 8, 16, 32 Degrees of Freedom"
)

for (i in 1:6) {
    lines(x, dchisq(x, degf[i]), lwd = 5, col = colors[i], lty = 1)
    print(i)
    print(colors[i])
}


abline(h = 0)
abline(h = seq(0.1, 0.7, 0.1), lty = 3, col = "darkgray")
abline(v = 0)
abline(v = seq(2, 40, 2), lty = 3, col = "darkgray")
legend("topright",
    inset = .05, title = "Degrees of Freedom",
    labels, lwd = 2, lty = 1, col = colors
)


for (j in 1:6) {
    plot(x, hx,
        type = "n", lty = 2, lwd = 2, xlab = "x value",
        ylab = "Density", ylim = c(0, 0.7), xlim = c(0, 40), las = 1,
        xaxp = c(0, 40, 10),
        main = paste("Chi-Squared Distribution:", k[j], " Degrees of Freedom")
    )

    for (i in j:j) {
        lines(x, dchisq(x, degf[i]), lwd = 2, col = colors[i], lty = 1)
    }
    abline(h = 0)
    abline(h = seq(0.1, 0.7, 0.1), lty = 3, col = "darkgray")
    abline(v = 0)
    abline(v = seq(2, 40, 2), lty = 3, col = "darkgray")
    legend("topright",
        inset = .05, title = "Degrees of Freedom",
        labels[j], lwd = 2, lty = 1, col = colors[j]
    )
}

# look at areas to the right of 4 for 6 different
# options on the degrees of freedom
pchisq(4, 1, lower.tail = FALSE)
pchisq(4, 2, lower.tail = FALSE)
pchisq(4, 4, lower.tail = FALSE)
pchisq(4, 8, lower.tail = FALSE)
pchisq(4, 16, lower.tail = FALSE)
pchisq(4, 32, lower.tail = FALSE)

# look at a left tail
pchisq(1.239, 7)

qchisq(0.01, 7)
pchisq(1.239042, 7)

qchisq(0.01, 7, lower.tail = FALSE)
pchisq(18.47531, 7, lower.tail = FALSE)

pchisq(2.34, 6)
pchisq(15.34, 9, lower.tail = FALSE)
pchisq(6.66, 17) + pchisq(27.34, 17, lower.tail = FALSE)
pchisq(25.41, 14) - pchisq(5.25, 14)
qchisq(0.0333, 5)
qchisq(0.125, 25, lower.tail = FALSE)
qchisq(0.125, 11)
qchisq(0.125, 11, lower.tail = FALSE)
qchisq(0.01665, 23)
qchisq(0.01665, 23, lower.tail = FALSE)
