# Copyright (C) 2021 Giulia Fiscon, Paola Paci
#
# This file is part of A-SIR
#
# A-SIR is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# A-SIR is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with A-SIR If not, see <http://www.gnu.org/licenses/>.

rm(list=ls())

options(stringsAsFactors = F)

setwd("~/A-SIR/code")

path <- "~/A-SIR/data/"
###############################
source("script/getLibrary.R")
source("script/getSource.R")
###############################
country <- "Italy"

dirRes <- paste0("../../Result/")
if(!file.exists(dirRes)){
  dir.create(dirRes)
}
dirCountry <- paste0(dirRes,country,"/")
if(!file.exists(dirCountry)){
  dir.create(dirCountry)
}
###############################
real <- F
simulation <- T

N <- 60317116 #https://en.wikipedia.org/wiki/Italy#Demographics

time_frame <-  "first_wave"

if(time_frame == "first_wave"){
  date_start <- "2/27/20"
  date_end <- "4/30/20"
  day_fs <- 240
}

if(time_frame == "second_wave"){
  date_start <- "9/29/20"
  date_end <- "11/30/20"
  day_fs <- 90
}
###############################
getLibrary()
getSource()

real_data <- importData(country)

init_config <- config()

if(real) visualizeRealData()
###############################
if(simulation){
  
  res <- performSimulation()
  
  opt <- res$opt
  simulated_data <- res$simulated_data
  
  visualizeSimulatedData(zoominfectedPlot=T,infectedPlot=T,logPlot=F)
  
  R0 = as.numeric( opt$par[1] / opt$par[2] )
  R0 <- format(R0, digits = 3)
  
  print(opt$message) # check for convergence
  print(opt$par)
  print(paste0("R0 = ",R0))
  
  rm(res)
  
  save(file = paste0(dirCountry,"ASIR_",time_frame,".RData"), 
       N, day_fs, init_config, real_data, simulated_data)
  
}