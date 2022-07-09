source("global.R")
source("ui.R")
source("server.R")

options(shiny.port = 8080)
runApp(ui,server)
