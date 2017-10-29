shinyServer(function(input, output, session) {
  
  current_user_status <- reactiveValues()
  current_user_status$logged <- FALSE
  current_user_status$current_user <- NULL
  
  
  
  output$ui_page_1 <- renderUI({
    if(current_user_status$logged == TRUE){
      tagList(
        div(paste("Welcome", current_user_status$current_user, sep=" "), style="color:green"),
        tableOutput("data_for_authorized_user")
      )
    } else {
      tagList(
        div("Please log in", style="color:red")
        )
    }
  })
  
  
  output$data_for_authorized_user <- renderTable({
    head(iris)
  })
  
  
  observeEvent(input$button_login, {
    
    if(input$user!="" && input$password!="" && input$user %in% user_db$id && input$password == user_db$password[user_db$id == input$user]){
      current_user_status$logged <- TRUE
      current_user_status$current_user <- input$user
      
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