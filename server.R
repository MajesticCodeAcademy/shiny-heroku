server <- function(input, output,session) {
    observeEvent(input$send,{
      cbind.data.frame(
        data.frame(shinybrowser::get_all_info()),
        data.frame(input$lat),
        data.frame(input$long)
      )
    })
}