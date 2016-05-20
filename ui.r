library(shiny)
library(leaflet)

#this is the assignment of columns to the choices argument in selectinput() 
vars <- c(
  "April" = "April",
  "May" = "May",
  "June" = "June")


shinyUI(fluidPage(
  h5("Integrating Leaflet With Shiny"), 
  titlePanel("CAT Rider Count Map"),
  sidebarLayout(
    
    sidebarPanel(
      selectInput("size", "Size", vars, selected = "April")),
      mainPanel(leafletOutput('crossact.map') 
))))

