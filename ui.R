library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Time Test"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
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
    
  
  
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("map"),
      textOutput("timeElapsed")
    )
  )
))