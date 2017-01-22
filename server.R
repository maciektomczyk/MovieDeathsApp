library(shiny)
library(dplyr)
library(httr)
library(plotly)
library(ggthemes)

source("updateHtmlList.R")

result <<- ""

shinyServer(
  function(input, output) {
    movieList <- reactive({
      input$movie_title
    })

    output$ex_out <- renderUI({
      result <- '<ul>'
      imdbList <- updateLiElement(movieList())
      
      for(i in imdbList) {
        result <- paste(result, i)
      }
      result <- paste(result, '</ul>')
      
      tags$div(
        HTML(result)
      )
    })
    
    output$"plot" <- renderPlotly({
      if (!is.null(movieList())) {
        plotData <- data %>%
          filter(Film %in% movieList())
      } else {
        return()
      }
      
      xvar <- input$xvar
      yvar <- input$yvar
      xvar_name <- names(axis_vars)[axis_vars == xvar]
      yvar_name <- names(axis_vars)[axis_vars == yvar]
      
      if (class(data[,xvar]) == "factor" || class(data[,yvar]) == "factor") {
        ggplot(plotData, aes_string(x= xvar, y= yvar)) +
          geom_bar(stat = "identity", fill= "#3366FF") +
          labs(x= xvar_name,y= yvar_name) +
          theme_hc() +
          scale_colour_hc() +
          theme(axis.text.x = element_text(angle = 90))
      } else {
        ggplot(plotData, aes_string(x= xvar, y= yvar)) +
          geom_point() +
          theme_hc()
      }
    })
  }
)