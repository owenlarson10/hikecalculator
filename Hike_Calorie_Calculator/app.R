#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h3("Enter values here"),
            numericInput("weight", label = "Body Weight", value = NA),
            numericInput("pack", label = "Pack Weight", value = NA),
            numericInput("terrain", label = "Terrain Factor", value = 1),
            numericInput("grade", label = "Grade (%)", value = 0, max = 90, min = -90),
            numericInput("speed", label = "Walking Speed (mph)", value = 3),
        ),

        mainPanel(
           textOutput("calories")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$calories <- renderText({
        paste("Your walking speed is ", input$speed)

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
