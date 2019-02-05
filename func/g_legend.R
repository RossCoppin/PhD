g_legend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}

# Example

# library(ggplot2)
# library(gridExtra)

# p1 <- ggplot(df1, aes(x=x, y=y,colour=group)) + geom_point(position=position_jitter(w=0.04,h=0.02),size=1.8) + theme(legend.position="bottom")

# p2 <- ggplot(df2, aes(x=x, y=y,colour=group)) + geom_point(position=position_jitter(w=0.04,h=0.02),size=1.8)

# mylegend<-g_legend(p1)

# p3 <- grid.arrange(arrangeGrob(p1 + theme(legend.position="none"),
#                               p2 + theme(legend.position="none"),
#                               nrow=1),
#                   mylegend, nrow=2,heights=c(10, 1))



