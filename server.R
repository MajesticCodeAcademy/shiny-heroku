server <- function(input, output,session) {
    observeEvent(input$send,{
        print(shinybrowser::get_all_info())
        print(input$geolocation)
    })
}