# Importing Shiny.
  library(shiny)

# UI.
  shinyUI(fluidPage(
    # Head of the page.
      tags$head(
        # Importing Material-icons.
          tags$link(href="https://fonts.googleapis.com/icon?family=Material+Icons", rel="stylesheet"),
        # Importing Roboto font.
          tags$link(href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400&display=swap", rel="stylesheet"),
        # Importing Material-design.
          tags$link(rel="stylesheet", type="text/css", href="materialize/css/materialize.css"),
        # Own Stylesheet.
          tags$link(rel="stylesheet", type="text/css", href="css/dashboard.css"),
      ),
    # Body of the page.
    # Navbar.
      tags$nav(
        tags$div(class="nav-wrapper white",
          (tags$a(href="#", class="brand-logo", "Shiny ",
            (tags$span(class="brand-text-logo", "from",
            (tags$img(class="img-logo", height="25px", witdh="30px", src="https://d33wubrfki0l68.cloudfront.net/62bcc8535a06077094ca3c29c383e37ad7334311/a263f/assets/img/logo.svg",
                tags$ul(class="side-nav", id="mobile-demo",
                    tags$li(class="right",
                        tags$a(href="https://github.com/developer-jesus-github", "GitHub - Jesús Ángel", class="gray-text",
                            tags$i(class="material-icons left", "cloud")))))))))))),
    # Container.
      tags$div(class="container",
      # Row that will contain a chart and a statistical report.
        tags$div(class="row mt-40",
        # Here we will define the size of the chart so that it works properly on any device..
          (tags$div(class="col s12 m4",
            (tags$div(class="card card-background",
              (tags$div(class="card-content",
            # Tag of the first chart that will contain the variants of "n" clients in the system.
              (tags$canvas(id="stable_state_chart", witdh="400", height="300")))))))),
        # We will define the size of the report container to show properly on any device.
          (tags$div(class="col s12 m8",
            (tags$div(class="card card-background",
              (tags$div(class="card-content",
                (tags$p(class="mb-1", (tags$b("The outputs of the model are:")))),
                (tags$p("Optimal order up to quantity is: ", (tags$span(id="optimal order up quentity")))),
                (tags$p("Safety stock is: ", (tags$span(id="safety stock")))),
                (tags$p("Expected cost is: ", (tags$span(id="expected cost")))),
                (tags$p("Expected profit is: ", (tags$span(id="expected profit")))),
                (tags$p("Coefficient of variation of the demand is: ", (tags$span(id="coefficient of variation of the demand")))),
                (tags$p("Fill rate is: ", (tags$span(id="fill rate")))),
                (tags$p("Safety factor is: ", (tags$span(id="safety factor")))),
               # (tags$p("The mean time spend in the server is: ", (tags$span(id="mean-time-spend-server")))),
                #(tags$p("The mean time spend in the queue when there is queue is: ", (tags$span(id="mean-time-spend-queue-where-queue")))),
                #(tags$p("The throughput is: ", (tags$span(id="throughput"))))
              ))))))),
        # Close of the row that contains the chart and report.
          # Row that will contain a button.
            tags$div(class="row",
              (tags$div(class="card card-background col s12",
                (tags$div(class="card-content",
                  (tags$div(class="input-field col s3",
                      (tags$input(type="text", id="meand")),
                        (tags$span(class="helper-text", "Meand (media)")))),
                    (tags$div(class="input-field col s3",
                      (tags$input(type="text", id="sd")),
                        (tags$span(class="helper-text", "Sd (desviacion estandar)")))),
                    (tags$div(class="input-field col s3",
                      (tags$input(type="text", id="p")),
                        (tags$span(class="helper-text", "P (precio de venta)")))),
                    (tags$div(class="input-field col s3",
                      (tags$input(type="text", id="c")),
                        (tags$span(class="helper-text", "C (costo unitario)")))),
                    (tags$button(onclick="validate_information()", id="click","Generate report", class="btn waves-light mr-1 mb-2 right"))))))
              )
          # Close of the row that contains a button.
        ),
    # Close of the container fluid.

    # Scripts
      # jQuery.
        tags$script(src="http://code.jquery.com/jquery-3.4.1.min.js", integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=", crossorigin="anonymous"),
      # ChartJs.
        tags$script(src ="libs/chart.js/dist/Chart.js"),
      # Script that will generate the graph.
        tags$script(src="scripts/charts/stable_state_chart.js"),
      # Event handler.
        tags$script(src="scripts/events/handlers.js")
    ))
