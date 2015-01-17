library(shiny)
library(caret)
library(randomForest)
library(ggplot2)
load("NYSunData.Rda")
load("FinalModel.Rda")


shinyServer(function(input, output) {
        
        EstimateValue <- function(){
                
                EstInp <-
                        data.frame(
                                Sector = input$CType, 
                                Purchase.Type = input$AcqMethod, 
                                Inverter.Manufacturer = input$InvMan,
                                PV.Module.Manufacturer = input$PVMan,
                                Total.Nameplate.KW = input$Size 
                                                     )
                EstOut <<- predict(FitTest, EstInp)
                
                }
                                
                output$distPlot <- renderPlot({  
                        
                        ChartData <- NYSunData[NYSunData$Sector == input$CType, ]
                        
                        Cost <- ggplot(ChartData,aes(x = Project.Cost, fill = as.factor(Date.Install)))+
                                geom_histogram(alpha = 0.50)+
                                scale_y_continuous(name="Number of Installations")+
                                scale_x_continuous(name="Installed Cost (US$)")+
                                scale_fill_discrete(name = "Installation Year")+
                                geom_vline(xintercept = EstimateValue())
                        suppressMessages(print(Cost))
                        })
                             
        output$Estimate <- renderText( 
                sprintf("$ %3.0f", EstimateValue())
                
                )
        
})

