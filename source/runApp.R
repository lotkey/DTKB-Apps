library(shiny)
source("appUI.R", local = TRUE)
source("appServer.R", local = TRUE)

# Create a Shiny app from appUI() (appUI.R) and appServer() (appServer.R)
shinyApp(ui = appUI, server = appServer)