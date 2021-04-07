visualizeRealData <- function(){
  
  ###############################
  start <- init_config$start
  end <- init_config$end
  
  time_real <- init_config$time_real
  
  zero_point <- format(real_data$confirmed[start], digits = 2, scientific = F)
  
  x_lab <- paste0("days after ", zero_point, " cases were reported")
  ###############################
  
  #Blues BuGn BuPu GnBu Greens Greys Oranges OrRd PuBu PuBuGn PuRd Purples RdPu Reds YlGn YlGnBu YlOrBr YlOrRd 
  
  y <- real_data[start:end, c("confirmed","death","recovered","active")]
  
  y_lab <- "Individuals (in millions)"
  
  col <- c("blue","violet","green", "red") #brewer.pal(5, "YlGnBu")[-1]
  
  getPlot(time_real,y,NULL,x_lab,y_lab,col)
  ###############################
  
  z <- real_data[start:end,"active"]
  
  z_lab <- "Infected (in millions)"
  
  col <- "red"
  
  getPlot(time_real,z,NULL,x_lab,z_lab,col,legend=F)
  
}