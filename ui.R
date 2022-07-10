ui <- fluidPage(theme = shinytheme("slate"),
                br(),
                br(),
                fluidRow(
                  column(12,align = "center",
    titlePanel("Ponce City Market (PCM) Activity")
                )),
    fluidRow(
      column(12,align = "center",img(src='https://assets3.thrillist.com/v1/image/2859901/1200x600/scale;', align = "center", height="50%", width="50%"))
    ),
    br(),
    fluidRow(
    column(12,align = "center",
           h3("Feel free to provide feedback below!"),
           br(),
    selectInput("activity",
                "What activity brought you to PCM today?",
                choices = c("Eat","Drink","Shop","Walk","Other")),
    selectInput("often",
                "How often do you come to PCM?",
                choices = c("Often","Sometimes","Never (First time)")),
    )),
    fluidRow(
    column(12,align = "center",
    actionButton("send","Send ",icon = icon("refresh"))
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
