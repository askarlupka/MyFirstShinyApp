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
  #Output$ID indicates a recipe
  output$summary <- renderPrint({ #Render function wraps the code. Each render{Type} function is designed to produce a specific output. renderPrint here displays a statistical summary with fixed-width (verbatim) text
    # dataset <- get(input$dataset, "package:datasets") # Avoid duplicated code; create a reactive expression instead
    summary(dataset)
  })

  output$table <- renderTable({ #Render table is paired with tableOutput() to show the input data in a table
    # dataset <- get(input$dataset, "package:datasets") # Avoid duplicated code; create a reactive expression instead
    dataset
  })
}

shinyApp(ui, server)
