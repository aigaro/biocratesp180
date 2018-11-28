library(shinydashboard)

header <- dashboardHeader(# Header for dashboard ####
                          title = 'Biocrates p180 kit')

sidebar <- dashboardSidebar(# Sidebar items ####
                            sidebarMenu(
                              menuItem( # Menu items
                                text = 'Upload .csv file',
                                tabName = 'upload',
                                icon = icon('upload')
                              ),
                              menuItem(
                                text = 'Statistics',
                                tabName = 'statistics',
                                icon = icon('chart-bar')
                              ),
                              menuItem(
                                text = 'Plots',
                                tabName = 'plots',
                                icon = icon('chart-pie')
                              )
                            ))

body <- dashboardBody(# Dashboard body
  tabItems(
    tabItem(tabName = "upload", # Dashboard body item upload ####
            fluidRow(
              box(
                width = 12,
                fileInput(
                  inputId = "file",
                  label = "Choose a file",
                  accept = c(".csv")
                ),
                tableOutput(outputId = "Contents"),
                verbatimTextOutput(outputId = "Data"),
                # Input: Checkbox if file has header ----
                checkboxInput("header", "Header", TRUE),
                # Input: Select separator ----
                radioButtons("sep", "Separator",
                             choices = c(Comma = ",",
                                         Semicolon = ";",
                                         Tab = "\t"),
                             selected = ","),
                
                # Input: Select quotes ----
                radioButtons("quote", "Quote",
                             choices = c(None = "",
                                         "Double Quote" = '"',
                                         "Single Quote" = "'"),
                             selected = '"'),
                
                # Horizontal line ----
                tags$hr(),
                
                # Input: Select number of rows to display ----
                radioButtons("disp", "Display",
                             choices = c(Head = "head",
                                         All = "all"),
                             selected = "head")
              )
            )),
    tabItem(tabName = 'statistics',
            h1('Statistics tab')
            ,
            statistics_text 
            ),
    
    tabItem(tabName = 'plots',
            h2('Plots'),
            fluidRow(box(width = 12,
                         plotOutput(outputId = "Plot")
            )))
  ))


ui <- dashboardPage(header = header,
                    sidebar = sidebar,
                    body = body)