importData <- function(country){
  
  #########
  confirmed <- read.csv(paste0(path,"time_series_covid19_confirmed_global.csv"), header = T, check.names = F, quote = "")
  
  death <- read.csv(paste0(path,"time_series_covid19_deaths_global.csv"), header = T, check.names = F, quote = "")
  
  recovered <- read.csv(paste0(path,"time_series_covid19_recovered_global.csv"), header = T, check.names = F, quote = "")
  #########
  
  confirmed <- extractPeople(confirmed,country)
  
  death <- extractPeople(death,country)
  
  recovered <- extractPeople(recovered,country)
  
  active <- confirmed - death - recovered
  
  df <- data.frame(confirmed = confirmed,
                   death = death,
                   recovered = recovered,
                   active = active)
  
  return(df)
  
}

