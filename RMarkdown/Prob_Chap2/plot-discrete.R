# Plot pmf for binomial dist
n <- 10
p <- 0.4
x <- seq(0, n, by=1)
y <- dbinom(x, n, p)
plot(x,y)

# Plot pmf for Poisson dist
lam <- 12
n <- 30
x <- seq(0, n, by=1)
y <- dpois(x, lam)
plot(x,y)

# Plot pmf for Geometric dist
p <- 0.1
n <- 30
x <- seq(0, n, by=1)
y <- dgeom(x, p)
plot(x,y)