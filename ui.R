library(webshot)
library(shiny)
library(dplyr)
data(mtcars)
shinyUI(fluidPage(
    titlePanel("Interesting mtcars Analysis"),
    sidebarLayout(
        sidebarPanel(
            h3('Choose the number of cylinders'),
            radioButtons("cyl", "Number of Cylinders", 
                         choices = c(4,6,8))
            
            
        ),
        mainPanel(
            h3('Here is some trivia!'),
            h3('MPG Values For Selected Cars'),
            plotOutput("plot1"),
            h3('Maximum Horse Power'),
            textOutput("maxhp"),
            h3("Maximum Weight"),
            textOutput("maxwt"),
            h3('Documentation for using app: https://rpubs.com/deepanshu_rustagi88/647435')
        )
    )
))
