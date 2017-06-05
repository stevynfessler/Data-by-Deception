library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "San Francisco Crimes"),
  dashboardSidebar(
    
    sidebarMenu(
      fluidRow(
        selectInput("categories",
                    "Select Crime Category",
                    c("Public Disturbance", "Private Property Disturbance", "Property Destruction/Theft", "Drugs/Narcotics/Substance", "Violent Crimes", "Sexual Crimes", "Financial Crimes")
        )
      ),
      
      fluidRow(
        sliderInput("time",
                    "Select time interval:",
                    min = 0,
                    max = 24,
                    value = c(3, 6))
      )
      
      
      
    )
  ),
  dashboardBody(
    
    mainPanel(
      leafletOutput("map"),
      textOutput("timeElapsed")
    )
  )
)

server <- function(input, output) { 
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

shinyApp(ui, server)