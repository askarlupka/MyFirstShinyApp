library(shiny)

ui <- fluidPage(
  # This is the layout function that sets up the bastic visual structure of the page

  # selectInput is an input control that allows the user to interact with the app by providing a value
  selectInput("dataset",
              label = "Dataset", #The box is labeled "Dataset"
              choices = ls("package:datasets")), #The choices are a list of datasets
  #Output controls that tell Shiny where to put rendered output:
  verbatimTextOutput("summary"), #Displays code
  tableOutput("table") #Displays tables
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
