shinyServer(function(input, output, session) {
  
  current_user_status <- reactiveValues()
  current_user_status$logged <- FALSE
  current_user_status$current_user <- NULL
  current_user_status$access <- NULL
  
  
  output$ui_page_1 <- renderUI({
    
    if(current_user_status$logged == TRUE){
      if("access_to_page_1" %in% current_user_status$access){
        tagList(
          tableOutput("data_1_for_authorized_user")
        )  
      } else {
        tagList(
          div("No access to this part.", style="color:purple")
        )
      }
      
    } else {
      tagList(
        div("Please log in", style="color:red")
      )
    }
    
  })
  
  output$ui_page_2 <- renderUI({
    
    if(current_user_status$logged == TRUE){
      if("access_to_page_2" %in% current_user_status$access){
        tagList(
          tableOutput("data_2_for_authorized_user")
        )  
      } else {
        tagList(
          div("No access to this part.", style="color:purple")
        )
      }
      
    } else {
      tagList(
        div("Please log in", style="color:red")
      )
    }

  })
  
  
  output$data_1_for_authorized_user <- renderTable({
    head(iris)
  })
  
  output$data_2_for_authorized_user <- renderTable({
    tail(iris)
  })
  
  
  observeEvent(input$button_login, {
    
    if(input$user!="" && input$password!="" && input$user %in% user_db$id && input$password == user_db$password[user_db$id == input$user]){
      current_user_status$logged <- TRUE
      current_user_status$current_user <- input$user
      current_user_status$access <- user_db[user_db$id == current_user_status$current_user,
                                            c("access_to_page_1", "access_to_page_2")] %>%
                                    unlist %>% {.==1} %>% names(.)[.]
      
      output$verification_result <- renderText({
        "Login succeeded"
      })
      
    } else {
      current_user_status$logged <- FALSE
      current_user_status$current_user <- NULL
      
      output$verification_result <- renderText({
        "Login failed"
      })
    }
  })
  
  
})