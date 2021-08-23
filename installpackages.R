packages = c("igraph", "gbRd", "later", "httpuv", "shiny", "shinythemes", "shinydashboard", "leaflet", "readr", "SPARQL", "geojsonio", "stringr")
install.packages(packages)

install.packages("devtools", repos = "https://cloud.r-project.org")
devtools::install_github("https://github.com/xgmachina/DeeptTimeKB_RLib", upgrade = FALSE, force = TRUE)
