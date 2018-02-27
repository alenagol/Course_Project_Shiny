#title: "Shiny Assignment."
#author: "Elena Golovanova"
#date: "February 24, 2018"
#This application shows charts with average wages based on OECD data. 
#Charts can be displayed by year or by location.

library(shiny)
data_live<-read.csv('DP_LIVE_21022018210244477.csv')
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Average wages history:"),
  
  ("This application shows charts with average wages. You can display a chart by year or by location."),
    # Show two tabs with different charts
    mainPanel(
      tabsetPanel(
        tabPanel("Year",sidebarPanel(
          sliderInput("year",
                      "Select year:",
                      min = 1990,
                      max = 2016,
                      value = 1)), 
          plotOutput("distPlot1")), 
        tabPanel("Location", sidebarPanel(
          selectInput("loc", "Select location:", 
         choices = levels(data_live$LOCATION)
        )),
          plotOutput("distPlot2"))
        
      )
    )
    
  
))
