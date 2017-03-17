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
                   "Insert the number of siblings will embark with you:",
                   1, min = 0, max = 10),
       
       selectInput("Class",
                   "Insert the class of the tiket you would have purchased:",
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
                           helpText("This application predicts the probility of surviving The Titanic disaster. The paramaters you will enter (Age, Class, Gender, the number of siblings travelling) will be used to predict your score based on the GML model built."),
                           p(h3("How To use it?")),
                           helpText("The app outorefresh itself when you change paramaters to give a new prediction: it's' Fun!!!")
                    )
                  
      )
    )
  )
))


