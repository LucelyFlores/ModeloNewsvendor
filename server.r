# Importing libraries.
  library(shiny)
  library(SCperf)

  # Shiny server that receives input, output and session values.
    shinyServer(function(input,output,session){

      # Listening to the click event where "$click" is the id of the button.
      observeEvent(input$click,{

        # Values that arrive from Javascript. You can see them through the server console.
          print(input$click)

        # Values from the mm1k model:  λ, μ, severs and k 😷.
          meand <- input$click$meand
          sd <- input$click$sd
          p <- input$click$p
          c <- input$click$c

        # I send the values to build the model.
          NewsvendorProblem <- Newsboy(m= meand, sd= sd, p= p, c=c)
        # Extracting the values.
          # [Values that will be sent to Javascript]
          # Optimal order-up-to quantity
          Q <- NewsvendorProblem[[1]]
          # Safety stock
          SS <- NewsvendorProblem[[2]]
          #  Expected cost
          ExpC <- NewsvendorProblem[[3]]
          # Expected profit
          ExpP <- NewsvendorProblem[[4]]
          # Coefficient of variation of the demand
          CV <- NewsvendorProblem[[5]]
          # Fill rate
          FR <- NewsvendorProblem[[6]]
          # Safety factor
          z <- NewsvendorProblem[[7]]

          # I create a list that will save all the previous values ​​to send them to Javascript and it receives them as a vector.
          # Unfortunately I didn't know how to send it as an associative vector.
            info <- list(Q, SS, ExpC, ExpP, CV, FR, z)

          # I send the values to Javascript.
          session$sendCustomMessage("handler_stable_state_chart", info)
      })
    })
