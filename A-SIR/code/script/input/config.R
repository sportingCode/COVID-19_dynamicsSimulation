config <- function(){
  
  ###############################
  # S: those who are healthy but susceptible to the disease (i.e., at risk of being contaminated). At the start of the pandemic, S is the entire population since no one is immune to the virus.
  # I: the infectious (and thus, infected) people
  # R: individuals who were contaminated but who have either recovered or died. They are not infectious anymore.
  ###############################
  
  start <- which(rownames(real_data) == date_start)
  end <- which(rownames(real_data) == date_end)
  
  time_real <- 0:(end-start)
  time_fs <- 0:(max(time_real) + day_fs)
  
  init_par <- c(beta = 0.5, gamma = 0.5, chsi = 0.15, eta = 0.5)
  
  infected <- real_data$active

  sigma <- 0.5
  
  init_cond <- c(S = N - infected[start] - sigma * infected[start],
                 I = infected[start],
                 J = sigma * infected[start],
                 R = 0,
                 U = 0)
  
  return(list(start = start, end = end, time_real = time_real, time_fs = time_fs, 
              init_par = init_par, init_cond = init_cond))
  
}