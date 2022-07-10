server <- function(input, output,session) {
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
        print(shinybrowser::get_all_info()$device)
        print(input$lat)
        print(input$long)
    })
}