shinyUI(fluidPage(
        titlePanel("Predict Grip Strength, right arm"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Predict the grip strength from scientific data."),
                        radioButtons("sex", 
                                     label = "Sex",
                                     choices = list("male" = "M", "female" = "W"
                                     ),selected = "M"),
                        numericInput("age", 
                                     label = "Age", 
                                     value = 40), 
                        sliderInput("high", 
                                    label = "Heigth in cm",
                                    min = 140, max = 195, value = 170),
                        sliderInput("kg", 
                                    label = "Weigth in kg",
                                    min = 30, max = 140, value = 70)
                       
                ),
                
                mainPanel(
                        p("Based on your age, weigth(kg), heigth(cm), sex and age you can calculate your estimated grip strength in kg"),
                        h3("Scientific basis"),
                        p("For this application I calculated a new simplified prediction model based on the data of 750 volunteers, investigated in 2012 :Klum, M. et al. Normative data on wrist function. J. Hand Surg. Am. 37, 2050–60 (2012)"),
                        p("Calculation resulted in a predictice model, multivariate regression. With this model grip force can be predicted based on input of four parameter."),
                        h3("How to do"),
                        p("On the left side you choose your sex, put in your age and regulate the sliders according to 
      your height and weight. Than you find your predicted hand strength below"),
                        textOutput("text1"),
                        textOutput("text2"),
                        textOutput("text3"),
                        textOutput("text4"),
                        h3(textOutput("text5")),
                        br(),
                        br(),
                        plotOutput("map"),
                        br(),
                        p("Plot shows the original data. The black point is the predicted force for specific weigth. Change parameter and see how predicted force will change."),
                        p("Can you give the effect, positive or negative, for each parameter ?")
                        )
        )
))