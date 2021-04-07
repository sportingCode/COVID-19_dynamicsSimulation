visualizeSimulatedData <- function(zoominfectedPlot,infectedPlot,logPlot){
  
  ###############################
  start <- init_config$start
  end <- init_config$end
  
  time_real <- init_config$time_real
  time_fs <- init_config$time_fs
  
  infected <- real_data$active
  
  zero_point <- format(real_data$confirmed[start], digits = 2, scientific = F)
  
  x_lab <- paste0("days after ", zero_point, " cases were reported")
  y_lab <- "Infected (in millions)"
  ###############################
  
  if(zoominfectedPlot){
    
    x <- time_real
    y <- data.frame(simulation = simulated_data[1:length(time_real),"I"], 
                    real = infected[start:end])
    
    col <- c("red","gray")
    
    getPlot(x,y,NULL,x_lab,y_lab,col)
    
  }
  ###############################
  
  if(infectedPlot){
    
    x <- time_fs
    y <- data.frame(simulation = simulated_data[,"I"], 
                    real = infected[start:(end+day_fs)])
    
    col <- c("red","gray", "black")
    
    getPlot(x,y,infected[start:end],x_lab,y_lab,col,flag=T)
    
  }
  ###############################
  
  x <- time_fs
  y <- simulated_data[, c("S","I","R")]
  
  y_lab <- "Indivuals (in millions)"
  
  col <- c("blue","red","green", "black") 
  
  getPlot(x,y,infected[start:end],x_lab,y_lab,col,prediction=T)
  
  if(logPlot){
    
    getPlot(x,log10(y),log10(infected[start:end]),
            x_lab,"Infected (Log-scale)",col,prediction=T,logPlot)
    
  }
  
}
