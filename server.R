#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {



  titanicdata<- read.csv("train.csv", stringsAsFactors = F) %>%	select(Survived,  Sex, SibSp,Age,Pclass) %>% filter(!is.na(Age)) %>%  mutate( Sex = factor(Sex),Pclass = factor(Pclass)) 
  
  fit.titanicdata <- glm(Survived ~ . ,data = titanicdata, family = binomial)  
  
    modelpred <- reactive({
    inpo = data.frame(Sex= input$Gender, SibSp = input$Sibling,Age = input$Age, Pclass = input$Class  )
    score <- predict(fit.titanicdata, newdata = inpo )
    sprintf("%1.1f%%", 100*(exp(score)/(1+exp(score))))
      
                      })
  

  
  # Display your survavor rate
  
  output$pred <- renderText({
    if( modelpred() >= 0.11111 &&  modelpred() < 40) { paste("Oh nooo, bad news, your chance of remaining alive would have been very slim, your survivor rate is:", modelpred())}
    else if( modelpred() >= 40 &&  modelpred() <= 60 ) { paste("Well, well, it's difficult to say what would have happened to you, your chance of surviving the disaster would not have been great:", modelpred())}
  else if( modelpred() > 60 &&  modelpred() <= 99.99) {   paste("Good news, you would have had a good chance of surviving, in fact your survivor rate is:", modelpred())}
    else " "
                          })
  
  
 
  
})

 
