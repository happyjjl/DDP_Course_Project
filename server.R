#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Load the states data that will be used to create map displaying all US states 
    states <- map_data("state")
    selectState <- reactive({
        subset(states, region %in% input$selectState)
    })
    
    output$mapPlot <- renderPlot({
        
        # Draw the US map where the seclected state is highlighted in pink
        ggplot(data = states) + geom_polygon(aes(x = long, y = lat, group = group), fill = "white", color = "black") + coord_fixed(1.5) + guides(fill=FALSE) + geom_polygon(data = selectState(), aes(x = long, y = lat, group = group), fill = "lightpink")
        
    })
    
})