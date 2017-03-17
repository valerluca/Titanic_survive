#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  h1(titlePanel("Would have you survived the titanic disaster?")),
  
  # Sidebar with a slider input for number of age
  sidebarLayout(
    sidebarPanel(
      h3("Please add your informations:"),
      
      sliderInput("Age",
                   "Insert your age:",
                   min = 1,
                   max = 78,
                   value = 30),
    
       selectInput("Gender",
                   "Insert your gender:",
                    c("female", "male"),
                   selected = NULL, multiple = FALSE,
                   selectize = TRUE, width = NULL, size = NULL),
       
       numericInput("Sibling",
                   "Insert the number of siblings who you will  with you:",
                   1, min = 0, max = 10),
       
       selectInput("Class",
                   "Insert the class of the ticket you would have purchased:",
                   c("Third"= "3" ,"Second"= "2","First" = "1"),
                   selected = NULL, multiple = FALSE,
                   selectize = TRUE, width = NULL, size = NULL)

       ),
    
    # Tab 1 for the predicted result  and info tab for tinformation
    mainPanel(
      tabsetPanel(
                  tabPanel("Prediction", 
                   p(h2("Based on your paramaters here what would have happened to you")),br(),
                   h3(textOutput("pred"))), 
                 
                    tabPanel("Documents", 
                           p(h2("Information sheet")),br(),
                           helpText("This application predicts the probility of surviving The Titanic disaster. The paramaters you will enter (Age, Class, Gender, the number of siblings travelling) will be used to predict your score based on the GML model built. for this app we used the datased available on Kaggle."),
                           p(h3("How to use it?")),
                           helpText("Just inser the paramaters on the left panel  and have fun!!"),
                           p(h3("R Code")),
                           helpText("library(dplyr)"),
                           helpText("#get the data"),
                           helpText(" titanicdata<- train"),
                           helpText("%>%	select(Survived,  Sex, SibSp,Age,Pclass) %>% filter(!is.na(Age)) "),
                           helpText(" %>%  mutate( Sex = factor(Sex),Pclass = factor(Pclass)) "),
                                    
                           helpText("#fit the logistic model"),
                           helpText("fit.titanicdata <- glm(Survived ~ . ,data = titanicdata, family = binomial)") , 
                           helpText("# predict the the score by using the model on the paramater user passed"),
                           helpText("predict.model = data.frame(Sex= input$Gender, "),
                           helpText("SibSp = input$Sibling,Age = input$Age, Pclass = input$Class  )"),
                                    
                           helpText("score <- predict(fit.titanicdata, newdata = inpredict.modelpo )"),
                           helpText("#modify the regression  into a probability"),
                           helpText("printf(100*(exp(score)/(1+exp(score))))")
                           
                           
                           
                    )
                  
      )
    )
  )
))


