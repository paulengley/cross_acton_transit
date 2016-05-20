library(shiny) 
library(googlesheets)
library(leaflet)

#google authorization, token storage, file acquiztion and assignment

gs_auth()
ttt <- gs_auth()
saveRDS(ttt, "ttt.rds")
gs_auth(token = ttt)
gs_auth(token = "ttt.rds")
crossact <- gs_title("crossact")
crossact <- crossact%>% gs_read_csv()



shinyServer(
  function(input, output, session){
    
#this observer is used to maintain the circle size and is part of connecting
#it to the selectInput and assigning the radius
    observe({
      
      sizeBy <- input$size
      radius <- crossact[[sizeBy]]
      
    output$crossact.map <-  renderLeaflet({
      crossact.map <- leaflet(crossact) %>% 
        addTiles('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png')
      crossact.map%>% setView(-71.43381, 42.48649, zoom = 17)
      crossact.map %>% addCircleMarkers(~lng, ~lat, popup=~crossact$name, weight = 1,radius = radius, 
                                        color="#ffa500", stroke = TRUE, fillOpacity = 0.6)
    })
  })
})
