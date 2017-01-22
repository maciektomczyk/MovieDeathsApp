library(shiny)
library(plotly)

fluidPage(
  title = 'Selectize examples',
  sidebarLayout(
    sidebarPanel(
      wellPanel(
        selectizeInput("movie_title", "Wybierz do 20 filmów", choices = as.list(data$Film), selected = NULL, multiple = TRUE, options = list(maxItems = 20))
      ),
      wellPanel(
        selectInput("xvar", "X-axis variable", axis_vars, selected = "Film"),
        selectInput("yvar", "Y-axis variable", y_axis_vars, selected = "Body_Count")
      )
    ),
    mainPanel(
      br(),
      plotlyOutput("plot", height = "100%"),
      br(),
      br(),
      helpText('Selected movies:'),
      htmlOutput("ex_out")
    )
  )
)