library(shiny)
source("appUI.R", local = TRUE)
source("appServer.R", local = TRUE)

shinyApp(ui = appUI, server = appServer)