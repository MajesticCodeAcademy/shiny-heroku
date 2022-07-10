server <- function(input, output,session) {
  rv <- reactiveValues()
  output$lat <- renderText({
    input$lat
  })
  
  output$long <- renderText({
    input$long
  })
  
  output$geolocation <- renderText({
    input$geolocation
  })
    observeEvent(input$send,{
      rv$device_tag <- data.frame("Device" = shinybrowser::get_all_info()$device %>% as.character(),
                                  "OSname" = shinybrowser::get_all_info()$os$name %>% as.character(),
                                  "OSver" = shinybrowser::get_all_info()$os$version %>% as.character(),
                                  "ScreenWidth" = shinybrowser::get_all_info()$dimensions$width %>% as.character(),
                                  "ScreenHeight" = shinybrowser::get_all_info()$dimensions$height %>% as.character(),
                                  "Time" = Sys.time(),
                                  "Lat" = ifelse(is.null(input$lat),30.3366144,input$lat),
                                  "Long" = ifelse(is.null(input$long),-86.1995008,input$long),
                                  "Geo" = ifelse(is.null(input$geolocation),FALSE,input$geolocation))
      print(rv$device_tag)
    })
}