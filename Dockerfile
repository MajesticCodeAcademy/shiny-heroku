FROM virtualstaticvoid/heroku-docker-r:shiny

ENV PORT=8080

RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('shinybrowser')"
RUN R -e "install.packages('shinythemes')"

CMD ["/usr/bin/R", "--no-save", "--gui-none", "-f", "/app/app.R"]
