getSource <- function(){
  
  source("script/input/config.R")
  source("script/input/importData.R")
  source("script/input/extractPeople.R")
  
  source("script/model/performSimulation.R")
  source("script/model/SIR.R")
  source("script/model/RSS.R")
  
  source("script/plot/visualizeRealData.R")
  source("script/plot/visualizeSimulatedData.R")
  source("script/plot/getPlot.R")
  
}