library(shiny)
library(leaflet)
source("map.R", local = TRUE)
source("global.R", local = TRUE)
source("gPlates.R", local = TRUE)

# Shiny app server
appServer <- function(input, output, session) {
  
  # Plot the GSSP Marker map
  output$leaflet <- renderLeaflet({
    map()
  })
  
  # Plot the GPlates Reconstruction map
  output$gplatesleaflet <- renderLeaflet({
    
    # Gather input
    index <- match(input$gplatesconcept, conceptsWithCoords$concept)
    concept <- conceptsWithCoords$concept[index]
    time <- conceptsWithCoords$time[index]
    long <- conceptsWithCoords$longitude[index]
    lat <- conceptsWithCoords$latitude[index]
    
    # Select model based on time
    if (time <= 1100) {
      if (time <= 750) {
        getLeafletMap(concept, time, long, lat, "PALEOMAP")
      }
      else {
        getLeafletMap(concept, time, long, lat, "RODINIA2013")
      }
    }
    else { # No coastline reconstruction
      coords <- substr(coordContents, nchar("{\"type\":\"MultiPoint\",\"coordinates\":[[") + 1, nchar(coordContents) - 3)
      coords <- strsplit(coords, ",")[[1]]
      longitude <- as.numeric(coords[1])
      latitude <- as.numeric(coords[2])
      
      gsspIcon <- makeIcon(
        iconUrl = "http://www2.cs.uidaho.edu/~max/image/gssp.png",
        iconWidth = 20, iconHeight = 32,
        iconAnchorX = 10, iconAnchorY = 32  
      )
      
      popup <- paste("<b><i>", concept, "</b></i><br><b>Longitude: </b>", longitude, "°<br><b>Latitude: </b>", latitude, "°<br><b>Age: </b>", time, " Ma", sep = "")
      
      leaflet() %>%
        addMarkers(lng = long, lat = lat, icon = gsspIcon, popup = popup)
    }
    
  })
}