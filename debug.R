## 在 vscode 里 一般用 launch R workspace
## https://renkun.me/2020/09/13/debugging-r-in-vscode/

## https://adv-r.hadley.nz/debugging.html

f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) {
    if (!is.numeric(d)) {
        stop("`d` must be numeric", call. = FALSE)
    }
    d + 10
}

browser()
## 有 n where 等命令
options(error = recover)
f("x")
