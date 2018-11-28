## app.R ##
library(shiny)
library(shinydashboard)
source(c('ui.R','server.R','statistics.R',  local = TRUE))

shinyApp(ui, server)