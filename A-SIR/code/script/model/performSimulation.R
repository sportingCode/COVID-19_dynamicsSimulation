performSimulation <- function(){
  
  ###############################
  start <- init_config$start
  end <- init_config$end
  
  time_real <- init_config$time_real
  time_fs <- init_config$time_fs
  
  init_par <- init_config$init_par
  init_cond <- init_config$init_cond
  
  infected <- real_data$active
  ###############################
  
  opt <- optim(init_par, fn = RSS, 
               time_real = time_real, init_cond = init_cond, 
               infected = infected[start:end],
               control = list(maxit = 150),
               method = "L-BFGS-B", lower = c(0,0,0.1,0), upper = c(1,1,0.3,1)) 
  
  simulated_data <- ode(y = init_cond, times = time_fs, func = A_SIR, parms = opt$par)
  
  return(list(opt = opt, simulated_data = simulated_data))
  
}