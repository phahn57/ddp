# server.R
## Load regression model. THe model is calculated outside this application and saved as fit.rda

library(ggplot2)
library(stats)
load("fit.rda")
klum4<-read.csv("klum4.csv",header=TRUE,sep=";")
## Load original data

shinyServer(function(input, output) {
        output$text1 <- renderText({ 
                paste("Your age: ", input$age)})
        output$text2 <- renderText({ 
                        paste("Your heigth:", input$high)})   
        output$text3 <- renderText({ 
                        paste("Your weigth:", input$kg)})
        output$text4 <- renderText({ 
                
                paste("Your sex:",input$sex)
                })
        output$text5 <- renderText({
                a<-data.frame(Geschlecht=input$sex,Groesse=input$high,Gewicht=input$kg,alter=input$age)
                b<-round(predict(fit,a),digits=0)
                paste("Your predicted force [kg]:",b)
                }) 
        output$map <- renderPlot({
                a<-data.frame(Geschlecht=input$sex,Groesse=input$high,Gewicht=input$kg,alter=input$age)
                b<-round(predict(fit,a),digits=0)
                p<-ggplot(klum4, aes(Gewicht,jare))+geom_point(aes(colour=Geschlecht))+geom_point(aes_string(x=input$kg,b),colour="black",size=3)
                p<-p+xlab("Weigth")+ylab("Force(kg)")+ggtitle("Original data, point: predicted force")
                p<-p+scale_colour_discrete(name="Sex")
                print(p)
                })
        
                
})
