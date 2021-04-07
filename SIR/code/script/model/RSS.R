RSS <- function(init_par,time_real,init_cond,infected){
  
  simulated_data <- ode(y = init_cond, times = time_real, func = SIR, parms = init_par)
  
  infected_simulated <- simulated_data[,"I"]
  
  RSS <- sum((infected - infected_simulated)^2)
  
  return(RSS)
  
}