# Replicating Figure 5.2

par(mfrow=c(2,2))
u <- 23; sd<-7; n<-50; L<-u-3*sd; U<-u+3*sd
X <- seq(L,U,.1)
dat <- rnorm(n=n,mean=u,sd=sd)

B <- 1000
my.boot <- numeric(B)
for (i in 1:B)
{
  x <- sample(dat, size=50, replace=TRUE)   #draw resample 
  my.boot[i] <- mean(x)                     #compute mean, store in my.boot
}

plot(X,dnorm(X,mean=u,sd=sd), type="l", lwd=2, col="red", ylab="Density",
     main="Population, N(23,7)", xlim=c(0,46))
plot(X,dnorm(X,mean=u,sd=sd/sqrt(n)), type="l", lwd=2, col=1, ylab="Density",
     main="Population, N(23,7/sqrt(50))", , xlim=c(17,29), xlab=expression(bar(X)))
lines(c(u,u), c(0,1), col="blue", lwd=2, lty=2)
hist(dat,xlab="X",ylab="Density", xlim=c(0,46), lwd=2, main="Sample, n=50")
hist(my.boot,xlab=expression(bar(X)),ylab="Density", xlim=c(17,29), lwd=2, main="Bootstrap distribution")
boot.mean <- mean(my.boot)
lines(c(boot.mean, boot.mean), c(0,250), col="blue", lwd=2, lty=2)
