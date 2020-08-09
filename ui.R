
library(webshot)
library(shiny)
shinyUI(fluidPage(
    titlePanel("Interactive Shiny Application"),
    sidebarLayout(
        sidebarPanel(
            numericInput("numeric", "How Many Random Numbers Should be Plotted? (Max 100)", 
                         value = 20, min = 20, max = 100, step = 1),
            sliderInput("sliderX", "Pick Minimum and Maximum X Values",
                        -100, 100, value = c(-50, 50)),
            sliderInput("sliderY", "Pick Minimum and Maximum Y Values",
                        -100, 100, value = c(-50, 50)),
           
        ),
        mainPanel(
            plotOutput("plot1",brush = brushOpts(
                id = "brush1")),
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut")
            
        )
    )
))
