SIR <- function(time,state,parameters){
  
  par <- as.list(c(state, parameters))
  
  with(par, {
    
    dS <- - beta * I * S / N
    dI <- beta * I * S / N - gamma * I
    dR <- gamma * I
    
    list(c(dS, dI, dR))
    
  })
}