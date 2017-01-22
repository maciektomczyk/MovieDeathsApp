data <- read.csv("filmdeathcounts.csv", header= T, sep= ",")

axis_vars <- c(
  "Film" = "Film",
  "Rok" = "Year",
  "Ilość ciał" = "Body_Count",
  "Ocena MPAA" = "MPAA_Rating",
  "Gatunek" = "Genre",
  "Reżyser" = "Director",
  "Długość (minuty)" = "Length_Minutes",
  "Ocena IMDB" = "IMDB_Rating"
)

y_axis_vars <- c(
  "Rok" = "Year",
  "Ilość ciał" = "Body_Count",
  "Ocena MPAA" = "MPAA_Rating",
  "Długość (minuty)" = "Length_Minutes",
  "Ocena IMDB" = "IMDB_Rating"
)