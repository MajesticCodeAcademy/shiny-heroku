ui <- fluidPage(theme = shinytheme("slate"),
                br(),
                br(),
                fluidRow(
                  column(12,align = "center",
    titlePanel("Ponce City Market Activity")
                )),
    br(),
    fluidRow(
    column(12,align = "center",
    selectInput("activity",
                "What activity brought you to PCM today?",
                choices = c("Eat","Drink","Shop","Walk")),
    selectInput("often",
                "How often do you come to PCM?",
                choices = c("Often","Sometimes","Never (First time)")),
    )),
    fluidRow(
    column(12,align = "center",
    actionButton("send","Send us your your answer!")
    )),
    shinybrowser::detect(),
    tags$script('
      $(document).ready(function () {
        navigator.geolocation.getCurrentPosition(onSuccess, onError);
              
        function onError (err) {
          Shiny.onInputChange("geolocation", false);
        }
              
        function onSuccess (position) {
          setTimeout(function () {
            var coords = position.coords;
            console.log(coords.latitude + ", " + coords.longitude);
            Shiny.onInputChange("geolocation", true);
            Shiny.onInputChange("lat", coords.latitude);
            Shiny.onInputChange("long", coords.longitude);
          }, 1100)
        }
      });
              '),
    tags$script(src="http://pv.sohu.com/cityjson?ie=utf-8"),
    tags$script('$( document ).on("shiny:sessioninitialized", function(event) {Shiny.setInputValue("too",returnCitySN["cip"]);});')
    )
