ui <- fluidPage(
    titlePanel("Piedmont PArk Activity App"),
    selectInput("activity",
                "What activity brouht you to the beltline today?",
                choices = c("walk","run","sport","other")),
    actionButton("send","Send us your your answer!"),
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
