###########################################################
# TA 12/31
###########################################################

options(scipen=999)

nSizes <- c(5, 10, 15, 20, 25, 30, 
            40, 50, 60, 70, 80, 90, 100, 
            200, 300, 400, 500, 
            1e3, 1e4, 1e5, 1e6)


# sample from uniform
for (n in nSizes) {
  hist(runif(n, 0, 1), probability=T, 
       xlab = "X", 
       main=paste0("I.I.D. Samples from the Uniform Distribution (n=", n, ")"), 
       xlim = c(0, 1), ylim = c(0, 3), las = 1)
  curve(dunif, add=T, col="blue", lwd = 2)
}


# sample from binomial
for (n in nSizes) {
  N = 50; P = 0.3
  hist(rbinom(n, N, P), probability=T, 
       xlab = "X", 
       main=paste0("I.I.D. Samples from the Binomial Distribution (n=", n, ", p=", P, ")"), 
       xlim = c(0, 30), ylim = c(0, 0.2), las = 1)
  curve(dnorm(x, N*P, sqrt(N*P*(1-P))), add=T, col="blue", lwd=2)
  legend("topright", legend=c("Normal Curve"), col="blue", lwd=2, cex=1.2)
}


# sample from normal
for (n in nSizes) {
  hist(rnorm(n, 0, 1), probability=T, 
       xlab = "X", 
       main=paste0("I.I.D. Samples from the Normal Distribution (n=", n, ")"), 
       xlim = c(-4, 4), ylim = c(0, 0.6), las = 1)
  curve(dnorm, add=T, col="blue", lwd = 2)
}


# sample from t
for (n in nSizes) {
  df <- 10
  hist(rt(n, df), probability=T, 
       xlab = "X", 
       main=paste0("I.I.D. Samples from the t Distribution (n=", n, ", df=", df, ")"), 
       xlim = c(-4, 4), ylim = c(0, 0.6), las = 1)
  curve(dt(x, df), add=T, col="blue", lwd=2)
}


# t approximate normal
DFs <- c(1:30, c(4:9)*10, 1e2, 1e3, 1e4, 1e5, 1e6)
for (df in DFs) {
  curve(dt(x, df), col = "blue", lwd = 2,
        ylab = "Density", xlab = "X", 
        main = paste0("t and Normal Distribution (df=", df, ")"),
        xlim=c(-4, 4), ylim=c(0, 0.45), las=1)
  curve(dnorm, add=T, col="red", lwd=2) 
  legend("topright", cex = 1.2, 
         legend=c("Normal", "t"), col=c("red", "blue"), lwd=2)
}

