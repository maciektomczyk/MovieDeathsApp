getImdb <- function(movie) {
  omdbData <- httr::GET('http://www.omdbapi.com/', query= list(t= movie))
  movieId <- content(omdbData)$imdbID
  link <- paste('http://www.imdb.com/title/', movieId, '/', sep= "")
  
  href <- paste('<a target="_blank" href="', link, '">', movie, '</a>', sep= "")
  result <- paste(result, '<li>', href, '</li>')
}