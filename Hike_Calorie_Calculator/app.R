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
    titlePanel("Hiking Calorie Calculator"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            h3("Enter values here"),
            numericInput("weight", label = "Body Weight", value = 150),
            numericInput("pack", label = "Pack Weight", value = 30),
            numericInput("terrain", label = "Terrain Factor", value = 1.2),
            numericInput("grade", label = "Grade (%)", value = 8, max = 90, min = -90),
            numericInput("speed", label = "Walking Speed (mph)", value = 3),
        ),

        mainPanel(
           textOutput("calories")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    w <- reactive(input$weight)
    L <- reactive(input$pack)
    t <- reactive(input$terrain)
    g <- reactive(input$grade)
    s <- reactive(input$speed)
        
#    if (g >= 0) {
#        calsBurned <- w/2.2*60/4184 * 20.1*(3.05 + (w/2.2 + L/2.2) / w*2.2 * t * (0.32 * g + 3.28 +
#                                                                                      (1 + 0.19 * g) * 2.66 * (s*1609/3600)*(s*1609/3600)))
#    } else {
#        
#        calsBurned <- w/2.2*60/4184 * 20.1*(3.05 + 0.73 * (w/2.2 + L/2.2) / w*2.2 * t * 
#                                                (3.28 + 2.66 * (s*1609/3600)*(s*1609/3600)))
#    }
    
    output$calories <- renderText({
        calsBurned <- round(w()/2.2*60/4184 * 20.1*(3.05 + (w()/2.2 + L()/2.2) / w()*2.2 * 
            t() * (0.32 * g() + 3.28 + (1 + 0.19 * g()) * 2.66 * (s()*1609/3600)*(s()*1609/3600))), digits = 2)

        paste("While hiking at ", s(), "mph with a ", L(), "lb. pack on a(n) ", g(), 
              "% grade, you would burn ", calsBurned, " calories per hour.")

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
