library(shiny)
library(shinydashboard)
library(leaflet)
source("global.R", local = TRUE)

# Create a Shiny app UI
appUI <- shinyUI({
  
  dashboardPage(
    dashboardHeader(title = "Interactive GSSP App"),
    
    # Sidebar navigation
    dashboardSidebar(
      sidebarMenu(
        # GSSP Marker map
        menuItem(
          "GSSP Map", 
          tabName = "map", 
          icon = icon("map")
        ),
        # GPlates Reconstruction map
        menuItem(
          "GPlates Map",
          tabName = "gplates",
          icon = icon("globe")
        ),
        # About page
        menuItem(
          "About", 
          tabName = "about", 
          icon = icon("info")
        )
      )
    ),
    
    # Page contents
    dashboardBody(
      tabItems(
        # GSSP Marker Map
        tabItem(
          tabName = "map",
          leafletOutput(outputId = "leaflet", height = 900)
        ),
        # GPlates Reconstruction Map
        tabItem(
          tabName = "gplates",
            selectInput(
              inputId = "gplatesconcept",
              label = "Geographical Concept",
              choices = conceptsWithCoords$concept
            ),
            tags$head(
              tags$style(HTML(".leaflet-container { background: #aad3df; }"))
            ),
            leafletOutput(outputId = "gplatesleaflet", height = 900)
        ),
        # About page
        tabItem(
          tabName = "about",
          h1("Info")
        )
      )
    )
  )
})