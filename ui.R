ui <- fluidPage(

   fluidRow(
     column(6, offset=3,
        br(),
        wellPanel(
            textInput("user",
                      "User ID:",
                      width = "70%"),
            passwordInput(inputId = 'password',
                          label = 'Password',
                          width = "70%"),
            
            actionButton("button_login", "Login"),
            br(),
            "Please try 'user1' with password '123' or 'user2' with password '456' to log in.",
            hr(),
            strong(textOutput("verification_result"))
            )
     )
   ),
   
   fluidRow(
     column(8, offset = 2,
        wellPanel(
          uiOutput("ui_page_1")
        )
     )
   )
)