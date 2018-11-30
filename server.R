library(tidyverse)


server <- function(input, output, session) {
  output$Data <- renderPrint({
    if (is.null(input$file)) {
      print("Import .csv data file")
    } else {
      inFile <- input$file
      df <- read.csv(
        inFile$datapath,
        header = input$header,
        sep = input$sep,
        row.names =  as.numeric(input$rownames),
        quote = input$quote
        
      )
      
      df <- exclude.status(df) # Exclude columns that have 'Status' in name
      print(df[1:10, 1:10])
      
      output$Plot <- renderPlot({
        plot(df[, 7], df[, 8])
      })
    }
  })
  
  
}