# AR() simulates the autoregressive model AR(p) for p in {0, 1, 2}:
AR = function (p, steps)
{
  
  # parameters:
  c    = 0.0
  phi1 = 0.9
  phi2 = -0.8
  
  # initialize data list:
  Y = list()
  
  # initial values:
  if (p > 0) {
    for (i in 1:p) {
      Y[i] = 0.1
    }
  }
  
  # AR(p) model rules:
  if (p == 0) {
    for (i in (p+1):steps) {
      Y[i] = c + rnorm(1, mean=0, sd=1)
    }
  }
  
  else if (p == 1) {
    for (i in (p+1):steps) {
      Y[i] = c + phi1*Y[[i-1]] + rnorm(1, mean=0, sd=1)
    }
  }
  
  else if (p == 2) {
    for (i in (p+1):steps) {
      Y[i] = c + phi1*Y[[i-1]] + phi2*Y[[i-2]] + rnorm(1, mean=0, sd=1)
    }
  }
  
  return (Y)
  
}


view = function()
{
  
  p     = 2
  steps = 200
  
  # generate data for plot:
  X  = c(1:steps)
  Y  = AR(p, steps)
  
  # generate data for fill-polygon:
  Xp = c(X, rev(X))
  Yp = c(rep(0, NROW(Y)), rev(Y))
  
  # plot data:
  plot(X, Y, type="l", 
             xlab="steps t", 
             ylab=expression("Y"[t]), 
             main=bquote(paste("autoregressive model: ", AR(.(p)))))
  polygon(Xp, Yp, col=c("#0099FF"))
  
}


view()