#

library(shiny)
#reading data from csv file
data_live<-read.csv('DP_LIVE_21022018210244477.csv')


# Define server logic required to draw histograms
shinyServer(function(input, output) {
  output$distPlot1<- renderPlot({
    # generate dataset based on input$year from ui.R
    datasetInput<-data_live[data_live$TIME==input$year,]
    datasetOrder<-datasetInput[order(datasetInput$Value),]
    # draw the histogram for the specified year
    barplot(datasetOrder$Value,names.arg=datasetOrder$LOCATION,
            main="Average wages in chosen year:",xlab="Location",ylab="Value",col="blue")
  })
  output$distPlot2<- renderPlot({
    # generate dataset based on input$loc from ui.R
    datasetInput<-data_live[data_live$LOCATION==input$loc,]
    datasetOrder<-datasetInput[order(datasetInput$Value),]
    # draw the histogram for the specified location
    barplot(datasetOrder$Value,names.arg=datasetOrder$TIME,
            main="Average wages in chosen location:",xlab="Year",ylab="Value",col="red")
  })
  
})
