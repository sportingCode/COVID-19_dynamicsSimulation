extractPeople <- function(people,country){
  
  col <- which(colnames(people) == "Country/Region")
  row <- which(people[,col] == country)
  
  people <- people[row,-c(1:4)]
  
  date <- colnames(people)
  
  people <- as.numeric(people)
  names(people) <- date
  
  return(people)
  
}