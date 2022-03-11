raster_need <- require("raster")

# https://hohenfeld.is/posts/check-if-a-package-is-installed-in-r/
install.packages("pacman")
library("pacman")
p_load("raster")
library(raster)

library(raster)
## Loading required package: sp
# RasterLayer with the default parameters
x <- raster()
x
## class      : RasterLayer
## dimensions : 180, 360, 64800  (nrow, ncol, ncell)
## resolution : 1, 1  (x, y)
## extent     : -180, 180, -90, 90  (xmin, xmax, ymin, ymax)
## crs        : +proj=longlat +datum=WGS84 +no_defs
res(x)
x <- raster(ncol = 36, nrow = 18, xmn = -1000, xmx = 1000, ymn = -100, ymx = 900)
res(x)
res(x) <- 100
res(x)
x
ncol(x)
## [1] 20
ncol(x) <- 18
ncol(x)
## [1] 18
res(x)
## [1] 111.1111 100.0000
projection(x) <- "+proj=utm +zone=48 +datum=WGS84"
x
