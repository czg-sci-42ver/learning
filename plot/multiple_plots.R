is_ggplot2_available <- require("ggplot2")
if (!is_ggplot2_available) {
    install.packages(ggplot2)
}
library(ggplot2)
ggplot(mtcars) +
    aes(x = hp, y = mpg) +
    geom_point() -> p1

ggplot(mtcars) +
    aes(x = factor(cyl), y = mpg) +
    geom_boxplot() +
    geom_smooth(aes(group = 1), se = FALSE) -> p2

# grid.arrange(p1, p2, ncol = 2)
