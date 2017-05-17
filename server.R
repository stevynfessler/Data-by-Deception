library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$map <- renderLeaflet({
    leaflet() %>% 
    addTiles() %>% 
    addMarkers(lng = -119.8489, lat = 34.4140, popup = "University of Casual Sex and Beer")
})
    }
      )