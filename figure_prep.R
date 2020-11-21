library(jpeg)
library(grid)
library(gridExtra)
library(ggpubr)

wp_1 <- rasterGrob(as.raster(readJPEG("figures/chapter_2/fig_6A.jpg")))
img_fb <- rasterGrob(as.raster(readJPEG("figures/chapter_2/fig_7.jpg")))
wp_6 <- rasterGrob(as.raster(readJPEG("figures/chapter_2/fig_6_legend.jpg")))

ggarrange(wp_1,img_fb, wp_6, ncol = 2, nrow = 2, labels = c("A", "C", "B"), widths = c(1,2), align = "hv")

