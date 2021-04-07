getPlot <- function(x,y,infected,x_lab,y_lab,col,legend=T,prediction=F,logPlot=F,flag=F){
  
  if(!logPlot){
    
    matplot(x, y, 
            xlab = x_lab, 
            ylab = y_lab,
            type = "l", 
            lwd = 2, 
            lty = 1, 
            yaxt = "n",
            col = col)
    myTicks = axTicks(2)[-1]
    axis(2, las = 2, at = c(0,myTicks), 
         labels = c(0,format(myTicks / 10^6, digits = 2, scientific = F)))
    
  }else{
    
    matplot(x, y, 
            xlab = x_lab, 
            ylab = y_lab,
            type = "l", 
            lwd = 2, 
            lty = 1, 
            col = col)
    
  }
  
  if(legend){

    if(prediction){

      time <- 0:(length(infected)-1)

      lines(time, infected, lty = 4, lwd = 3, col = col[6])

      legend("topright", c("Susceptible", "Infected symtomatic", 
                           "Infected asymtomatic","Symtomatic recovered", 
                           "Asymtomatic recovered","fitting"),
             lty = c(1,1,1,1,1,4), lwd = 2, col = col, inset = 0.05, cex = 0.8)

    }else{

      if(flag){

        time <- 0:(length(infected)-1)

        lines(time, infected, lty = 4, lwd = 3, col = col[5])

        legend("topright", c(colnames(y), "fitting"),
               lty = c(1,1,1,1,4), lwd = 2, col = col, inset = 0.05, cex = 0.8)

      }else{

        legend("topleft", colnames(y), lty = 1, lwd = 2, col = col, inset = 0.05, cex = 0.8)

      }
    }
  }
}


