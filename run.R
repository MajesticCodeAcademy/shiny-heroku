source("app/global.R")
source("app/ui.R")
source("app/server.R")

port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = getwd(),
  host = '0.0.0.0',
  port = as.numeric(port)
)
