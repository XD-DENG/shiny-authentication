# shiny-authentication

This is a minimal example sharing how to implement authentication in Shiny applications.


## Main Idea

The main ideas are 

[1] to save the authentication status (whether logged in successfully, ID of the user who logged in for current session) in a session-specific array (using `reactiveValues()`)

[2] The UI containing key contents (which is supposed to be open only to users who logged in) will be rendered using `uiOutput` + `renderUI()`. Within `renderUI()`, we can use `if..else...` to check the authentication status, then render different contents for different authentication status.

<p align="center">
<img src="https://raw.githubusercontent.com/XD-DENG/shiny-authentication/master/idea_chart.png" alt="chart" style="width:40%;"/>
</p>

## Note
Please note this is a minimal example. More technical details, like password hashing and proper password storage, are not covered here.
