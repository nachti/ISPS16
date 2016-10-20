library(shiny)
library(ggplot2)
data(iris)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("Explore iris data"),
   
   sidebarLayout(
      sidebarPanel(
         # sliderInput("n",
         #             "Number",
         #             min = 1,
         #             max = 50,
         #             value = 30)
        selectInput("spec", 
                    label = "Choose a species",
                    choices = levels(iris$Species),
                    selected = levels(iris$Species)[1]),
        selectInput("x", 
                    label = "Choose an x variable",
                    choices = names(iris),
                    selected = names(iris)[1]),
        selectInput("y", 
                    label = "Choose a y variable",
                    choices = names(iris),
                    selected = names(iris)[3]),
        selectInput("col", 
                    label = "Choose a color variable",
                    choices = names(iris),
                    selected = names(iris)[2]),
        checkboxInput("smooth",
                      label = "add a smooth function?",
                      value = TRUE),
        radioButtons("ggsmm",
                     label = "Which method shoulg be used for smoothing?",
                     choices = c("lm", "glm", "loess"),
                     selected = "loess")
      ),
      
      # Show plot
      mainPanel(
         plotOutput("irisplot")
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   output$irisplot <- renderPlot({
     iss <- iris[iris$Species == input$spec,]
     p1 <- ggplot(iss, aes_string(x = input$x, y = input$y,
                                  col = input$col)) +
       geom_point()
     if(input$smooth){
       p1 <- p1 + geom_smooth(method = input$ggsmm)
     }
     print(p1)
   })
})

# Run the application 
shinyApp(ui = ui, server = server)

