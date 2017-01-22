library(dplyr)

source("getImdb.R")

doneList <<- character()

updateLiElement <- function(movieList) {
  if (!is.null(movieList)) {
    data <- data.frame("Film"= movieList)
    todoList <- tbl_df(data) %>%
      filter(!Film %in% doneList)
    
    htmlList <- list()
    for(i in todoList$Film) {
      cat(file=stderr(), i, "\n")
      imdbData <- getImdb(i)
      htmlList <- c(htmlList, list(imdbData))
      
      doneList <- c(doneList, i)
    }
    
    htmlList
  }
}