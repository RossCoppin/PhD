layout(matrix(1:2, ncol = 2))
op <- par(mar = c(2,0,1,0) + 0.1)

plot(RDA_all_lam, scaling  = 2)
plot(lam_all_pars, scaling  = 2)

par(op)
layout(1)
