


library(webshot)
    library(shiny)
    shinyServer(function(input, output) {
        
   
    xlab<-'Random Numbers X Axis'
    ylab<-'Random Numbers Y Axis'
    main<-'Plot of Y and X Random Numbers'
        
    output$plot1 <-  renderPlot({
          
              number_of_points <- input$numeric
              minX <- input$sliderX[1]
              maxX <- input$sliderX[2]
              minY <- input$sliderY[1]
              maxY <- input$sliderY[2]
              
              
              dataX <- runif(number_of_points, minX, maxX)
              dataY <- runif(number_of_points, minY, maxY)
              datadf<-data.frame(dataX,dataY)
         
              plot(datadf$dataX, datadf$dataY, xlab = xlab, ylab = ylab, main = main
                   ,  xlim = c(-100, 100), ylim = c(-100, 100))
              
              if(!is.null(model())){
                  abline(model(), col = "blue", lwd = 2)
                    }
         
        })
        
       model <- reactive({
          
            brushed_data <- brushedPoints(datadf,input$brush1,
                                          xvar = "dataX", yvar = "dataY")
            if(nrow(brushed_data) < 2){
                return(NULL)
            }
            lm(dataY~dataX, data = brushed_data)
        })
       
        
        output$slopeOut <- renderText({
            if(is.null(model())){
                "No Model Found"
            } else {
                model()[[1]][2]
            }
        })
        
        output$intOut <- renderText({
            if(is.null(model())){
                "No Model Found"
            } else {
                model()[[1]][1]
            }
        })
        
        
    })
