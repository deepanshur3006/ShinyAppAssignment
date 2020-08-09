library(webshot)
library(shiny)
library(dplyr)
data(mtcars)
shinyServer(function(input, output) {
    
    
    filterdata<- reactive({
        
        tempdf<- filter(mtcars,cyl==input$cyl)
        
    }) 
    
    
    output$plot1 <-  renderPlot({
        
        
        plot(filterdata()$mpg,xlab = 'MPG Values', ylab = 'Indexes', 
        main = 'MPG of Cars Having Selected
                   Number of Cylinders')
        
    })
    
    output$maxhp <- renderText({
        
        max(filterdata()$hp) 
        
    })
    
    output$maxwt <- renderText({
        max(filterdata()$wt)
        
    })
    
    
})


