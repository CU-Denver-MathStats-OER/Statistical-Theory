# Proportion of all M&M's that are blue is p=0.24
n <- 34 #fun size pack has 17 m&m's
z <- 1.96 #95% conf interval
p <- 0.24 #population prop

# Using Score Confidence Interval
counter <- 0
plot(x = c(0, 1), y = c(1, 100), type = "n", xlab = "", ylab = "")

for (i in 1:1000)
{
  p.hat <- mean(rbinom(n, 1, p))
  L <- (p.hat + z^2/(2*n)-z*sqrt(p.hat*(1-p.hat)/n+z^2/(4*n^2)))/(1+z^2/n)
  U <- (p.hat + z^2/(2*n)+z*sqrt(p.hat*(1-p.hat)/n+z^2/(4*n^2)))/(1+z^2/n)
  if ( L < p && p < U)
  {
    counter <- counter + 1
    plot.color  <- "green"
  }
  else
    plot.color  <- "red"
  segments(L, i, U, i, col = plot.color)    
}

abline(v = p, col = "blue")
counter/1000

# Using Wald
counter.wald <- 0
plot(x = c(0, 1), y = c(1, 100), type = "n", xlab = "", ylab = "")

for (i in 1:1000)
{
  p.hat <- mean(rbinom(n, 1, p))
  L <- p.hat-z*sqrt(p.hat*(1-p.hat)/n)
  U <- p.hat+z*sqrt(p.hat*(1-p.hat)/n)
  if ( L < p && p < U)
  {
    counter.wald <- counter.wald + 1
    plot.color  <- "green"
  }
  else
    plot.color  <- "red"
  segments(L, i, U, i, col = plot.color)    
}

abline(v = p, col = "blue")
counter.wald/1000

# Using Agresti-Coull
counter.agresti <- 0
plot(x = c(0, 1), y = c(1, 100), type = "n", xlab = "", ylab = "")

for (i in 1:100)
{
  p.tilde <- (sum(rbinom(n, 1, p))+2)/(n+4)
  L <- p.tilde - z*sqrt(p.tilde*(1-p.tilde)/n)
  U <- p.tilde + z*sqrt(p.tilde*(1-p.tilde)/n)
  if ( L < p && p < U)
  {
    counter.agresti <- counter.agresti + 1
    plot.color  <- "green"
  }
  else
    plot.color  <- "red"
  segments(L, i, U, i, col = plot.color)    
}

abline(v = p, col = "blue")
counter.agresti/1000
