#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Load libraries used for application
library(shiny)
library(ggplot2)
library(maps)
library(mapdata)

# Load the states data that will be used to create map displaying all US states
states <- map_data("state")

# Load the Shiny web application such that there is no state selected to start and a blank text box is displayed
stateSelection <- c("")

# Populate the drop down with all US states

stateSelection <- c(stateSelection, unique(states$region))

# Define UI for application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("USA State Selection"),
    
    # Sidebar with drop down to select specific US state from list of all states
    # Display instructions to use application
    sidebarLayout(
        sidebarPanel(
            "Select a state from the below list of United States to display on the map at right:",
            selectInput("selectState", "", stateSelection, selected = NULL, multiple = FALSE),
            h4("Shiny Application Instructions:"),
            "This Shiny application allows you to select a state from the drop down list above. The slected state is then highlighted on the map of the United States at right."
        ),
        
        # Show the map
        mainPanel(
            h4("The United States of America Map"),
            plotOutput("mapPlot")
        )
    )
))