server <- function(input, output,session) {
    observeEvent(input$send,{
        print(shinybrowser::get_all_info()$device)
        print(input$lat)
        print(input$long)
    })
}