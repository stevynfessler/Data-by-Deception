library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$map <- renderLeaflet({
    m = leaflet(df) %>% 
    addTiles()
    m %>% setView(lng = -122.4194, lat = 37.7749, zoom = 10)
    m %>% addCircles(~X, ~Y, popup = df$Description)
    
})
  
  output$timeElapsed <- renderText({
    "The amount of time elapsed is:"
  })
    }
      )