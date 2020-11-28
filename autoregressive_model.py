import numpy as np
import matplotlib.pyplot as plt


# simulation of autoregressive model AR(p) for p in {0, 1, 2}
def AR (p, steps):
    
    # parameters
    c     = 0.0
    phi1  = 0.9
    phi2  = -0.8
    
    # initialize empty list with steps entries
    Y = np.zeros(steps) #[None] * steps
    
    # initial values
    if p > 0:
        for i in range(p):
            Y[i] = np.random.normal(0.0, 1.0)
    
    # AR(p) model rules
    if p == 0:
        for i in range(p, steps):
            Y[i] = c + np.random.normal(0.0, 1.0)
    
    elif p == 1:
        for i in range(p, steps):
            Y[i] = c + phi1*Y[i-1] + np.random.normal(0.0, 1.0)
    
    elif p == 2:
        for i in range(p, steps):
            Y[i] = c + phi1*Y[i-1] + phi2*Y[i-2] + np.random.normal(0.0, 1.0)
    
    return (Y)


def view ():
    
    p     = 1
    steps = 200
    
    # generate data for plot
    X = range(steps)
    Y = AR(p, steps)
    
    # plot data
    plt.figure()
    plt.fill_between(X, Y, 0)
    plt.title("autoregressive model: $AR($" + str(p) + "$)$")
    plt.xlabel(r"steps $t$")
    plt.ylabel(r"$Y_t$")


view()
