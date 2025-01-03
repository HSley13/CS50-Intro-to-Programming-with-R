library(shinydashboard)
library(DT)
library(shiny)
library(plotly)
library(shinythemes)

ui <- dashboardPage(
  dashboardHeader(title = "Final Project"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Data", tabName = "data", icon = icon("table")),
      menuItem("About", tabName = "about", icon = icon("info"))
    )
  ),
  dashboardBody()

)

server <- function(input, output) {
}

shinyApp(ui = ui, server = server)
