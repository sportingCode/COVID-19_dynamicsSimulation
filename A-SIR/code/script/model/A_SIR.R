A_SIR <- function(time,state,parameters){
  
  par <- as.list(c(state, parameters))
  
  with(par, {
    
    dS <- - beta * (I + J) * S / N
    dI <- chsi * beta * (I + J) * S / N - gamma * I
    dJ <- (1 - chsi) * beta * (I + J) * S / N - eta * J
    dR <- gamma * I
    dU <- eta * J
    
    list(c(dS, dI, dJ, dR, dU))
    
  })
}